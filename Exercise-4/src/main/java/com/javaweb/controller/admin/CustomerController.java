package com.javaweb.controller.admin;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.enums.TransactionType;
import com.javaweb.enums.buildingType;
import com.javaweb.enums.district;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.CustomerService;
import com.javaweb.service.impl.UserService;
import com.sun.deploy.net.HttpRequest;
import com.sun.deploy.net.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller(value = "customerControllerOfAdmin")
public class CustomerController {
    @Autowired
    CustomerService customerService;
    @Autowired

    private UserService userService;
    @Autowired
    private CustomerRepository customerRepository;
    @GetMapping(value = "/admin/customer-list")
    public ModelAndView customerList(CustomerSearchRequest customerSearchRequest, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/list");
        mav.addObject("customerDTO", customerSearchRequest);
        mav.addObject("listStaff" , userService.getStaffs());
        List<CustomerSearchResponse>  ListCustomer = customerService.findAll(customerSearchRequest);
        CustomerSearchResponse customerSearchResponse = new CustomerSearchResponse();
        customerSearchResponse.setListResult(ListCustomer);
        customerSearchResponse.setTotalItems(customerService.contTotalItem(ListCustomer));
        mav.addObject("CustomerList", customerSearchResponse);
        return mav;
    }
    @GetMapping(value = "/admin/customer-edit")
    public ModelAndView customerAdd(@ModelAttribute("customerEdit") CustomerDTO customerDTO , HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        return mav;
    }

    @GetMapping(value = "/admin/customer-edit-{id}")
    public ModelAndView customerEdit(@PathVariable("id") Long id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        CustomerDTO customerDTO = new CustomerDTO();
       customerDTO=customerService.findById(id);
        CustomerEntity customerEntity=customerRepository.findById(id).get();
        mav.addObject("transactionType", TransactionType.transactiontype());
        mav.addObject("customerEdit", customerDTO);
        mav.addObject("Transaction", customerEntity.getTransactionEntities());
        mav.addObject("NameUser", SecurityUtils.getPrincipal().getFullName());
        return mav;
    }
}
