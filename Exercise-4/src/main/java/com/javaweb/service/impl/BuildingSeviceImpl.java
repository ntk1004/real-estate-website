package com.javaweb.service.impl;

import com.javaweb.converter.BuildingEntityConverter;
import com.javaweb.converter.BuildingSearchResponseconverter;
import com.javaweb.converter.BuildingSearchRequestconverter;
import com.javaweb.entity.AssignBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RealEstateUnitEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.AssignmentBuildingRepository;

import com.javaweb.repository.BuildingRepository;
//import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;

import com.javaweb.service.AssignBuildingService;
import com.javaweb.service.BuildingService;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class BuildingSeviceImpl implements BuildingService {


            @Autowired
            private AssignBuildingService assignBuildingService;
            @Autowired
            AssignmentBuildingRepository assignmentBuildingRepository;
//            @Autowired
//            RentAreaRepository rentAreaRepository;
            @Autowired
            BuildingEntityConverter buildingEntityConverter;
            @Autowired
            BuildingSearchResponseconverter buildingSearchResponseconverter;
            @Autowired
            private BuildingRepository buildingRepository;
            @Autowired
            private UserRepository userRepository;
            @Autowired
            private  BuildingSearchRequestconverter buildingSearchRequestconverter;

            @Override
            public ResponseDTO listStaffs(Long buildingId) {
                BuildingEntity building = buildingRepository.findById(buildingId).get();
                List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1,"STAFF");
//        List<UserEntity> staffAssignment = new ArrayList<>();
//                for (AssignBuildingEntity x : building.getAssignBuildingEntities()){
//                    staffs.add(x.getUserEntity());
//                }
                List<UserEntity> staffAssignment = building.getUserEntities();
                List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
                ResponseDTO responseDTO = new ResponseDTO();
                for ( UserEntity it :staffs){
                    StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
                    staffResponseDTO.setFullName(it.getFullName());
                    staffResponseDTO.setStaffId(it.getId());
                    if(staffAssignment.contains(it)){
                        staffResponseDTO.setChecked("checked");
                    }
                    else {
                        staffResponseDTO.setChecked("");
                    }
                    staffResponseDTOS.add(staffResponseDTO);
                }
                responseDTO.setData(staffResponseDTOS);
                responseDTO.setMessage("success");
                return  responseDTO;

            }
            @Override
            public BuildingDTO buildingDTO(Long buildingId) {
                BuildingEntity buildingEntity = buildingRepository.findById(buildingId).get();

                BuildingDTO buildingDTO = new BuildingDTO();
                buildingDTO.setId(buildingId);
                buildingDTO.setAvatar(buildingEntity.getAvatar());
                buildingDTO.setName(buildingEntity.getName());
                buildingDTO.setFloorArea(buildingEntity.getFloorarea());
                buildingDTO.setManagerName(buildingEntity.getManagername());
                List<RealEstateUnitEntity> rt = buildingEntity.getRealEstateUnitEntities();
                String arearesult  =  rt.stream().distinct().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
                buildingDTO.setLevel(buildingEntity.getLevel());
                buildingDTO.setRentPrice(buildingEntity.getRentprice());
                buildingDTO.setNumberOfBasement(buildingEntity.getNumberofbasement());
                buildingDTO.setDistrict(buildingEntity.getDistrict());
                buildingDTO.setRentArea(arearesult);
                buildingDTO.setWard(buildingEntity.getWard());
                buildingDTO.setStreet(buildingEntity.getStreet());
                List<String> type = new ArrayList<>();
                String s = buildingEntity.getType();
                String a[]= s.split(",");
                for (String x : a){
                    type.add(x);
                }
                buildingDTO.setTypeCode(type);

                return buildingDTO;
            }

            @Override
            public BuildingSearchResponse buildingsearch(BuildingSearchRequest buildingSearchRequest) {
//        BuildingEntity buildingEntity = new BuildingEntity();
//        BuildingDTO buildingDTO1 = buildingSearchRequestconverter.toBuildingDTO(buildingSearchRequest);
//        if(buildingDTO1.getName()!=null && !buildingDTO1.getName().equals("")) {
//            buildingEntity = buildingRepository.findByNameContaining(buildingSearchRequest.getName());
//        }
//            BuildingSearchResponse buildingSearchResponse = new BuildingSearchResponse();
//        buildingSearchResponse.setId(buildingEntity.getId());
//        buildingSearchResponse.setName(buildingEntity.getName());
//        buildingSearchResponse.setNumberOfBasement(buildingEntity.getNumberofbasement());
//        buildingSearchResponse.setAddress(buildingEntity.getStreet()+" "+ buildingEntity.getWard()+" "+buildingEntity.getDistrict());
//        buildingSearchResponse.setFloorArea(buildingEntity.getFloorarea());
//        buildingSearchResponse.setManagerName(buildingEntity.getManagername());
//        buildingSearchResponse.setManagerPhone(buildingEntity.getManagerphonenumber());
//            List<RentAreaEntity> rt = buildingEntity.getRentAreaEntities();
//            String arearesult = rt.stream().distinct().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
//        buildingSearchResponse.setRentArea(arearesult);
//
//
//        return buildingSearchResponse;
                return  null;
            }

            @Override
            public  List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable)
            {

                BuildingSearchRequest buildingSearchRequest1 = buildingSearchRequestconverter.toBuildingDTO(buildingSearchRequest);
                List <BuildingEntity> responseList =  buildingRepository.findAll(buildingSearchRequest1);
                List<BuildingSearchResponse> buildingSearchResponses = new ArrayList<>();
                for (BuildingEntity x :responseList){
                    BuildingSearchResponse searchResponse = new BuildingSearchResponse();
                    searchResponse = BuildingSearchResponseconverter.tobuildingDTO(x);
                    buildingSearchResponses.add(searchResponse);
                }

                return  buildingSearchResponses;
            }

    @Override
    public int contTotalItem(List<BuildingSearchResponse> buildingSearchResponses) {
        return buildingSearchResponses != null ? buildingSearchResponses.size() : 0;
    }


    @Override
            @Transactional
            public   BuildingDTO AddorUpdate (BuildingDTO buildingDTO){
                    BuildingEntity buildingEntity = new BuildingEntity();
                    buildingEntity =  buildingEntityConverter.toBuildingEntity(buildingDTO);
                    buildingEntity.setAvatar(buildingDTO.getAvatar());
                    buildingRepository.save(buildingEntity);

                return null;
            }
            @Override
            @Transactional
            public void deleteBuilding(List<Long> ids){

                buildingRepository.deleteByIdIn(ids);
            }
            @Override
            public void AssigmentBuillding(AssignmentBuildingDTO assignmentBuildingDTO){



                BuildingEntity  building = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
                List<UserEntity> userEntities = userRepository.findByIdIn(assignmentBuildingDTO.getStaffs());

                building.setUserEntities(userEntities);
                buildingRepository.save(building);



    }
    }
