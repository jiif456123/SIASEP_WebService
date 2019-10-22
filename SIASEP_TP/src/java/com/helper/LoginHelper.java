package com.helper;

import com.DTO.LoginDTO;
import com.utilities.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.transform.Transformers;

public class LoginHelper {
    
    public LoginHelper() {
    }
    
    public LoginDTO iniciarSession(LoginDTO loginDTO) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT usu.id_usuario, tu.id_tipo_usuario, tu.nom_tipo_usuario, per.primer_nombre, per.apellido_paterno\n" +
                                             "FROM usuario as usu INNER JOIN persona as per ON (usu.fkid_persona = per.id_persona) INNER JOIN\n" +
                                             "     multi_role as mr ON (mr.fkid_usuario = usu.id_usuario) INNER JOIN tipo_usuario tu ON (mr.fkid_tipo_usuario = tu.id_tipo_usuario)\n" +
                                             "WHERE (usu.username = :username AND usu.password = :password);").setResultTransformer(Transformers.aliasToBean(LoginDTO.class));
        query.setParameter("username", loginDTO.getUsername());
        query.setParameter("password", loginDTO.getPassword());
        LoginDTO result = (LoginDTO) query.list().get(0);
        transaction.commit();
        session.close();
        return result;
    }
    
}
