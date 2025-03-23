package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RealEstateUnitEntity;
import com.javaweb.entity.RealEstateUnitEntity;
import com.javaweb.enums.district;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
@Component
public class BuildingSearchResponseconverter {
//    @Autowired
//    private static ModelMapper modelMapper;

    public static BuildingSearchResponse tobuildingDTO(BuildingEntity x){
        BuildingSearchResponse a = new BuildingSearchResponse();
        a.setId(x.getId());
        a.setName(x.getName());
        a.setManagerPhone(x.getManagerphonenumber());
        a.setNumberOfBasement(x.getNumberofbasement());
        a.setManagerName(x.getManagername());
        a.setNumberOfBasement(x.getNumberofbasement());
        a.setRentPrice(x.getRentprice());
        a.setFloorArea(x.getFloorarea());
        Map<String,String> districts = district.type();
        String districtName = districts.get(x.getDistrict());
        a.setAddress(x.getStreet()+" "+x.getWard()+" "+districtName);
        List<RealEstateUnitEntity> rt = x.getRealEstateUnitEntities();
        String arearesult  =  rt.stream().distinct().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
        a.setRentArea(arearesult);
        return a;
    }
}
