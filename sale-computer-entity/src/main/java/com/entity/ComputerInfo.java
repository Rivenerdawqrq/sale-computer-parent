package com.entity;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Data
public class ComputerInfo {
    private Integer computerId;
    @NotBlank(message = "请输入名称")
    @Size(max = 50, message = "字符最为50")
    private String computerName;
    private String computerPrice;

    private int computerAmount;
    private int computerState;
    private String computerImage;
    private String computerBrandId;
    private String cpuType;
    private String gpuType;
    private String ramType;


}
