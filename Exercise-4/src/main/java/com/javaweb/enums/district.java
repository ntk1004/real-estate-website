package com.javaweb.enums;

import java.util.Map;
import java.util.TreeMap;

public enum district {
    QUAN_1("Quận 1"),
    QUAN_2("Quận 2"),
    QUAN_10("Quận 10"),
    QUAN_4("Quận 4"),
    QUAN_7("Quận 7"),
    QUAN_8("Quận 8"),
    QUAN_9("Quận 9"),
    QUAN_HADONG("Quận Hà Đông"),
    QUAN_HAIBATRUNG("Quận Hai Bà Trưng"),
    QUAN_THANHXUAN("Quận Thanh Xuân"),
    QUAN_LONGBIEN("Quận Long Biên");

    private  final String districtName;
    district(String districtName){
        this.districtName=districtName;
    }
    public  static Map<String,String> type(){
        Map<String,String> districts = new TreeMap<>();
       for (district it :district.values()){
           districts.put(it.toString(),it.districtName);
       }
       return  districts;
    }
}
