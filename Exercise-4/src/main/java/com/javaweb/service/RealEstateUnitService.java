package com.javaweb.service;

import com.javaweb.model.dto.RealEstateUnitDTO;

import java.util.List;

public interface RealEstateUnitService {
 void  delete (List<Long> ids);
 List<RealEstateUnitDTO> findAll(RealEstateUnitDTO realEstateUnitDTO );
 void post (RealEstateUnitDTO dto);
 RealEstateUnitDTO findbyId(Long id);
List< RealEstateUnitDTO> findByStatus();
}
