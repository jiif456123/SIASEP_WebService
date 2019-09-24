package com.helper;

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
    
    public List<ListaMatriculaDTO> getListMatriculaByNuevo() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT peralu.codigo_alumno, per.numero_documento, per.apellido_paterno, per.apellido_materno, per.primer_nombre, \n" +
                                            "	     per.sexo, dist.nom_distrito, per.direccion, peralu.nro_hermanos, peralu.ref_grado_anterior, esal.nom_estado_alumno \n" +
                                            "FROM   persona as per INNER JOIN per_alumno as peralu ON (per.id_persona = peralu.fkid_persona)\n" +
                                            "       INNER JOIN distrito as dist ON (per.fkid_distrito = dist.id_distrito) \n" +
                                            "	   INNER JOIN estado_alumno as esal ON (peralu.fkid_estado_alumno = esal.id_estado_alumno)\n" +
                                            "WHERE (peralu.fkid_tipo_per_alumno = 1)\n" +
                                            "ORDER BY esal.nom_estado_alumno ASC, peralu.codigo_alumno DESC ").setResultTransformer(Transformers.aliasToBean(ListaMatriculaDTO.class));
        List<ListaMatriculaDTO> resultList=query.list();
        transaction.commit();
        session.close();
        return resultList;
    }
    
    public List<ListaMatriculaDTO> getListMatriculaByAntiguo() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT peralu.codigo_alumno, per.numero_documento, per.apellido_paterno, per.apellido_materno, per.primer_nombre, \n" +
                                            "	     per.sexo, dist.nom_distrito, per.direccion, peralu.nro_hermanos, peralu.ref_grado_anterior, esal.nom_estado_alumno \n" +
                                            "FROM   persona as per INNER JOIN per_alumno as peralu ON (per.id_persona = peralu.fkid_persona)\n" +
                                            "       INNER JOIN distrito as dist ON (per.fkid_distrito = dist.id_distrito) \n" +
                                            "	   INNER JOIN estado_alumno as esal ON (peralu.fkid_estado_alumno = esal.id_estado_alumno)\n" +
                                            "WHERE (peralu.fkid_tipo_per_alumno = 2)\n" +
                                            "ORDER BY esal.nom_estado_alumno ASC, peralu.codigo_alumno DESC ").setResultTransformer(Transformers.aliasToBean(ListaMatriculaDTO.class));
        List<ListaMatriculaDTO> resultList=query.list();
        transaction.commit();
        session.close();
        return resultList;
    }
    
    public List<ListaMatriculaDTO> getListMatriculaByIntercambio() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT peralu.codigo_alumno, per.numero_documento, per.apellido_paterno, per.apellido_materno, per.primer_nombre, \n" +
                                            "	     per.sexo, dist.nom_distrito, per.direccion, peralu.nro_hermanos, peralu.ref_grado_anterior, esal.nom_estado_alumno \n" +
                                            "FROM   persona as per INNER JOIN per_alumno as peralu ON (per.id_persona = peralu.fkid_persona)\n" +
                                            "       INNER JOIN distrito as dist ON (per.fkid_distrito = dist.id_distrito) \n" +
                                            "	   INNER JOIN estado_alumno as esal ON (peralu.fkid_estado_alumno = esal.id_estado_alumno)\n" +
                                            "WHERE (peralu.fkid_tipo_per_alumno = 3)\n" +
                                            "ORDER BY esal.nom_estado_alumno ASC, peralu.codigo_alumno DESC ").setResultTransformer(Transformers.aliasToBean(ListaMatriculaDTO.class));
        List<ListaMatriculaDTO> resultList=query.list();
        transaction.commit();
        session.close();
        return resultList;
    }
    
    public List<ListaMatriculaDTO> getListMatriculaByRepetido() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT peralu.codigo_alumno, per.numero_documento, per.apellido_paterno, per.apellido_materno, per.primer_nombre, \n" +
                                            "	     per.sexo, dist.nom_distrito, per.direccion, peralu.nro_hermanos, peralu.ref_grado_anterior, esal.nom_estado_alumno \n" +
                                            "FROM   persona as per INNER JOIN per_alumno as peralu ON (per.id_persona = peralu.fkid_persona)\n" +
                                            "       INNER JOIN distrito as dist ON (per.fkid_distrito = dist.id_distrito) \n" +
                                            "	   INNER JOIN estado_alumno as esal ON (peralu.fkid_estado_alumno = esal.id_estado_alumno)\n" +
                                            "WHERE (peralu.fkid_tipo_per_alumno = 4)\n" +
                                            "ORDER BY esal.nom_estado_alumno ASC, peralu.codigo_alumno DESC ").setResultTransformer(Transformers.aliasToBean(ListaMatriculaDTO.class));
        List<ListaMatriculaDTO> resultList=query.list();
        transaction.commit();
        session.close();
        return resultList;
    }
    
    
    
    
}
