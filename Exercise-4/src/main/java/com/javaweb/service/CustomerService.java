package com.javaweb.service;

import com.javaweb.model.dto.AssignmentCustomerDTO;

import com.javaweb.model.dto.AssignmentTransactionDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;

import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface CustomerService {
List<CustomerSearchResponse> findAll(CustomerSearchRequest request);
void AddorUpdate (CustomerDTO customerDTO);
int contTotalItem (List<CustomerSearchResponse> customerSearchResponse) ;
CustomerDTO findById(Long id);
ResponseDTO loadStaff (Long id);
void AssignCustomer(AssignmentCustomerDTO assignmentCustomerDTO);
void deleteCustomer(List<Long> ids);
void AddorUpdateTransaction(AssignmentTransactionDTO assignmentTransaction);
}
