package com.javaweb.entity;

import javax.persistence.*;

@Entity
@Table(name = "real_estate_unit")
public class RealEstateUnitEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "value")
    private Long value;
    @Column(name="name")
    private String name;
    @Column (name="price")
    private Double price;
    @Column (name="type")
    private String type;
    @Column(name = "avatar")
    private String avatar;
    @Column(name="status")
    private String status;

    @ManyToOne
    @JoinColumn(name="buildingid")
    private BuildingEntity building ;
//	@Column(name = "buildingid")
//	private Integer buildingid;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getValue() {
        return value;
    }

    public void setValue(Long value) {
        this.value = value;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }


    public BuildingEntity getBuilding() {
        return building;
    }

    public void setBuilding(BuildingEntity building) {
        this.building = building;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
