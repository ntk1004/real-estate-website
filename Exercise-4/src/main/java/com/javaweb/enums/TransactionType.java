package com.javaweb.enums;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public enum TransactionType {
    CSKH("Chăm Sóc Khách Hàng"),
    DDX ("Dẫn Đi Xem")
    ;
    private final String name;
    TransactionType(String name) {
        this.name=name;
    }
    public static Map<String,String> transactiontype(){
        Map<String,String> map=new LinkedHashMap<>();
        for(TransactionType t:TransactionType.values()){
            map.put(t.toString(),t.name);
        }
return map;
    }
}
