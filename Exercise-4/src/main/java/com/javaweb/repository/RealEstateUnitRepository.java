package com.javaweb.repository;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RealEstateUnitEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RealEstateUnitRepository extends JpaRepository<RealEstateUnitEntity, Long> {
  public   void deleteByIdIn (List<Long> Ids);

  List<RealEstateUnitEntity> findByStatus(String status);
  List< RealEstateUnitEntity> findByBuildingAndNameContaining(BuildingEntity building, String name);

  List<RealEstateUnitEntity> findByName(String name);

  List<RealEstateUnitEntity> findByNameContaining(String name);
}
