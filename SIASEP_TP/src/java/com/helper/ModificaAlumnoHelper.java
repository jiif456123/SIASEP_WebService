package com.helper;

import com.DTO.AlumnoDTO;
import com.DTO.ListaAlumnoDTO;
import com.DTO.MatriculaDTO;
import com.DTO.VinculoFamiliarDTO;
import com.utilities.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.transform.Transformers;
import org.hibernate.type.BooleanType;
import org.hibernate.type.IntegerType;

public class ModificaAlumnoHelper {
    
    public ModificaAlumnoHelper() {
    }
    
    public List<ListaAlumnoDTO> getListAlumnosBusqueda() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT peralu.id_per_alumno, peralu.codigo_alumno, UPPER(CONCAT(per.apellido_paterno,' ',per.apellido_materno,', ',per.primer_nombre)) as nombre_alumno\n" +
                                             "FROM per_alumno as peralu INNER JOIN persona as per ON (peralu.fkid_persona = per.id_persona)\n" +
                                             "ORDER BY nombre_alumno ASC").setResultTransformer(Transformers.aliasToBean(ListaAlumnoDTO.class));
        List<ListaAlumnoDTO> resultList=query.list();
        transaction.commit();
        session.close();
        return resultList;
    }
    
    public ListaAlumnoDTO getListDatosByAlumno(int codigo_alumno) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT * FROM per_alumno as peralu INNER JOIN persona as per ON (peralu.fkid_persona = per.id_persona)\n" +
                                             "WHERE (peralu.codigo_alumno = :codigo_alumno)").setResultTransformer(Transformers.aliasToBean(ListaAlumnoDTO.class));
        query.setParameter("codigo_alumno", codigo_alumno);
        ListaAlumnoDTO result = (ListaAlumnoDTO) query.list().get(0);
        transaction.commit();
        session.close();
        return result;
    }
    
    public void updateAlumnoByDNI(AlumnoDTO alumnoDTO) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("exec sp_modifica_datos_alumno :codigo_alumno, :primer_nombre, :apellido_materno, :apellido_paterno, :numero_documento, "
                                           + ":fec_nacimiento, :sexo, :telefono_casa, :telefono_celular, :direccion, :correo, "
                                           + ":fkid_tipo_documento, :fkid_distrito, :fkid_lugar_nacimiento, :nombre_ie_anterior, "
                                           + ":ref_nivel, :ref_grado_anterior, :ref_seccion, :ref_ponderado_anterior, :flg_orden_merito, "
                                           + ":grupo_sanguineo, :lengua_materna, :segunda_lengua, :nro_hermanos, :flg_copia_dni, :flg_vive_con_padres ");
        query.setParameter("codigo_alumno", alumnoDTO.getCodigo_alumno()); query.setParameter("primer_nombre", alumnoDTO.getPrimer_nombre()); query.setParameter("apellido_materno", alumnoDTO.getApellido_materno());
        query.setParameter("apellido_paterno", alumnoDTO.getApellido_paterno()); query.setParameter("numero_documento", alumnoDTO.getNumero_documento());
        query.setParameter("fec_nacimiento", alumnoDTO.getFec_nacimiento()); query.setParameter("sexo", alumnoDTO.getSexo());
        query.setParameter("telefono_casa", alumnoDTO.getTelefono_casa()); query.setParameter("telefono_celular", alumnoDTO.getTelefono_celular());
        query.setParameter("direccion", alumnoDTO.getDireccion()); query.setParameter("correo", alumnoDTO.getCorreo());
        query.setParameter("fkid_tipo_documento", alumnoDTO.getFkid_tipo_documento()); query.setParameter("fkid_distrito", alumnoDTO.getFkid_distrito());
        query.setParameter("fkid_lugar_nacimiento", alumnoDTO.getFkid_lugar_nacimiento()); query.setParameter("nombre_ie_anterior", alumnoDTO.getNombre_ie_anterior());
        query.setParameter("ref_nivel", alumnoDTO.getRef_nivel()); query.setParameter("ref_grado_anterior", alumnoDTO.getRef_grado_anterior());
        query.setParameter("ref_seccion", alumnoDTO.getRef_seccion()); query.setParameter("ref_ponderado_anterior", alumnoDTO.getRef_ponderado_anterior());
        query.setParameter("flg_orden_merito", alumnoDTO.getFlg_orden_merito()); query.setParameter("grupo_sanguineo", alumnoDTO.getGrupo_sanguineo());
        query.setParameter("lengua_materna", alumnoDTO.getLengua_materna()); query.setParameter("segunda_lengua", alumnoDTO.getSegunda_lengua());
        query.setParameter("nro_hermanos", alumnoDTO.getNro_hermanos()); query.setParameter("flg_copia_dni", alumnoDTO.getFlg_copia_dni()); query.setParameter("flg_vive_con_padres", alumnoDTO.getFlg_vive_con_padres());
        query.executeUpdate();
        transaction.commit();
        session.close();
    }
    
    public List<VinculoFamiliarDTO> getListFamiliaresByAlumno(int codigo_alumno) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT perfa.id_per_familiar, per.numero_documento, tifa.nom_tipo_familiar, CONCAT(per.apellido_paterno,' ',per.apellido_materno,', ',per.primer_nombre) as nombre_familiar, \n" +
                                             "       perfa.telefono_emergencia, CASE WHEN (vifa.flg_ofi_apoderado = 1) THEN 'ASIGNADO' ELSE 'NO ASIGNADO' END as es_apoderado, vifa.fec_inicio_vinculo, vifa.fec_fin_vinculo\n" +
                                             "FROM   per_familiar as perfa INNER JOIN tipo_familiar as tifa ON (perfa.fkid_tipo_familiar = tifa.id_tipo_familiar)\n" +
                                             "       INNER JOIN estado_civil as esci ON (perfa.fkid_estado_civil = esci.id_estado_civil)\n" +
                                             "       INNER JOIN grado_instruccion as gradi ON (perfa.fkid_grado_instruccion = gradi.id_grado_instruccion)\n" +
                                             "       INNER JOIN persona as per ON (perfa.fkid_persona = per.id_persona)\n" +
                                             "       INNER JOIN vinculo_familiar as vifa ON (vifa.fkid_per_familiar = perfa.id_per_familiar)\n" +
                                             "WHERE (vifa.fkid_per_alumno = (SELECT id_per_alumno FROM per_alumno WHERE (codigo_alumno = :codigo_alumno)))").setResultTransformer(Transformers.aliasToBean(VinculoFamiliarDTO.class));
        query.setParameter("codigo_alumno", codigo_alumno);
        List<VinculoFamiliarDTO> resultList=query.list();
        transaction.commit();
        session.close();
        return resultList;
    }

    public List<VinculoFamiliarDTO> getListFamiliarApoderadoByAlumno(int codigo_alumno) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT perfa.id_per_familiar, per.numero_documento, tifa.nom_tipo_familiar, CONCAT(per.apellido_paterno,' ',per.apellido_materno,', ',per.primer_nombre) as nombre_familiar, \n" +
                                             "	     CAST( CASE WHEN (vifa.fec_inicio_vinculo IS NULL) THEN '-----' ELSE CONVERT(varchar, vifa.fec_inicio_vinculo, 107) END AS VARCHAR) as fec_inicio_new,\n" +
                                             "	     CAST( CASE WHEN (vifa.fec_fin_vinculo IS NULL) THEN '-----' ELSE CONVERT(varchar, vifa.fec_fin_vinculo, 107) END AS VARCHAR) as fec_fin_new,\n" +
                                             "       CASE WHEN (vifa.flg_ofi_apoderado = 1) THEN 'ASIGNADO' ELSE 'NO ASIGNADO' END as es_apoderado\n" +
                                             "FROM   per_familiar as perfa INNER JOIN tipo_familiar as tifa ON (perfa.fkid_tipo_familiar = tifa.id_tipo_familiar)\n" +
                                             "       INNER JOIN estado_civil as esci ON (perfa.fkid_estado_civil = esci.id_estado_civil)\n" +
                                             "       INNER JOIN grado_instruccion as gradi ON (perfa.fkid_grado_instruccion = gradi.id_grado_instruccion)\n" +
                                             "       INNER JOIN persona as per ON (perfa.fkid_persona = per.id_persona)\n" +
                                             "       INNER JOIN vinculo_familiar as vifa ON (vifa.fkid_per_familiar = perfa.id_per_familiar)\n" +
                                             "WHERE (vifa.fkid_per_alumno = (SELECT id_per_alumno FROM per_alumno WHERE (codigo_alumno = :codigo_alumno)))").setResultTransformer(Transformers.aliasToBean(VinculoFamiliarDTO.class));
        query.setParameter("codigo_alumno", codigo_alumno);
        List<VinculoFamiliarDTO> resultList=query.list();
        transaction.commit();
        session.close();
        return resultList;
    }
    
    public VinculoFamiliarDTO getListDatosFamiliarById(int id_per_familiar) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT * FROM per_familiar as perfa INNER JOIN persona as per ON(perfa.fkid_persona = per.id_persona)\n" +
                                            "WHERE (id_per_familiar = :id_per_familiar) ").setResultTransformer(Transformers.aliasToBean(VinculoFamiliarDTO.class));
        query.setParameter("id_per_familiar", id_per_familiar);
        VinculoFamiliarDTO result = (VinculoFamiliarDTO) query.list().get(0);
        transaction.commit();
        session.close();
        return result;
    }
    
    public void updateApoderadoByIdFamiliar(int codigo_alumno, int id_per_familiar) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        boolean flg_ofi_apoderado = (boolean) session.createSQLQuery(
                "SELECT flg_ofi_apoderado\n" +
                "FROM vinculo_familiar\n" +
                "WHERE (fkid_per_familiar = "+id_per_familiar+") ")
                .addScalar("flg_ofi_apoderado", new BooleanType())
                .uniqueResult();
        
        Query query = null;
        if(flg_ofi_apoderado == false) {
            query = session.createSQLQuery("exec sp_asignar_apoderado_by_alumno :codigo_alumno, :id_per_familiar ");
            query.setParameter("codigo_alumno", codigo_alumno);
            query.setParameter("id_per_familiar", id_per_familiar);
        }
        query.executeUpdate();
        transaction.commit();
        session.close();
    }
    
}
