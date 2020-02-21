package com.entity;

import java.math.BigDecimal;
import java.util.Date;

public class OrderInfo {
    private Integer orderId;
    private Integer computerId;
    private String accountName;
    private Date orderDate;
    private BigDecimal price;
    private Integer num;
    private String phone;
    private String address;
    private int state;
    private String computerImage;

    public OrderInfo(Integer orderId, Integer computerId, Date orderDate, BigDecimal price, Integer num, String phone, String address, int state) {
        this.orderId = orderId;
        this.computerId = computerId;
        this.orderDate = orderDate;
        this.price = price;
        this.num = num;
        this.phone = phone;
        this.address = address;
        this.state = state;
    }
    public OrderInfo(Integer orderId, Integer computerId, Date orderDate, BigDecimal price, Integer num, String phone, String address) {
        this.orderId = orderId;
        this.computerId = computerId;
        this.orderDate = orderDate;
        this.price = price;
        this.num = num;
        this.phone = phone;
        this.address = address;
    }


    public OrderInfo() {
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getComputerId() {
        return computerId;
    }

    public void setComputerId(Integer computerId) {
        this.computerId = computerId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getComputerImage() {
        return computerImage;
    }

    public void setComputerImage(String computerImage) {
        this.computerImage = computerImage;
    }

    @Override
    public String toString() {
        return "OrderInfo{" +
                "orderId=" + orderId +
                ", computerId=" + computerId +
                ", orderDate=" + orderDate +
                ", price=" + price +
                ", num=" + num +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", state=" + state +
                '}';
    }
}
