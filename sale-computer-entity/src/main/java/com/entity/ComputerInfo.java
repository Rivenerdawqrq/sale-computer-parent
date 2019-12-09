package com.entity;

import lombok.Data;

import javax.validation.constraints.*;
import java.math.BigDecimal;

@Data
public class ComputerInfo {
    private Integer computerId;
    @NotBlank(message = "请输入名称")
    @Size(max = 50, message = "字符最为50")
    private String computerName;
    @DecimalMin(value = "1000")
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


}
