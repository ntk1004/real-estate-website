package com.javaweb.service.impl;

import com.javaweb.converter.CustomerConverter;
import com.javaweb.converter.CustomerSearchResponseconverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentCustomerDTO;

import com.javaweb.model.dto.AssignmentTransactionDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import java.util.ArrayList;

import java.util.List;

@Service
public class CustomerSeviceImpl implements CustomerService {
    @Autowired
    private CustomerRepository customerRepository;
  @Autowired
  private UserRepository userRepository;
    @Autowired
    private CustomerSearchResponseconverter  customerSearchResponseconverter;
    @Autowired
    private CustomerConverter customerConverter;
    @Autowired
    private TransactionRepository transactionRepository;
    @Override
    public List<CustomerSearchResponse> findAll(CustomerSearchRequest request) {
       List<CustomerEntity> customerEntities = customerRepository.findAll(request);
       List<CustomerSearchResponse> customerSearchReponses = new ArrayList<>();
       for (CustomerEntity customerEntity : customerEntities) {
           CustomerSearchResponse customerSearchResponse = new CustomerSearchResponse();
           customerSearchResponse=customerSearchResponseconverter.tobuildingDTO(customerEntity);
           customerSearchReponses.add( customerSearchResponse);
       }
       return customerSearchReponses;
    }

    @Override
    public int contTotalItem (List<CustomerSearchResponse> customerSearchResponse)  {
        return customerSearchResponse != null ? customerSearchResponse.size() : 0;
    }


    @Override
    public void AddorUpdate(CustomerDTO customerDTO) {
       CustomerEntity customerEntity = new CustomerEntity();
       customerEntity=customerConverter.convertToEntity(customerDTO);
       customerRepository.save(customerEntity);
    }
@Override
public   CustomerDTO findById(Long id){
      CustomerDTO customerDTO = new CustomerDTO();
     CustomerEntity customerEntity = new CustomerEntity();
      customerEntity=customerRepository.findById(id).get();
      customerDTO=customerConverter.convertToDto(customerEntity);
      return customerDTO;
}
@Override
    public ResponseDTO loadStaff(Long id){
    CustomerEntity customerEntity = customerRepository.findById(id).get();
    List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1,"STAFF");
//        List<UserEntity> staffAssignment = new ArrayList<>();
//                for (AssignBuildingEntity x : building.getAssignBuildingEntities()){
//                    staffs.add(x.getUserEntity());
//                }
    List<UserEntity> staffAssignment = customerEntity.getUserEntityList();
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
public void AssignCustomer(AssignmentCustomerDTO assignmentCustomerDTO){
        CustomerEntity customerEntity = customerRepository.findById(assignmentCustomerDTO.getCustomerId()).get();
        List<UserEntity> staffs = userRepository.findByIdIn(assignmentCustomerDTO.getStaffs());
        customerEntity.setUserEntityList(staffs);
        customerRepository.save(customerEntity);
}

    @Override
    @Transactional
    public void deleteCustomer(List<Long> id) {
        customerRepository.deleteByIdIn(id);
    }

    @Override
    public void AddorUpdateTransaction(AssignmentTransactionDTO assignmentTransaction) {
        CustomerEntity customerEntity = customerRepository.findById(assignmentTransaction.getCustomerId()).get();
        TransactionEntity transactionEntity = new TransactionEntity();
        transactionEntity.setId(assignmentTransaction.getId());
        transactionEntity.setCustomer(customerEntity);
        transactionEntity.setCode(assignmentTransaction.getCode());
        transactionEntity.setNote(assignmentTransaction.getTransactionD());
        transactionEntity.setCreatedby(assignmentTransaction.getUser());
        LocalDateTime now = LocalDateTime.now();
        Timestamp timestamp = Timestamp.valueOf(now);
        transactionEntity.setCreateddate(timestamp);
        transactionRepository.save(transactionEntity);
    }
}

