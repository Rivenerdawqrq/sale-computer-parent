package com.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.*;
import java.math.BigDecimal;

@Data

public class ComputerInfo {
    private Integer computerId;
    @NotBlank(message = "请输入名称")
    @Size(max = 50, message = "字符最为50")
    private String computerName;
    @DecimalMin(value = "1000",message = "最低价格为1000")

    private BigDecimal computerPrice;
    private int computerAmount;
    private int computerState;
    private String computerImage;
    private Integer computerBrandId;
    @NotBlank(message = "不能为空哦")
    private String cpuType;
    @NotBlank(message = "不能为空哦")
    private String gpuType;
    @NotBlank(message = "不能为空哦")
    private String ramType;

    public Integer getComputerId() {
        return computerId;
    }

    public void setComputerId(Integer computerId) {
        this.computerId = computerId;
    }

    public String getComputerName() {
        return computerName;
    }

    public void setComputerName(String computerName) {
        this.computerName = computerName;
    }

    public BigDecimal getComputerPrice() {
        return computerPrice;
    }

    public void setComputerPrice(BigDecimal computerPrice) {
        this.computerPrice = computerPrice;
    }

    public int getComputerAmount() {
        return computerAmount;
    }

    public void setComputerAmount(int computerAmount) {
        this.computerAmount = computerAmount;
    }

    public int getComputerState() {
        return computerState;
    }

    public void setComputerState(int computerState) {
        this.computerState = computerState;
    }

    public String getComputerImage() {
        return computerImage;
    }

    public void setComputerImage(String computerImage) {
        this.computerImage = computerImage;
    }

    public Integer getComputerBrandId() {
        return computerBrandId;
    }

    public void setComputerBrandId(Integer computerBrandId) {
        this.computerBrandId = computerBrandId;
    }

    public String getCpuType() {
        return cpuType;
    }

    public void setCpuType(String cpuType) {
        this.cpuType = cpuType;
    }

    public String getGpuType() {
        return gpuType;
    }

    public void setGpuType(String gpuType) {
        this.gpuType = gpuType;
    }

    public String getRamType() {
        return ramType;
    }

    public void setRamType(String ramType) {
        this.ramType = ramType;
    }
}
