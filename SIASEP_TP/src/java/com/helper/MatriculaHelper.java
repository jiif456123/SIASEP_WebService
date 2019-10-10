package com.helper;

import com.DTO.ListaAlumnoMatriculaDTO;
import com.DTO.ListaMatriculaDTO;
import com.DTO.MatriculaDTO;
import com.utilities.HibernateUtil;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.transform.Transformers;

public class MatriculaHelper {
    
    public MatriculaHelper() {
    }
    
    public List<ListaMatriculaDTO> getListPeriodo() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT id_periodo_anual, fec_inicio_anual "
                                           + "FROM periodo_anual "
                                           + "ORDER BY fec_inicio_anual DESC").setResultTransformer(Transformers.aliasToBean(ListaMatriculaDTO.class));
        List<ListaMatriculaDTO> resultList=query.list();
        transaction.commit();
        session.close();
        return resultList;
    }
    public List<ListaMatriculaDTO> getListMatriculaByHabilitado(int fkidPeriodoAnual) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT mat.id_matricula, mat.codigo_matricula, peralu.codigo_alumno, CONCAT(per.apellido_paterno,' ',per.apellido_materno,', ',per.primer_nombre) as nombre_alumno, \n" +
                                             "	     mat.fec_realizada\n" +
                                             "FROM   matricula as mat INNER JOIN per_alumno as peralu ON (mat.fkid_per_alumno = peralu.id_per_alumno) \n" +
                                             "	     INNER JOIN persona as per ON (peralu.fkid_persona = per.id_persona) \n" +
                                             "	     INNER JOIN estado_matricula as esma ON (mat.fkid_estado_matricula = esma.id_estado_matricula) \n" +
                                             "	     INNER JOIN periodo_anual as pean ON (mat.fkid_periodo_anual = pean.id_periodo_anual)\n" +
                                             "WHERE (fkid_estado_matricula = 1 AND fkid_periodo_anual = :fkidPeriodoAnual);").setResultTransformer(Transformers.aliasToBean(ListaMatriculaDTO.class));
        query.setParameter("fkidPeriodoAnual", fkidPeriodoAnual);
        List<ListaMatriculaDTO> resultList=query.list();
        transaction.commit();
        session.close();
        return resultList;
    }
    public List<ListaMatriculaDTO> getListMatriculaByDeshabilitado(int fkidPeriodoAnual) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT mat.id_matricula, mat.codigo_matricula, peralu.codigo_alumno, CONCAT(per.apellido_paterno,' ',per.apellido_materno,', ',per.primer_nombre) as nombre_alumno, \n" +
                                             "	     mat.fec_realizada\n" +
                                             "FROM   matricula as mat INNER JOIN per_alumno as peralu ON (mat.fkid_per_alumno = peralu.id_per_alumno) \n" +
                                             "	     INNER JOIN persona as per ON (peralu.fkid_persona = per.id_persona) \n" +
                                             "	     INNER JOIN estado_matricula as esma ON (mat.fkid_estado_matricula = esma.id_estado_matricula) \n" +
                                             "	     INNER JOIN periodo_anual as pean ON (mat.fkid_periodo_anual = pean.id_periodo_anual)\n" +
                                             "WHERE (fkid_estado_matricula = 2 AND fkid_periodo_anual = :fkidPeriodoAnual);").setResultTransformer(Transformers.aliasToBean(ListaMatriculaDTO.class));
        query.setParameter("fkidPeriodoAnual", fkidPeriodoAnual);
        List<ListaMatriculaDTO> resultList=query.list();
        transaction.commit();
        session.close();
        return resultList;
    }
    public List<ListaMatriculaDTO> getListHistorialMatricula() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT mat.codigo_matricula, CONCAT(per.apellido_paterno,' ',per.apellido_materno,', ',per.primer_nombre) as nombre_trabajador, mat.fec_modificacion\n" +
                                             "FROM   matricula as mat INNER JOIN per_trabajador as pertra ON (pertra.id_per_trabajador = mat.fkid_per_trabajador)\n" +
                                             "	     INNER JOIN persona as per ON (pertra.fkid_persona = per.id_persona)                    \n" +
                                             "	     INNER JOIN estado_matricula as esma ON (mat.fkid_estado_matricula = esma.id_estado_matricula) \n" +
                                             "	     INNER JOIN periodo_anual as pean ON (mat.fkid_periodo_anual = pean.id_periodo_anual);").setResultTransformer(Transformers.aliasToBean(ListaMatriculaDTO.class));
        List<ListaMatriculaDTO> resultList=query.list();
        transaction.commit();
        session.close();
        return resultList;
    }
    
    public void cambiarEstadoByID(int idMatricula, int fkidEstadoMatricula) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("UPDATE matricula SET fkid_estado_matricula = :fkidEstadoMatricula WHERE (id_matricula = :idMatricula);").setResultTransformer(Transformers.aliasToBean(ListaMatriculaDTO.class));
        query.setParameter("idMatricula", idMatricula);
        query.setParameter("fkidEstadoMatricula", fkidEstadoMatricula);
        query.executeUpdate();
        transaction.commit();
        session.close();
    }
    public void eliminarMatriculaByID(int idMatricula) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("DELETE FROM matricula WHERE (id_matricula = :idMatricula);").setResultTransformer(Transformers.aliasToBean(ListaMatriculaDTO.class));
        query.setParameter("idMatricula", idMatricula);
        query.executeUpdate();
        transaction.commit();
        session.close();
    }
    public ListaMatriculaDTO getObservacionMatricula(int idMatricula) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT matr.dscrp_observacion, CONCAT(per.apellido_paterno,' ',per.apellido_materno,', ',per.primer_nombre) as nombre_trabajador, titra.nom_tipo_trabajador\n" +
                                             "FROM   matricula as matr INNER JOIN per_trabajador as pertra ON (matr.fkid_per_trabajador = pertra.id_per_trabajador) \n" +
                                             "       INNER JOIN tipo_trabajador as titra ON (pertra.fkid_tipo_trabajador = titra.id_tipo_trabajador) \n" +
                                             "	     INNER JOIN persona as per ON (pertra.fkid_persona = per.id_persona)\n" +
                                             "WHERE (matr.id_matricula = :idMatricula);").setResultTransformer(Transformers.aliasToBean(ListaMatriculaDTO.class));
        query.setParameter("idMatricula", idMatricula);
        ListaMatriculaDTO result = (ListaMatriculaDTO) query.list().get(0);
        transaction.commit();
        session.close();
        return result;
    }
    
    
    
    public List<ListaAlumnoMatriculaDTO> getListMatriculaByAntiguo() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT peralu.id_per_alumno, peralu.codigo_alumno, per.numero_documento, CONCAT(per.apellido_paterno,' ',per.apellido_materno,', ',per.primer_nombre) as nombre_completo_alumno,\n" +
                                             "       peralu.ref_grado_anterior, peralu.ref_seccion, peralu.ref_nivel\n" +
                                             "FROM   per_alumno as peralu, persona as per, tipo_alumno as tial\n" +
                                             "WHERE (peralu.fkid_persona = per.id_persona AND \n" +
                                             "        peralu.fkid_tipo_alumno = tial.id_tipo_alumno AND\n" +
                                             "        tial.id_tipo_alumno = 1)\n" +
                                             "EXCEPT \n" +
                                             "SELECT peralu.id_per_alumno, peralu.codigo_alumno, per.numero_documento, CONCAT(per.apellido_paterno,' ',per.apellido_materno,', ',per.primer_nombre) as nombre_completo_alumno,\n" +
                                             "       peralu.ref_grado_anterior, peralu.ref_seccion, peralu.ref_nivel\n" +
                                             "FROM   per_alumno as peralu, matricula as matr, persona as per, tipo_alumno as tial\n" +
                                             "WHERE (matr.fkid_per_alumno = peralu.id_per_alumno AND\n" +
                                             "        peralu.fkid_persona = per.id_persona AND \n" +
                                             "        peralu.fkid_tipo_alumno = tial.id_tipo_alumno AND\n" +
                                             "        tial.id_tipo_alumno = 1)").setResultTransformer(Transformers.aliasToBean(ListaAlumnoMatriculaDTO.class));
        List<ListaAlumnoMatriculaDTO> resultList=query.list();
        transaction.commit();
        session.close();
        return resultList;
    }
    
    public List<ListaAlumnoMatriculaDTO> getListMatriculaByRepetido() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT peralu.id_per_alumno, peralu.codigo_alumno, per.numero_documento, CONCAT(per.apellido_paterno,' ',per.apellido_materno,', ',per.primer_nombre) as nombre_completo_alumno,\n" +
                                             "       peralu.ref_grado_anterior, peralu.ref_seccion, peralu.ref_nivel\n" +
                                             "FROM   per_alumno as peralu, persona as per, tipo_alumno as tial\n" +
                                             "WHERE (peralu.fkid_persona = per.id_persona AND \n" +
                                             "        peralu.fkid_tipo_alumno = tial.id_tipo_alumno AND\n" +
                                             "        tial.id_tipo_alumno = 2)\n" +
                                             "EXCEPT \n" +
                                             "SELECT peralu.id_per_alumno, peralu.codigo_alumno, per.numero_documento, CONCAT(per.apellido_paterno,' ',per.apellido_materno,', ',per.primer_nombre) as nombre_completo_alumno,\n" +
                                             "       peralu.ref_grado_anterior, peralu.ref_seccion, peralu.ref_nivel\n" +
                                             "FROM   per_alumno as peralu, matricula as matr, persona as per, tipo_alumno as tial\n" +
                                             "WHERE (matr.fkid_per_alumno = peralu.id_per_alumno AND\n" +
                                             "        peralu.fkid_persona = per.id_persona AND \n" +
                                             "        peralu.fkid_tipo_alumno = tial.id_tipo_alumno AND\n" +
                                             "        tial.id_tipo_alumno = 2)").setResultTransformer(Transformers.aliasToBean(ListaAlumnoMatriculaDTO.class));
        List<ListaAlumnoMatriculaDTO> resultList=query.list();
        transaction.commit();
        session.close();
        return resultList;
    }
    
    public ListaMatriculaDTO getDatosParaMatricular(int idPerAlumno) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT peralu.id_per_alumno, peralu.codigo_alumno, CONCAT(per.apellido_paterno,' ',per.apellido_materno,', ',per.primer_nombre) as nombre_alumno, \n" +
                                             "      (select TOP 1 fec_inicio_anual from periodo_anual ORDER BY id_periodo_anual ASC) as top_periodo, \n" +
                                             "      (select TOP 1 id_periodo_anual from periodo_anual ORDER BY id_periodo_anual ASC) as id_top_periodo, \n" +
                                             "      (select CONVERT(DATE, GETDATE()) [Current Date])  as fecha_actual \n" +
                                             "FROM   per_alumno as peralu, persona as per \n" +
                                             "WHERE (peralu.fkid_persona = per.id_persona AND \n" +
                                             "       peralu.id_per_alumno = :idPerAlumno)\n" +
                                             "EXCEPT\n" +
                                             "SELECT peralu.id_per_alumno, peralu.codigo_alumno, CONCAT(per.apellido_paterno,' ',per.apellido_materno,', ',per.primer_nombre) as nombre_alumno, \n" +
                                             "      (select TOP 1 fec_inicio_anual from periodo_anual ORDER BY id_periodo_anual ASC) as top_periodo, \n" +
                                             "      (select TOP 1 id_periodo_anual from periodo_anual ORDER BY id_periodo_anual ASC) as id_top_periodo, \n" +
                                             "      (select CONVERT(DATE, GETDATE()) [Current Date])  as fecha_actual \n" +
                                             "FROM   matricula as matr, per_alumno as peralu, persona as per \n" +
                                             "WHERE (matr.fkid_per_alumno = peralu.id_per_alumno AND \n" +
                                             "       peralu.fkid_persona = per.id_persona AND \n" +
                                             "       peralu.id_per_alumno = :idPerAlumno) ").setResultTransformer(Transformers.aliasToBean(ListaMatriculaDTO.class));
        query.setParameter("idPerAlumno", idPerAlumno);
        ListaMatriculaDTO result = (ListaMatriculaDTO) query.list().get(0);
        transaction.commit();
        session.close();
        return result;
    }
    public void registrarMatriculaByDato(String codigo_matricula, String fec_realizada, int fkid_per_alumno, int fkid_estado_matricula, int fkid_periodo_anual) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query queryMatricula = session.createSQLQuery("INSERT INTO matricula(codigo_matricula, fec_realizada, fkid_per_alumno, fkid_estado_matricula, fkid_periodo_anual) "
                                           + "VALUES (:codigo_matricula, :fec_realizada, :fkid_per_alumno, :fkid_estado_matricula, :fkid_periodo_anual) ").setResultTransformer(Transformers.aliasToBean(MatriculaDTO.class));
        queryMatricula.setParameter("codigo_matricula", codigo_matricula);
        queryMatricula.setParameter("fec_realizada", fec_realizada);
        queryMatricula.setParameter("fkid_per_alumno", fkid_per_alumno);
        queryMatricula.setParameter("fkid_estado_matricula", fkid_estado_matricula);
        queryMatricula.setParameter("fkid_periodo_anual", fkid_periodo_anual);
        queryMatricula.executeUpdate();
        
        transaction.commit();
        session.close();
    }
    
    public void insertarObservacionMatr(String fec_modificacion, String dscrp_observacion, int id_usuario) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query queryMatricula = session.createSQLQuery("INSERT INTO matricula(codigo_matricula, fec_realizada, fkid_per_alumno, fkid_estado_matricula, fkid_periodo_anual) "
                                           + "VALUES (:codigo_matricula, :fec_realizada, :fkid_per_alumno, :fkid_estado_matricula, :fkid_periodo_anual) ").setResultTransformer(Transformers.aliasToBean(MatriculaDTO.class));
        queryMatricula.executeUpdate();
        
//        int id_matricula = Integer.parseInt(queryMatricula.list().get(0).toString());
//        
//        Query qIdTrabajador = session.createSQLQuery("SELECT pertra.id_per_trabajador\n" +
//                                             "FROM   usuario as usu INNER JOIN persona as per ON (usu.fkid_persona = per.id_persona) \n" +
//                                             "	     INNER JOIN per_trabajador as pertra ON (per.id_persona = pertra.fkid_persona)\n" +
//                                             "WHERE (usu.id_usuario = :id_usuario) ").setResultTransformer(Transformers.aliasToBean(ListaMatriculaDTO.class));
//        qIdTrabajador.setParameter("id_usuario", id_usuario);
//        
//        int id_per_trabajador = Integer.parseInt(qIdTrabajador.list().get(0).toString());
//        
//        Query queryHistorial = session.createSQLQuery("INSERT INTO historial_matricula(fec_modificacion, dscrp_observacion, fkid_matricula, fkid_per_trabajador) "
//                                           + "VALUES (:fec_modificacion, :dscrp_observacion, :id_matricula, :id_per_trabajador) ").setResultTransformer(Transformers.aliasToBean(MatriculaDTO.class));
//        queryHistorial.setParameter("codigo_matricula", codigo_matricula);
//        queryHistorial.setParameter("fec_realizada", fec_realizada);
//        queryHistorial.setParameter("id_matricula", id_matricula);
//        queryHistorial.setParameter("id_per_trabajador", id_per_trabajador);
//        queryHistorial.executeUpdate();
        
        transaction.commit();
        session.close();
    }
    
    
}
