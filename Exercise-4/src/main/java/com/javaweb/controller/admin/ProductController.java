package com.javaweb.controller.admin;

import com.javaweb.model.dto.RealEstateUnitDTO;
import com.javaweb.service.RealEstateUnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ProductController {
    @Autowired
    private RealEstateUnitService realEstateUnitService;
    @GetMapping("/admin/product-list")
    public ModelAndView getProducts(@ModelAttribute RealEstateUnitDTO realEstateUnitDTO) {
            ModelAndView mav = new ModelAndView();
            mav.setViewName("admin/product/products");
            mav.addObject("realEstateUnitDTO", realEstateUnitDTO);
        List<RealEstateUnitDTO> responseList = realEstateUnitService.findAll(realEstateUnitDTO);
        RealEstateUnitDTO realEstateUnitDTO1 = new RealEstateUnitDTO();
        realEstateUnitDTO1.setListResult(responseList);
        realEstateUnitDTO1.setTotalItems(responseList.size());
        realEstateUnitDTO1.setMaxPageItems(10);
        mav.addObject("ListBuilding", realEstateUnitDTO1);
        return mav;
    }
    @GetMapping("/admin/product-edit")
    public ModelAndView getProductEdit(@ModelAttribute("realestateunit") RealEstateUnitDTO realEstateUnitDTO , HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/product/post");
        return mav;
    }
    @GetMapping("/admin/product-edit-{ids}")
    public ModelAndView getProductEdit(@PathVariable("ids") Long ids, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/product/post");
        RealEstateUnitDTO realEstateUnitDTO = new RealEstateUnitDTO();
        realEstateUnitDTO=realEstateUnitService.findbyId(ids);
        mav.addObject("realestateunit", realEstateUnitDTO);
            return mav;
    }
}
