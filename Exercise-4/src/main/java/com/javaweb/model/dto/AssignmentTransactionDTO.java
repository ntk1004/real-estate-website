package com.javaweb.model.dto;

public class AssignmentTransactionDTO {
     private Long customerId;
     private Long id;
     private String transactionD;
     private String code;
    private String user;

     public String getUser() {
          return user;
     }

     public void setUser(String user) {
          this.user = user;
     }

     public Long getCustomerId() {
          return customerId;
     }

     public void setCustomerId(Long customerId) {
          this.customerId = customerId;
     }

     public Long getId() {
          return id;
     }

     public void setId(Long id) {
          this.id = id;
     }

     public String getTransactionD() {
          return transactionD;
     }

     public void setTransactionD(String transactionD) {
          this.transactionD = transactionD;
     }

     public String getCode() {
          return code;
     }

     public void setCode(String code) {
          this.code = code;
     }
}