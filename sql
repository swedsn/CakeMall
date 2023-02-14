create database if not exists cakemall
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;

use cakemall;

create table if not exists administrator
(
    username varchar(12) comment '用户名',
    password varchar(20) comment '用户密码'
);

insert into administrator
values ('admin', 'admin');


drop table user;
create table if not exists user
(
#     id int auto_increment  not null ,
    telephone  varchar(11) comment '电话号码' not null,
    `password` varchar(20) comment '用户密码' not null,
    username   varchar(30) comment '用户姓名',
    sex        varchar(2) comment '性别',
    address    varchar(50) comment '家庭地址',
    primary key (telephone)
);


insert into `user` (`telephone`, `password`, `username`, `sex`, `address`)
values ('15722013706', '^db8Dd3$', '于昊焱', '男', '瓦房店');
insert into `user` (`telephone`, `password`, `username`, `sex`, `address`)
values ('15238226011', '^euBPp51$', '董鹏煊', '男', '郑州');
insert into `user` (`telephone`, `password`, `username`, `sex`, `address`)
values ('17713765254', '^y_i__R$', '萧伟诚', '男', '平顶山');
insert into `user` (`telephone`, `password`, `username`, `sex`, `address`)
values ('17304683293', '^G__NE0$', '江峻熙', '男', '义乌');
insert into `user` (`telephone`, `password`, `username`, `sex`, `address`)
values ('15169424420', '^IDvF_jH3$', '黄修洁', '男', '临汾');
insert into `user` (`telephone`, `password`, `username`, `sex`, `address`)
values ('15934532490', '^fhewjg__7$', '邵聪健', '男', '平度');
insert into `user` (`telephone`, `password`, `username`, `sex`, `address`)
values ('14785428089', '^U2__4B0$', '莫聪健', '男', '贵阳');
insert into `user` (`telephone`, `password`, `username`, `sex`, `address`)
values ('15967235238', '^J8kM_GK_6__0zP1_z_$', '钱文昊', '男', '即墨');
insert into `user` (`telephone`, `password`, `username`, `sex`, `address`)
values ('17613678354', '^p7p_6RMPZK_L$', '黎弘文', '男', '宝鸡');
insert into `user` (`telephone`, `password`, `username`, `sex`, `address`)
values ('14512190244', '^k6neT_$', '梁炫明', '男', '渭南');
# create table if not exists menu

drop table goodscategory;
create table goodscategory
(
    categoryID   int comment '分类ID' auto_increment primary key,
    categoryName varchar(30) comment '分类名称' not null,
    parentID     int comment '父类ID',
    isParent     bool comment '是否为父类'
);

insert into goodscategory
values (1001, '水果蛋糕', null, true);
insert into goodscategory
values (1002, '奶油蛋糕', null, true);
insert into goodscategory
values (1003, '慕斯蛋糕', null, true);

insert into goodscategory
values (1004, '草莓蛋糕', 1001, false);
insert into goodscategory
values (1005, '芒果蛋糕', 1001, false);
insert into goodscategory
values (1006, '柠檬蛋糕', 1001, false);

insert into goodscategory
values (1007, '奶油霜刺绣蛋糕', 1002, false);
insert into goodscategory
values (1008, '红丝绒戚风裸蛋糕', 1002, false);
insert into goodscategory
values (1009, '渐变色奶油蛋糕', 1002, false);

insert into goodscategory
values (1010, '巧克力慕斯', 1003, false);
insert into goodscategory
values (1011, '芝士慕斯', 1003, false);

insert into goodscategory
values (1012, '水果类的', 1001, false);
select parent.categoryID, parent.categoryName, children.categoryName
from goodscategory as parent
         inner join goodscategory children on parent.categoryID = children.parentID
order by categoryID;

select *
from goodscategory
order by isParent desc;

select *
from goodscategory
order by parentID;


drop table goods;
create table goods
(
    goodsID          int comment '商品ID' auto_increment primary key,
    goodsName        varchar(30) comment '商品名称'  not null,
    goodsPrice       double comment '单价'           not null,
    goodsCategory    varchar(50) comment '所属类别'  not null,
    goodsLogo        varchar(100) comment '商品图片' not null,
    goodsExist       boolean comment '商品是否上线',
    goodsDescription varchar(100) comment '商品描述',
#     goodssize double comment '商品大小',
    goodssale        int comment '商品销售情况'
);


insert into goods(goodsName, goodsPrice, goodsCategory, goodsLogo, goodsExist, goodsDescription, goodsSale)
values ('草莓蛋糕', 123.00, '草莓蛋糕', 'null', true, 'goodgood', 101),
       ('芒果蛋糕', 124.00, '芒果蛋糕', 'null', true, 'goodgood', 102),
       ('香蕉蛋糕', 125.00, '香蕉蛋糕', 'null', true, 'goodgood', 103),
       ('葡萄蛋糕', 126.00, '葡萄蛋糕', 'null', true, 'goodgood', 104),
       ('西瓜蛋糕', 127.00, '西瓜蛋糕', 'null', true, 'goodgood', 105),
       ('慕斯蛋糕', 128.00, '慕斯蛋糕', 'null', true, 'goodgood', 106),
       ('葡萄2蛋糕', 126.00, '草莓蛋糕,葡萄蛋糕', 'null', true, 'goodgood', 104),
       ('西瓜2蛋糕', 127.00, '草莓蛋糕,西瓜蛋糕', 'null', true, 'goodgood', 105),
       ('慕斯2蛋糕', 128.00, '草莓蛋糕,慕斯蛋糕', 'null', true, 'goodgood', 106);


drop table cart;
create table cart
(
    telephone  varchar(11) comment '用户电话号码',
    goodsID    int comment '商品ID' ,
    goodsNum int comment '商品数量' ,
    goodsPriceSum double comment '商品价格'
#     foreign key (telephone) references user (telephone),
#     foreign key (goodsID) references goods (goodsID)
);

insert into cart (telephone, goodsID, goodsNum, goodsPriceSum)
values (13049964833, 15, 2, 53.6),
       (13049964833, 14, 1, 26.8),
       (13049964833, 12, 1, 18.8),
       (13049964833, 19, 2, 53.6);

drop table `order`;
create table `order`
(
    orderID       int comment '订单编号' auto_increment primary key,
    orderTelephone varchar(11) comment '电话号码',
    orderPrice    double comment '订单价格'      not null,
    orderStatus   varchar(20) comment '订单状态' not null,
    orderContents varchar(100) comment '内容'    not null,
    orderTime     timestamp comment '下单时间',
    orderAddress  varchar(50) comment '发货地址',
    foreign key (orderID) references statistics (orderID)
);
alter table `order`
    auto_increment = 1000;


drop table statistics;
create table statistics
(
    id         int comment '统计编号' auto_increment primary key,
    orderID    int comment '订单编号',
    goodsID    int comment '商品ID',
    goodsNum double comment '商品数量' not null,
    buyTime    timestamp comment '购买时间'

);

select sum(`order`.orderPrice)  as dayMoney from `order` where orderTime like concat(DATE_FORMAT(NOW(), '%Y-%m-%d'),'%');

select ROUND(sum(`order`.orderPrice) , 4)  as monthMoney from `order` where orderTime like concat(DATE_FORMAT(NOW(), '%Y-%m'),'%')
