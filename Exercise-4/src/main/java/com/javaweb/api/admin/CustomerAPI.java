package com.javaweb.api.admin;

import com.javaweb.model.dto.*;

import com.javaweb.model.response.ResponseDTO;

import com.javaweb.service.CustomerService;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value= "customerAPIOfAdmin")
@RequestMapping("/api/customer")
public class CustomerAPI {

    @Autowired
    private CustomerService customerService;
    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id) {
        ResponseDTO result = customerService.loadStaff(id);
        return result;
    }
    @PostMapping
    public void addOrupdateCustomer (@RequestBody CustomerDTO customerDTO) {
          customerService.AddorUpdate(customerDTO);
    }
    @PostMapping("/assigment")
    public  void updateaassigmentCustomer(@RequestBody AssignmentCustomerDTO assignmentCustomerDTO){
        customerService.AssignCustomer(assignmentCustomerDTO);
    }
    @DeleteMapping("/{ids}")
    public void deleteCustomer(@PathVariable List<Long> ids) {
        customerService.deleteCustomer(ids);
    }

    @PostMapping("/transaction")
    public  void updateaassigmentTransaction(@RequestBody AssignmentTransactionDTO assignmentTransaction){
        customerService.AddorUpdateTransaction(assignmentTransaction);

    }
}
