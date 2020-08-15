alter table d_order
   drop constraint FK_D_ORDER_REFERENCE_D_USER;

alter table d_order
   drop constraint FK_D_ORDER_REFERENCE_D_ADDRES;

alter table d_order_pro
   drop constraint FK_D_ORDER__REFERENCE_D_ORDER;

drop table d_order cascade constraints;

/*==============================================================*/
/* Table: d_order                                               */
/*==============================================================*/
create table d_order  (
   order_number         number                          not null,    --订单号
   total_price          number(6,2),--总价格
   user_id              varchar2(40),--用户id
   addr_id              varchar2(40),--地址id用来连接地址栏的
   constraint PK_D_ORDER primary key (order_number)
);




insert into d_order values(11111111111111111111111111111111,100,'a55d2e64e2c64acab6dd877c4f4b61f1','1');
insert into d_order values(22222222222222222222222222222222,400,'a55d2e64e2c64acab6dd877c4f4b61f1','2');
insert into d_order values(33333333333333333333333333333333,600,'a55d2e64e2c64acab6dd877c4f4b61f1','3');
insert into d_order values(44444444444444444444444444444444,460,'b8c440dac1684c8196d8875e43ac4b5a','4');
insert into d_order values(55555555555555555555555555555555,450,'b8c440dac1684c8196d8875e43ac4b5a','5');
commit;


select * from d_order;


















