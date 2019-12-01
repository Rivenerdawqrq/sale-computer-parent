
create table computer_brand_info(
    brand_id int primary key auto_increment,
    brand_name varchar(30) not null
);

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
    foreign key(computer_brand_id) references computer_brand_info(brand_id)
);


insert into computer_brand_info( brand_name)
values ('苹果'),('小米'),('联想'),('惠普'),('三星'),('戴尔');

insert into computer_info(computer_name, computer_price, computer_amount, computer_state, computer_brand_id, cpu_type, gpu_type, ram_type)
values ('Apple MacBook Air 13.3',6309.00,100,1,1,'Core i5','集成显卡','8G'),
       ('Apple 2019款 MacBook Pro 13.3',10619.00,123,1,1,'八代i5','集成显卡','LPDDR3(8G)');