package com.entity;

import lombok.Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.Size;

@Data
public class UserAccount {
    private int userId;
    @Size(max = 11,min = 6,message = "最小为6位数，最大为11位数")
    private String accountName;
    @Size(max = 16,min = 6,message = "最小为6位数，最大为16位数")
    private String accountPwd;
    @Size(max = 11,min = 11,message = "请输入正确的手机号码")
    private String accountPhone;
    private String receiptPhone;
    private String receiptAddress;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getAccountPwd() {
        return accountPwd;
    }

    public void setAccountPwd(String accountPwd) {
        this.accountPwd = accountPwd;
    }

    public String getAccountPhone() {
        return accountPhone;
    }

    public void setAccountPhone(String accountPhone) {
        this.accountPhone = accountPhone;
    }

    public String getReceiptPhone() {
        return receiptPhone;
    }

    public void setReceiptPhone(String receiptPhone) {
        this.receiptPhone = receiptPhone;
    }

    public String getReceiptAddress() {
        return receiptAddress;
    }

    public void setReceiptAddress(String receiptAddress) {
        this.receiptAddress = receiptAddress;
    }
}
