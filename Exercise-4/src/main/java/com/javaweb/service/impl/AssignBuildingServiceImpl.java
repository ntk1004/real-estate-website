package com.javaweb.service.impl;

import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.service.AssignBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class  AssignBuildingServiceImpl implements AssignBuildingService {
    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;

    @Override
    public   void deleteBuildingsId (List<Long> Ids){
assignmentBuildingRepository.deleteBybuildingEntity_IdIn(Ids);
    }

}
