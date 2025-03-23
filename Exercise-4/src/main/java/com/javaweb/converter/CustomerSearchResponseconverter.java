package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.RealEstateUnitEntity;
import com.javaweb.enums.district;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.CustomerSearchResponse;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
public class CustomerSearchResponseconverter {

    public static CustomerSearchResponse tobuildingDTO(CustomerEntity x){
        CustomerSearchResponse a = new CustomerSearchResponse();
       a.setId(x.getId());
       a.setFullName(x.getName());
       a.setEmail(x.getEmail());
       a.setPhone(x.getCustomerPhone());
       a.setDemand(x.getDemand());
       a.setCreatedBy(x.getCreatedBy());
       a.setCreatedDate(x.getCreatedDate());
       return a;
    }
}
