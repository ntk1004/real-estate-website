package com.javaweb.converter;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RealEstateUnitEntity;
import com.javaweb.entity.RealEstateUnitEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BuildingEntityConverter {


    public BuildingEntity toBuildingEntity (BuildingDTO x) {
BuildingEntity a = new BuildingEntity();
       a.setId(x.getId());
        a.setName(x.getName());
        a.setStreet(x.getStreet());
        a.setWard(x.getWard());
        a.setDistrict(x.getDistrict());
       a.setNumberofbasement(x.getNumberOfBasement());
       a.setFloorarea(x.getFloorArea());
       a.setManagername(x.getManagerName());
       a.setManagerphonenumber(x.getManagerPhone());
       List<RealEstateUnitEntity> rentAreaEntities = new ArrayList<>();
        String rt = x.getRentArea();
       String k[] = rt.split(",");
       for (String t : k){
          RealEstateUnitEntity rentAreaEntity =  new RealEstateUnitEntity();
          rentAreaEntity.setValue(Long.parseLong(t));
          rentAreaEntity.setBuilding(a);
          rentAreaEntities.add(rentAreaEntity);
       }
       a.setRealEstateUnitEntities(rentAreaEntities);
       a.setRentprice(x.getRentPrice());
       List<String> list = x.getTypeCode();
        String typecode  =  list.stream().distinct().map(it -> it).collect(Collectors.joining(","));
       a.setType(typecode);

        return a;
    }
}
