package com.entity;

import lombok.Data;

import javax.validation.constraints.NotBlank;


@Data
public class ComputerBrand {
    private Integer brandId;
    @NotBlank
    private String brandName;
    private String brandImage;

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getBrandImage() {
        return brandImage;
    }

    public void setBrandImage(String brandImage) {
        this.brandImage = brandImage;
    }
}
