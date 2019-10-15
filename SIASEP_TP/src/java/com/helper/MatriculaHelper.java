package com.helper;

import com.DTO.ListaAlumnoDTO;
import com.DTO.ListaMatriculaDTO;
import com.DTO.MatriculaDTO;
import com.utilities.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.transform.Transformers;
import org.hibernate.type.IntegerType;

public class MatriculaHelper {
    
    public MatriculaHelper() {
    }
    
    public Integer getIdTrabajadorByUsuario(int id_usuario) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Integer idTrabajador = (Integer) session.createSQLQuery(
                "SELECT pertra.id_per_trabajador \n" +
                "FROM   usuario as usu INNER JOIN persona as per ON (usu.fkid_persona = per.id_persona) \n" +
                "       INNER JOIN per_trabajador as pertra ON (per.id_persona = pertra.fkid_persona) \n" +
                "WHERE (usu.id_usuario = "+id_usuario+") ")
                .addScalar("id_per_trabajador", new IntegerType())
                .uniqueResult();
        transaction.commit();
        session.close();
        return idTrabajador;
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
                                             "       mat.fec_realizada\n" +
                                             "FROM   matricula as mat INNER JOIN per_alumno as peralu ON (mat.fkid_per_alumno = peralu.id_per_alumno) \n" +
                                             "       INNER JOIN persona as per ON (peralu.fkid_persona = per.id_persona) \n" +
                                             "       INNER JOIN estado_matricula as esma ON (mat.fkid_estado_matricula = esma.id_estado_matricula) \n" +
                                             "       INNER JOIN periodo_anual as pean ON (mat.fkid_periodo_anual = pean.id_periodo_anual)\n" +
                                             "WHERE (fkid_estado_matricula = 1 AND fkid_periodo_anual = :fkidPeriodoAnual) \n" +
                                             "ORDER BY mat.id_matricula DESC ").setResultTransformer(Transformers.aliasToBean(ListaMatriculaDTO.class));
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
                                             "       mat.fec_realizada\n" +
                                             "FROM   matricula as mat INNER JOIN per_alumno as peralu ON (mat.fkid_per_alumno = peralu.id_per_alumno) \n" +
                                             "       INNER JOIN persona as per ON (peralu.fkid_persona = per.id_persona) \n" +
                                             "       INNER JOIN estado_matricula as esma ON (mat.fkid_estado_matricula = esma.id_estado_matricula) \n" +
                                             "       INNER JOIN periodo_anual as pean ON (mat.fkid_periodo_anual = pean.id_periodo_anual)\n" +
                                             "WHERE (fkid_estado_matricula = 2 AND fkid_periodo_anual = :fkidPeriodoAnual) \n" +
                                             "ORDER BY mat.id_matricula DESC ").setResultTransformer(Transformers.aliasToBean(ListaMatriculaDTO.class));
        query.setParameter("fkidPeriodoAnual", fkidPeriodoAnual);
        List<ListaMatriculaDTO> resultList=query.list();
        transaction.commit();
        session.close();
        return resultList;
    }
    public List<ListaMatriculaDTO> getListHistorialMatricula(int id_usuario) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query qExist = session.createSQLQuery("select COUNT(*) from sysobjects where name='log_matricula' and xtype='U' ");
        int existeTB = Integer.parseInt(qExist.list().get(0).toString());
        List<ListaMatriculaDTO> resultList = null;
        if(existeTB == 0) {
            return resultList;
        } else {
            Query query = session.createSQLQuery("SELECT TOP 15 id_log_matricula, lg_codigo_matricula, lg_fec_modificacion, lg_nom_estado_matricula, lg_dscrp_observacion\n" +
                                                 "FROM   log_matricula\n" +
                                                 "WHERE (lg_id_per_trabajador = :idTrabajador)\n" +
                                                 "ORDER BY id_log_matricula DESC ").setResultTransformer(Transformers.aliasToBean(ListaMatriculaDTO.class));
            query.setParameter("idTrabajador", getIdTrabajadorByUsuario(id_usuario));
            resultList=query.list();
        }
        transaction.commit();
        session.close();
        return resultList;
    }
    
    public void cambiarEstadoByID(int idMatricula, int fkidEstadoMatricula) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("UPDATE matricula SET fkid_estado_matricula = :fkidEstadoMatricula WHERE (id_matricula = :idMatricula) ").setResultTransformer(Transformers.aliasToBean(MatriculaDTO.class));
        query.setParameter("idMatricula", idMatricula);
        query.setParameter("fkidEstadoMatricula", fkidEstadoMatricula);
        query.executeUpdate();
        transaction.commit();
        session.close();
    }
    
    public void insertarObsEstadoMatricula(int idMatricula, String dscrp_observacion, int id_usuario) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("INSERT INTO historial_matricula(fec_modificacion, dscrp_observacion, fkid_matricula, fkid_per_trabajador)\n" +
                                             "VALUES ((select CONVERT(DATE, GETDATE()) [fecha_actual]), :dscrp_observacion, :idMatricula, :idTrabajador) ").setResultTransformer(Transformers.aliasToBean(MatriculaDTO.class));
        query.setParameter("idMatricula", idMatricula);
        query.setParameter("dscrp_observacion", dscrp_observacion);
        query.setParameter("idTrabajador", getIdTrabajadorByUsuario(id_usuario));
        query.executeUpdate();
        transaction.commit();
        session.close();
    }
    
    public void eliminarMatriculaByID(int idMatricula) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("exec sp_eliminar_matricula :idMatricula ");
        query.setParameter("idMatricula", idMatricula);
        query.executeUpdate();
        transaction.commit();
        session.close();
    }
    
    public ListaMatriculaDTO getObservacionMatricula(int idMatricula) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT TOP 1 hima.fec_modificacion, hima.dscrp_observacion, CONCAT(per.apellido_paterno,' ',per.apellido_materno,', ',per.primer_nombre) as nombre_trabajador, \n" +
                                             "       titra.nom_tipo_trabajador\n" +
                                             "FROM   historial_matricula as hima INNER JOIN per_trabajador as pertra ON (hima.fkid_per_trabajador = pertra.id_per_trabajador) \n" +
                                             "       INNER JOIN tipo_trabajador as titra ON (pertra.fkid_tipo_trabajador = titra.id_tipo_trabajador) \n" +
                                             "	     INNER JOIN persona as per ON (pertra.fkid_persona = per.id_persona) \n" +
                                             "WHERE (hima.fkid_matricula = :idMatricula)\n" +
                                             "ORDER BY hima.id_historial_matricula DESC ").setResultTransformer(Transformers.aliasToBean(ListaMatriculaDTO.class));
        query.setParameter("idMatricula", idMatricula);
        ListaMatriculaDTO result = (ListaMatriculaDTO) query.list().get(0);
        transaction.commit();
        session.close();
        return result;
    }
    
    
    
    public List<ListaAlumnoDTO> getListMatriculaByAntiguo() {
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
                                             "        tial.id_tipo_alumno = 1)").setResultTransformer(Transformers.aliasToBean(ListaAlumnoDTO.class));
        List<ListaAlumnoDTO> resultList=query.list();
        transaction.commit();
        session.close();
        return resultList;
    }
    
    public List<ListaAlumnoDTO> getListMatriculaByRepetido() {
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
                                             "        tial.id_tipo_alumno = 2)").setResultTransformer(Transformers.aliasToBean(ListaAlumnoDTO.class));
        List<ListaAlumnoDTO> resultList=query.list();
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
                                             "      (select CONVERT(DATE, GETDATE()) [Current Date]) as fecha_actual \n" +
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
        Query queryMatricula = session.createSQLQuery("INSERT INTO matricula(codigo_matricula, fec_realizada, fkid_per_alumno, "
                                                                          + "fkid_estado_matricula, fkid_periodo_anual) "
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
    
    public void insertarObservacionHistorial(String fec_modificacion, String dscrp_observacion, int id_usuario) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Integer idMatricula = (Integer) session.createSQLQuery("SELECT TOP 1 id_matricula FROM matricula ORDER BY id_matricula DESC ").addScalar("id_matricula", new IntegerType()).uniqueResult();
        System.out.println("solo sale un valor entero: "+idMatricula);
        
        Query queryHistorial = session.createSQLQuery("INSERT INTO historial_matricula(fec_modificacion, dscrp_observacion, fkid_matricula, fkid_per_trabajador) "
                                           + "VALUES (:fec_modificacion, :dscrp_observacion, :id_matricula, :id_per_trabajador) ").setResultTransformer(Transformers.aliasToBean(MatriculaDTO.class));
        queryHistorial.setParameter("fec_modificacion", fec_modificacion);
        queryHistorial.setParameter("dscrp_observacion", dscrp_observacion);
        queryHistorial.setParameter("id_matricula", idMatricula);
        queryHistorial.setParameter("id_per_trabajador", getIdTrabajadorByUsuario(id_usuario));
        queryHistorial.executeUpdate();
        
        transaction.commit();
        session.close();
    }
    
    
}
