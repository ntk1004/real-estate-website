package com.javaweb.converter;

import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.utils.MapUtils;
import org.springframework.stereotype.Component;

@Component
public class BuildingSearchRequestconverter {
  public BuildingSearchRequest toBuildingDTO (BuildingSearchRequest buildingSearchRequest ){
      BuildingSearchRequest buildingSearchRequest1 = new BuildingSearchRequest();
      buildingSearchRequest1.setName (MapUtils.getObject(buildingSearchRequest.getName(), String.class));
      buildingSearchRequest1.setFloorArea(MapUtils.getObject(buildingSearchRequest.getFloorArea(), Long.class));
      buildingSearchRequest1.setWard(MapUtils.getObject(buildingSearchRequest.getWard(), String.class));
      buildingSearchRequest1.setStreet(MapUtils.getObject(buildingSearchRequest.getStreet(), String.class));
      buildingSearchRequest1 .setDistrict(MapUtils.getObject(buildingSearchRequest.getDistrict(), String.class));
      buildingSearchRequest1.setStaffId(MapUtils.getObject(buildingSearchRequest.getStaffId(), Long.class));
      buildingSearchRequest1.setAreaFrom(MapUtils.getObject(buildingSearchRequest.getAreaFrom(), Long.class));
      buildingSearchRequest1.setAreaTo(MapUtils.getObject(buildingSearchRequest.getAreaTo(), Long.class));
      buildingSearchRequest1.setRentPriceFrom(MapUtils.getObject(buildingSearchRequest.getRentPriceFrom(), Long.class));
      buildingSearchRequest1.setRentPriceTo(MapUtils.getObject(buildingSearchRequest.getRentPriceTo(), Long.class));
      buildingSearchRequest1.setManagerPhone(MapUtils.getObject(buildingSearchRequest.getManagerPhone(), String.class));
      buildingSearchRequest1.setManagerName(MapUtils.getObject(buildingSearchRequest.getManagerName(), String.class));
      buildingSearchRequest1.setTypeCode(buildingSearchRequest.getTypeCode());
      buildingSearchRequest1.setNumberOfBasement(MapUtils.getObject(buildingSearchRequest.getNumberOfBasement(), Long.class));
return buildingSearchRequest1;
  }
}
