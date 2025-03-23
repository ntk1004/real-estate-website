package com.javaweb.controller.admin;



import com.javaweb.enums.buildingType;
import com.javaweb.enums.district;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.BuildingService;
import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private IUserService userService;
   @Autowired
    BuildingService buildingService;

    @GetMapping(value = "/admin/building-list")
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest , HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/list");
        mav.addObject("modelSearch",buildingSearchRequest);
        List<BuildingSearchResponse> responseList;


        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")){
            long staffid =SecurityUtils.getPrincipal().getId();
            buildingSearchRequest.setStaffId(staffid);
            responseList = buildingService.findAll(buildingSearchRequest, PageRequest.of(buildingSearchRequest.getPage() - 1, buildingSearchRequest.getMaxPageItems()));
        }
        else {
            responseList = buildingService.findAll(buildingSearchRequest, PageRequest.of(buildingSearchRequest.getPage() - 1, buildingSearchRequest.getMaxPageItems()));
        }
        BuildingSearchResponse buildingSearchResponse = new BuildingSearchResponse();
        buildingSearchResponse.setListResult(responseList);
        buildingSearchResponse.setTotalItems(buildingService.contTotalItem(responseList));
        mav.addObject("buildingList" , buildingSearchResponse);

        mav.addObject("listStaffs" , userService.getStaffs());
        mav.addObject("districts", district.type());
        mav.addObject("typeCodes", buildingType.type());
        return mav;
    }

    @GetMapping(value = "/admin/building-edit")
    public ModelAndView buildingEdit(@ModelAttribute ("buildingEdit") BuildingDTO buildingDTO ,HttpServletRequest request) {

        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("districts", district.type());
        mav.addObject("typeCodes", buildingType.type());
        return mav;
    }

    @GetMapping(value = "/admin/building-edit-{id}")
    public ModelAndView buildingEdit(@PathVariable("id") Long id , HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/edit");

        BuildingDTO buildingDTO = buildingService.buildingDTO(id);
//        String imageName  = buildingDTO.getAvatar();
//        String imageUrl = (imageName != null && !imageName.isEmpty()) ? "uploads/" + imageName : "/images/default.jpg";

        mav.addObject("buildingEdit",buildingDTO);
        mav.addObject("districts", district.type());
        mav.addObject("typeCodes", buildingType.type());
        return mav;
    }
}
