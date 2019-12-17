
create table computer_brand(
    brand_id int primary key auto_increment,
    brand_name varchar(30) not null
    brand_image varchar(30) not null
);

drop table computer_brand_info

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


insert into computer_brand_info( brand_name)
values ('苹果'),('小米'),('联想'),('惠普'),('华为');

insert into computer_info(computer_name, computer_price, computer_amount, computer_state, computer_brand_id,computer_image, cpu_type, gpu_type, ram_type)
values ('Apple MacBook Air 13.3',6309.00,100,1,1,'apple.png','Core i5','集成显卡','8G'),
       ('Apple 2019款 MacBook Pro 13.3',10619.00,123,1,1,'apple2019.png','八代i5','集成显卡','LPDDR3(8G)'),
       ('HP ENVY13薄锐超轻薄',7699,100,1,4,'HP13.png','Intel i7低功耗版','集成显卡','8GB'),
       ('暗影精灵5',7299,133,1,4,'an5.png','Intel i7标准电压版','GTX1660Ti','8GB'),
       ('小米Pro 2019款 15.6英寸金属轻薄',7299,133,1,2,'xiaomiPro.png','酷睿i7-8550U','MX250 2G独显','16GB'),
       ('小米游戏本 2019款 15.6英寸',8599,155,1,2,'xiaomiyouxiben.png 15.6英寸','Intel i7标准电压版','GTX1660Ti','16GB'),
       ('华为MateBook 13',6099,150,1,5,'huawei1.png','Intel i7低功耗版','MX250','8GB'),
       ('华为笔记本MateBook X Pro',8699,100,1,5,'huawei2.png','Intel i5低功耗版','MX250','8GB')