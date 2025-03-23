package com.javaweb.repository.custom.impl;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;

@Repository
public class CustomerRepositoryCustomImpl implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;
    public  static void SetTable (CustomerSearchRequest   customerSearchRequest, StringBuilder sql){
        Long staffid = customerSearchRequest.getStaffid();
        if (staffid!=null){
            sql.append(" inner join assignmentcustomer  on a.id = assignmentcustomer.customerid\n" +
                       "inner join user  on user.id = assignmentcustomer.staffid ");
        }
        }
    public  static  void queryNomal (CustomerSearchRequest   customerSearchRequest, StringBuilder where){
        try {
            Field[] fields= CustomerSearchRequest.class.getDeclaredFields();
            for (Field item :fields){
                item.setAccessible(true);
                String fieldname = item.getName();
                if (!fieldname.equals("staffid")){
                    Object value = item.get(customerSearchRequest);
                    if (value!=null ){
                        if (item.getType().getName().equals("java.lang.Long")){
                            where .append( " and a."+fieldname+"="+value);
                        }
                        else if(item.getType().getName().equals("java.lang.String")){
                            where .append( " and a."+fieldname+" like '%" +value+ "%' ");
                        }
                    }
                }
            }
        }
        catch (Exception e){

        }
    }
    public static  void querySpecial  (@NotNull CustomerSearchRequest   customerSearchRequest, StringBuilder where) {
        Long staffid = customerSearchRequest.getStaffid();
        if (staffid != null) {
            where.append(" and user.id = " + staffid);
        }
        }


    @Override
    public List<CustomerEntity> findAll(CustomerSearchRequest   customerSearchRequest ){
        StringBuilder sql = new StringBuilder("select a.* from customer a ");
        SetTable(customerSearchRequest,sql);
        StringBuilder where =new StringBuilder (" where 1=1 ");
        queryNomal(customerSearchRequest,where);
        querySpecial(customerSearchRequest,where);
        sql.append(where);
        Query query =entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);

        return  query.getResultList();
    }


}
