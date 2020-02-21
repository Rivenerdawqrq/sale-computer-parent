package com.entity;

public class ComputerCart {
    private Integer id;
    private String accountName;
    private Integer computerId;
    private Integer num;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public Integer getComputerId() {
        return computerId;
    }

    public void setComputerId(Integer computerId) {
        this.computerId = computerId;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    @Override
    public String toString() {
        return "ComputerCart{" +
                "id=" + id +
                ", accountName='" + accountName + '\'' +
                ", computerId=" + computerId +
                ", num=" + num +
                '}';
    }
}
