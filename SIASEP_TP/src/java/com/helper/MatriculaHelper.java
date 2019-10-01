package com.helper;

import com.DTO.ListaAlumnoMatriculaDTO;
import com.DTO.ListaMatriculaDTO;
import com.utilities.HibernateUtil;
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
        Query query = session.createSQLQuery("SELECT mat.id_matricula, mat.codigo_matricula, CONCAT(per.apellido_paterno,' ',per.apellido_materno,', ',per.primer_nombre) as nombre_alumno, \n" +
                                             "	     mat.fec_realizada, esma.nom_estado_matricula\n" +
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
        Query query = session.createSQLQuery("SELECT mat.id_matricula, mat.codigo_matricula, CONCAT(per.apellido_paterno,' ',per.apellido_materno,', ',per.primer_nombre) as nombre_alumno, \n" +
                                             "	     mat.fec_realizada, esma.nom_estado_matricula\n" +
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
    
    
    
    
    public List<ListaAlumnoMatriculaDTO> getListMatriculaByAntiguo() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT peralu.codigo_alumno, per.numero_documento, CONCAT(per.apellido_paterno,' ',per.apellido_materno,', ',per.primer_nombre) as nombre_completo_alumno, \n" +
                                             "       per.sexo, dist.nom_distrito, peralu.flg_copia_dni\n" +
                                             "FROM   persona as per INNER JOIN per_alumno as peralu ON (per.id_persona = peralu.fkid_persona)\n" +
                                             "        INNER JOIN distrito as dist ON (per.fkid_distrito = dist.id_distrito) \n" +
                                             "WHERE (peralu.fkid_tipo_alumno = 1)\n" +
                                             "ORDER BY peralu.codigo_alumno DESC ").setResultTransformer(Transformers.aliasToBean(ListaAlumnoMatriculaDTO.class));
        List<ListaAlumnoMatriculaDTO> resultList=query.list();
        transaction.commit();
        session.close();
        return resultList;
    }
    
    public List<ListaAlumnoMatriculaDTO> getListMatriculaByRepetido() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT peralu.codigo_alumno, per.numero_documento, CONCAT(per.apellido_paterno,' ',per.apellido_materno,', ',per.primer_nombre) as nombre_completo_alumno, \n" +
                                             "       per.sexo, dist.nom_distrito, peralu.flg_copia_dni\n" +
                                             "FROM   persona as per INNER JOIN per_alumno as peralu ON (per.id_persona = peralu.fkid_persona)\n" +
                                             "        INNER JOIN distrito as dist ON (per.fkid_distrito = dist.id_distrito) \n" +
                                             "WHERE (peralu.fkid_tipo_alumno = 2)\n" +
                                             "ORDER BY peralu.codigo_alumno DESC ").setResultTransformer(Transformers.aliasToBean(ListaAlumnoMatriculaDTO.class));
        List<ListaAlumnoMatriculaDTO> resultList=query.list();
        transaction.commit();
        session.close();
        return resultList;
    }
    
    
    
    
}
