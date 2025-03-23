package com.javaweb.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name= "building")
public class BuildingEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


   @ManyToMany(fetch = FetchType.LAZY)
   @JoinTable(name="assignmentbuilding",
      joinColumns = @JoinColumn(name ="buildingid",nullable = false),
      inverseJoinColumns = @JoinColumn(name = "staffid",nullable = false))
   private List<UserEntity> userEntities = new ArrayList<>();

  @OneToMany(mappedBy = "building",fetch = FetchType.LAZY,cascade = {CascadeType.MERGE, CascadeType.PERSIST},orphanRemoval = true )
    private List<RealEstateUnitEntity> realEstateUnitEntities = new ArrayList<>();

    public List<RealEstateUnitEntity> getRealEstateUnitEntities() {
        return realEstateUnitEntities;
    }

    public void setRealEstateUnitEntities(List<RealEstateUnitEntity> realEstateUnitEntities) {
        this.realEstateUnitEntities = realEstateUnitEntities;
    }

    public List<UserEntity> getUserEntities() {
        return userEntities;
    }

    public void setUserEntities(List<UserEntity> userEntities) {
        this.userEntities = userEntities;
    }

    @Column(name="name")
    private String name;

    @Column (name="street")
    private String street;

    @Column (name = "ward")
    private String ward;

//	@Column (name="districtid")
//	private Long districtid;
   @Column(name =  "district")
   private  String district;
    @Column (name = "structure")
    private String structure;

    @Column(name="managerphone")
    private String managerphonenumber;

@Column(name = "managername")
private  String managername;

    @Column (name = "numberofbasement")
    private Long numberofbasement;

    @Column (name="floorarea")
    private Long floorarea;

    @Column (name="direction")
    private String direction;

    @Column(name = "level")
    private Long level;
   @Column(name="type ")
   private String type;
    @Column (name = "rentprice")
    private Long rentprice;

    @Column (name = "servicefee")
    private Long servicefee;

    @Column (name = "brokeragefee")
    private Long brokeragefee;
    
    @Column(name="avatar")
    private String avatar;

    //lazy: tạm thời khong lay du lieu tu 1 building sang nhieu rentarea
    //eager: laay luon tu 1 building se lay dc nhieu rentarea (lay tat ca cac bang lien quan)


    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getManagername() {
        return managername;
    }

    public void setManagername(String managername) {
        this.managername = managername;
    }

    public Long getId() {
        return id;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getStructure() {
        return structure;
    }

    public void setStructure(String structure) {
        this.structure = structure;
    }

    public String getManagerphonenumber() {
        return managerphonenumber;
    }

    public void setManagerphonenumber(String managerphonenumber) {
        this.managerphonenumber = managerphonenumber;
    }

    public Long getNumberofbasement() {
        return numberofbasement;
    }

    public void setNumberofbasement(Long numberofbasement) {
        this.numberofbasement = numberofbasement;
    }

    public Long getFloorarea() {
        return floorarea;
    }

    public void setFloorarea(Long floorarea) {
        this.floorarea = floorarea;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public Long getLevel() {
        return level;
    }

    public void setLevel(Long level) {
        this.level = level;
    }

    public Long getRentprice() {
        return rentprice;
    }

    public void setRentprice(Long rentprice) {
        this.rentprice = rentprice;
    }

    public Long getServicefee() {
        return servicefee;
    }

    public void setServicefee(Long servicefee) {
        this.servicefee = servicefee;
    }

    public Long getBrokeragefee() {
        return brokeragefee;
    }

    public void setBrokeragefee(Long brokeragefee) {
        this.brokeragefee = brokeragefee;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

//	public Long getDistrictid() {
//		return districtid;
//	}
//
//	public void setDistrictid(Long districtid) {
//		this.districtid = districtid;
//	}


}