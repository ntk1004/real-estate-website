package com.javaweb.repository;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BuildingRepository extends JpaRepository<BuildingEntity,Long> , BuildingRepositoryCustom {
    BuildingEntity findByNameContaining(String s);
    void deleteByIdIn(List<Long> ids);
    List<BuildingEntity> findByNameContainingAndStreet(String name, String street);


    BuildingEntity findByName(String name);
}
