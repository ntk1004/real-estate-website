package com.javaweb.service;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BuildingService {

  ResponseDTO listStaffs(Long buildingId);

   void AssigmentBuillding(AssignmentBuildingDTO assignmentBuildingDTO);
    BuildingDTO buildingDTO(Long buildingId);
    BuildingSearchResponse buildingsearch( BuildingSearchRequest buildingSearchRequest);
    void deleteBuilding(List<Long> ids);


    BuildingDTO AddorUpdate (BuildingDTO buildingDTO);

    List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable);
    int contTotalItem(List <BuildingSearchResponse> buildingSearchResponses);
}
