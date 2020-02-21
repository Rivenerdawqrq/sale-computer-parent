package com.dao.computer;

import com.entity.OrderInfo;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public interface OrderDao {
    void createOrder( Integer orderId,String accountName,Integer computerId,
                      String orderDate,
                      double price, Integer num,
                      String phone, String address);
}
