package com.javaweb.api.web;

import com.javaweb.model.dto.RealEstateUnitDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.service.RealEstateUnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.List;

@RestController
@RequestMapping("/api/product")

public class PostProduct {
    private static final String UPLOAD_DIR = "C:/uploads/";
    @Autowired
    private RealEstateUnitService realEstateUnitService;
    @PostMapping
    public void createUser(@RequestBody RealEstateUnitDTO realEstateUnitDTO) throws IOException {
        String fileName = null;
        if (realEstateUnitDTO.getImageBase64() != null && realEstateUnitDTO.getAvatar() != null) {
            byte[] decodedBytes = Base64.getDecoder().decode(realEstateUnitDTO.getImageBase64());
            fileName = realEstateUnitDTO.getAvatar();
            Path filePath = Paths.get(UPLOAD_DIR + fileName);
            Files.write(filePath, decodedBytes);

        }
        realEstateUnitService.post(realEstateUnitDTO);
    }

    @DeleteMapping("/{ids}")
    public void delete(@PathVariable List<Long> ids) {
       realEstateUnitService.delete(ids);
    }
}
