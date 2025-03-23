package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.BuildingService;
import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.List;

@RestController(value= "buildingAPIOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {
    private static final String UPLOAD_DIR = "C:/uploads/";
    @Autowired
    private BuildingService buildingService;
    @Autowired
    private IUserService userService;

    @PostMapping
    public BuildingDTO addOrupdateBuilding (@RequestBody BuildingDTO buildingDTO) throws IOException {
        String fileName = null;
        if (buildingDTO.getImageBase64() != null && buildingDTO.getAvatar() != null) {
            byte[] decodedBytes = Base64.getDecoder().decode(buildingDTO.getImageBase64());
            fileName = buildingDTO.getAvatar();
            Path filePath = Paths.get(UPLOAD_DIR + fileName);
            Files.write(filePath, decodedBytes);

    }
        BuildingDTO buildingDTO1  =  buildingService.AddorUpdate(buildingDTO);
        return buildingDTO1;
    }
    @DeleteMapping("/{ids}")
    public  void DeleteBuilding (@PathVariable List<Long> ids) {
        buildingService.deleteBuilding(ids);
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id) {
 ResponseDTO result = buildingService.listStaffs(id);
    return result;
    }
    @PostMapping("/assigment")
    public  void updateaassigmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){
      buildingService.AssigmentBuillding(assignmentBuildingDTO);
    }
    }
