package com.dao;

import com.dao.admin.AdminHomeDao;
import com.entity.ComputerInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:dao-spring.xml")
public class ComputerDaoTest {
    @Autowired
    private AdminHomeDao dao;
    @Test
    public void getAll(){
        List<ComputerInfo> all = dao.getAll(1, 2);
        for (ComputerInfo computerInfo : all) {
            System.out.println(computerInfo);
        }
    }
}
