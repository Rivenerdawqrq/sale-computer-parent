/*
电脑品牌表
 */
create table computer_brand(
    brand_id int primary key auto_increment,
    brand_name varchar(30) not null,
    brand_image varchar(100) not null
);
insert into computer_brand(brand_name, brand_image)
values ('苹果','1.png'),('小米','2.png'),('联想','3.png'),('惠普','4.png'),('华为','5.png')



/*
电脑信息表
 */
create table  computer_info(
    computer_id int primary key auto_increment,
    computer_name varchar(50) not null,
    computer_price decimal not null,
    computer_amount int not null,/*库存*/
    /*这里是商品的状态  1为上架 0为下架*/
    computer_state int check ( computer_state = 1 and computer_state=0 ),
    computer_brand_id int,
    computer_image varchar(50),
    cpu_type varchar(30) not null,
    gpu_type varchar(30) not null,
    ram_type varchar(30) not null,
    foreign key(computer_brand_id) references computer_brand(brand_id)
);


insert into computer_info(computer_name, computer_price, computer_amount, computer_state, computer_brand_id,computer_image, cpu_type, gpu_type, ram_type)
values ('Apple MacBook Air 13.3',6309.00,100,1,1,'apple.png','Core i5','集成显卡','8G'),
       ('Apple 2019款 MacBook Pro 13.3',10619.00,123,1,1,'apple2019.png','八代i5','集成显卡','LPDDR3(8G)'),
       ('HP ENVY13薄锐超轻薄',7699,100,1,4,'HP13.png','Intel i7低功耗版','集成显卡','8GB'),
       ('暗影精灵5',7299,133,1,4,'an5.png','Intel i7标准电压版','GTX1660Ti','8GB'),
       ('小米Pro 2019款 15.6英寸金属轻薄',7299,133,1,2,'xiaomiPro.png','酷睿i7-8550U','MX250 2G独显','16GB'),
       ('小米游戏本 2019款 15.6英寸',8599,155,1,2,'xiaomiyouxiben.png','Intel i7标准电压版','GTX1660Ti','16GB'),
       ('华为MateBook 13',6099,150,1,5,'huawei1.png','Intel i7低功耗版','MX250','8GB'),
       ('华为笔记本MateBook X Pro',8699,100,1,5,'huawei2.png','Intel i5低功耗版','MX250','8GB'),
       ('外星人Alienware m17 R2',19999.00,1000,1,7,'Snipaste_2019-12-17_19-55-27.png','i7-9750H','RTX2060 OC 6G','16GB'),
       ('外星人Alienware area-51m',25999.00,1033,1,7,'Snipaste_2019-12-17_20-00-52.png','i7-9700K','RTX2070 OC 8G','16GB'),
       ('外星人（alienware）全新M15-R2',15999.00,10034,1,7,'Snipaste_2019-12-17_20-03-40.png','i7-9750H','GTX1660Ti','16GB'),
       ('联想(Lenovo)拯救者Y7000P',8999.00,133,1,3,'Snipaste_2019-12-17_20-08-36.png','i7-9750H','GTX1660Ti','16GB'),
       ('联想(Lenovo)330C',4200.00,333,1,3,'Snipaste_2019-12-17_20-13-20.png','i5-8250U','独显MX110','4GB'),
       ('联想ThinkPad 翼490',5799.00,100,1,3,'Snipaste_2019-12-17_20-35-02.png','i5-8265U','2G独显 FHD','8GB'),
       ('联想（Lenovo）小新Air',4399.00,300,1,3,'Snipaste_2019-12-17_20-36-30.png','R7-2700U','AMD R7','8GB'),
       ('Apple 2019新品 MacBook Pro 16',22199.00,322.1,3,'Snipaste_2019-12-17_20-49-17.png','九代八核i9','Radeon Pro 5500M','16GB'),
       ('ROG 魔霸3',10999,1334,8,'')
/**
管理员
 */
create table admin_info(
    admin_id int primary key auto_increment,
    account_num varchar(10),  --登陆账号
    account_pwd varchar(10)  --登陆密码
);
/**
用户账户表
 */
create table user_account(
    user_id  int primary key auto_increment,
    account_name varchar(11) not null,
    account_pwd varchar(16) not null,
    account_phone varchar(11) not null
);

