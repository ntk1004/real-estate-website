package com.javaweb.repository.custom;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BuildingRepositoryCustom {

   int countTotalItem(BuildingSearchResponse buildingSearchResponse);
    List<BuildingEntity> findAll(BuildingSearchRequest buildingSearchRequest);
}
