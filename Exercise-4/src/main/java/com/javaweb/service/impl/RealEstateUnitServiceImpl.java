package com.javaweb.service.impl;
//
//import com.javaweb.repository.RentAreaRepository;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RealEstateUnitEntity;
import com.javaweb.enums.district;
import com.javaweb.model.dto.RealEstateUnitDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RealEstateUnitRepository;
import com.javaweb.service.RealEstateUnitService;
import com.javaweb.service.RealEstateUnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class RealEstateUnitServiceImpl implements RealEstateUnitService {
    @Autowired
    RealEstateUnitRepository realEstateUnitRepository;
    @Autowired
    BuildingRepository buildingRepository;
    @Override
  public void  delete (List<Long> ids){
        realEstateUnitRepository.deleteByIdIn(ids);
    };

    @Override
    public List <RealEstateUnitDTO> findAll(RealEstateUnitDTO estateUnitDTO) {
        BuildingEntity building = null;
        if (estateUnitDTO.getName() != null && !estateUnitDTO.getName().trim().isEmpty()) {
            building = buildingRepository.findByNameContaining(estateUnitDTO.getName());
        }
        List<RealEstateUnitEntity> list=new ArrayList<>();
     if (building != null && estateUnitDTO != null) {
         list = realEstateUnitRepository.findByBuildingAndNameContaining(building, estateUnitDTO.getNameUnit());
     }
     else {
         list = realEstateUnitRepository.findAll();
     }
       List<RealEstateUnitDTO> listDTO = new ArrayList<RealEstateUnitDTO>();
       for (RealEstateUnitEntity realEstateUnitEntity : list) {

           RealEstateUnitDTO realEstateUnitDTO = new RealEstateUnitDTO();
           realEstateUnitDTO.setIdRealEstate(realEstateUnitEntity.getId());
           realEstateUnitDTO.setNameUnit(realEstateUnitEntity.getName());
           realEstateUnitDTO.setPrice(realEstateUnitEntity.getPrice());
           realEstateUnitDTO.setValue(realEstateUnitEntity.getValue());
           realEstateUnitDTO.setType(realEstateUnitEntity.getType());
            realEstateUnitDTO.setId(realEstateUnitEntity.getBuilding().getId());
           realEstateUnitDTO.setName(realEstateUnitEntity.getBuilding().getName());
           Map<String,String> districts = district.type();
           String districtName = districts.get(realEstateUnitEntity.getBuilding().getDistrict());
           realEstateUnitDTO.setAddress(realEstateUnitEntity.getBuilding().getStreet()+", "+realEstateUnitEntity.getBuilding().getWard()+", "+districtName);
           listDTO.add(realEstateUnitDTO);
       }
       return listDTO;
    }

    @Override
    public void post(RealEstateUnitDTO dto) {
        RealEstateUnitEntity realEstateUnitEntity = new RealEstateUnitEntity();
        realEstateUnitEntity.setId(dto.getIdRealEstate());
        realEstateUnitEntity.setName(dto.getNameUnit());
        realEstateUnitEntity.setPrice(dto.getPrice());
        realEstateUnitEntity.setValue(dto.getValue());
        realEstateUnitEntity.setType(dto.getType());
        realEstateUnitEntity.setAvatar(dto.getAvatar());
        BuildingEntity buildingEntity = new BuildingEntity();
        buildingEntity = buildingRepository.findById(dto.getId()).get();
        realEstateUnitEntity.setBuilding(buildingEntity);
        realEstateUnitRepository.save(realEstateUnitEntity);
    }

    @Override
    public RealEstateUnitDTO findbyId(Long id) {

        RealEstateUnitEntity realEstateUnitEntity=realEstateUnitRepository.findById(id).get();
        RealEstateUnitDTO realEstateUnitDTO = new RealEstateUnitDTO();
        realEstateUnitDTO.setIdRealEstate(realEstateUnitEntity.getId());
        realEstateUnitDTO.setNameUnit(realEstateUnitEntity.getName());
        realEstateUnitDTO.setPrice(realEstateUnitEntity.getPrice());
        realEstateUnitDTO.setValue(realEstateUnitEntity.getValue());
        realEstateUnitDTO.setType(realEstateUnitEntity.getType());
        realEstateUnitDTO.setAvatar(realEstateUnitEntity.getAvatar());
        realEstateUnitDTO.setId(realEstateUnitEntity.getBuilding().getId());
       return realEstateUnitDTO;
    }

    @Override
    public List<RealEstateUnitDTO> findByStatus() {
        List<RealEstateUnitEntity> realEstateUnitEntity=realEstateUnitRepository.findByStatus("1");
        List<RealEstateUnitDTO> realEstateUnitDTO = new ArrayList<>();
        for (RealEstateUnitEntity x : realEstateUnitEntity ) {
            RealEstateUnitDTO temp = new RealEstateUnitDTO();
            temp.setIdRealEstate(x.getId());
            temp.setNameUnit(x.getName());
            temp.setPrice(x.getPrice());
            temp.setValue(x.getValue());
            temp.setType(x.getType());
            temp.setAvatar(x.getAvatar());
            temp.setId(x.getBuilding().getId());
            temp.setName(x.getBuilding().getName());

            Map<String,String> districts = district.type();
            String districtName = districts.get(x.getBuilding().getDistrict());
            temp.setAddress(x.getBuilding().getStreet()+", "+x.getBuilding().getWard()+", "+districtName);
            realEstateUnitDTO.add(temp);
        }

        return realEstateUnitDTO;
    }
}
