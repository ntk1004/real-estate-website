package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.jetbrains.annotations.NotNull;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class BuildingRepositoryCustomImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;
    public  static void SetTable (BuildingSearchRequest buildingSearchRequest, StringBuilder sql){
       Long staffid = buildingSearchRequest.getStaffId();
       if (staffid!=null){
           sql.append(" inner join  assignmentbuilding on assignmentbuilding.buildingid = b.id ");
       }
       Long AreaFrom = buildingSearchRequest.getAreaFrom();
       Long AreaTo = buildingSearchRequest.getAreaTo();
       if (AreaTo!=null || AreaFrom!=null){

               sql.append(" inner join real_estate_unit on real_estate_unit.buildingid = b.id ");

       }

    }
    public  static  void queryNomal (BuildingSearchRequest buildingSearchRequest, StringBuilder where){
        try {
            Field[] fields= BuildingSearchRequest.class.getDeclaredFields();
            for (Field item :fields){
                item.setAccessible(true);
                String fieldname = item.getName();
                if (!fieldname.equals("staffId") && !fieldname.equals("typeCode") && !fieldname.startsWith("rent")&& !fieldname.startsWith("area") ){
                    Object value = item.get(buildingSearchRequest);
                    if (value!=null ){
                        if (item.getType().getName().equals("java.lang.Long")){
                            where .append( " and b."+fieldname+"="+value);
                        }
                      else if(item.getType().getName().equals("java.lang.String")){
                            where .append( " and b."+fieldname+" like '%" +value+ "%' ");
                        }
                    }
                }
            }
        }
        catch (Exception e){

        }
    }
 public static  void querySpecial  (@NotNull BuildingSearchRequest buildingSearchRequest, StringBuilder where) {
     Long staffid = buildingSearchRequest.getStaffId();
    if (staffid != null) {
        where.append(" and assignmentbuilding.staffid = " + staffid);
    }
        Long AreaFrom = buildingSearchRequest.getAreaFrom();
        Long AreaTo = buildingSearchRequest.getAreaTo();
        if (AreaTo != null || AreaFrom != null) {
            if (AreaTo != null)
                where.append(" and rentarea.value <= " + AreaTo);
            if (AreaFrom != null)
                where.append(" and  rentarea.value >= " + AreaFrom);
        }
        Long rentpriceFrom = buildingSearchRequest.getRentPriceFrom();
        Long rentLongpriceTo = buildingSearchRequest.getRentPriceTo();
           if (rentLongpriceTo != null || rentpriceFrom !=null){
               if (rentLongpriceTo != null)
                   where.append(" and b.rentprice <= " + rentLongpriceTo);
               if (rentpriceFrom != null)
                   where.append(" and b.rentprice >= " + rentpriceFrom);
           }
        if(buildingSearchRequest.getTypeCode()!=null && buildingSearchRequest.getTypeCode().size()!=0 ){
            where.append(" and b.type like ");
         String s=   buildingSearchRequest.getTypeCode().stream().map(it -> "'%"+it+"%'").collect(Collectors.joining(" or b.type like "))+" ";
         where.append(s);
        }
    }

    @Override
    public int countTotalItem(BuildingSearchResponse buildingSearchResponse) {
      String sql= builldingQueryFilter(buildingSearchResponse.getId());
      Query query =entityManager.createNativeQuery(sql);
      return query.getResultList().size();
    }
private String builldingQueryFilter(Long id){
        String sql = "select * from building b where b.id= "+id;
        return sql;
}
    @Override
  public  List<BuildingEntity> findAll(BuildingSearchRequest buildingSearchRequest ){
       StringBuilder sql = new StringBuilder("select b.* from building b ");
       SetTable(buildingSearchRequest,sql);
        StringBuilder where =new StringBuilder (" where 1=1 ");
        queryNomal(buildingSearchRequest,where);
        querySpecial(buildingSearchRequest,where);
        sql.append(where);
        sql.append(" group by b.id");
        Query query =entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);

        return  query.getResultList();
    }
    public void splitPage(Pageable pageable,StringBuilder where){
        where.append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset());
    }
}
