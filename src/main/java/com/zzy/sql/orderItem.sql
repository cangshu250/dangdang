alter table d_order_item
   drop constraint FK_D_ORDER__REFERENCE_D_ORDER;

alter table d_order_item
   drop constraint FK_D_ORDER__REFERENCE_D_PRODUC;

drop table d_order_item cascade constraints;

/*==============================================================*/
/* Table: d_order_item                                          */
/*==============================================================*/
create table d_order_item  (
   id                   varchar2(40)                    not null,
   amount               number(3),--数量
   item_price           number(6,2),--价格
   pro_id               varchar2(40),--商品id用来连接商品id
   order_number         number,--订单编号
   constraint PK_D_ORDER_ITEM primary key (id)
);

alter table d_order_item
   add constraint FK_D_ORDER__REFERENCE_D_ORDER foreign key (order_number)
      references d_order (order_number);

alter table d_order_item
   add constraint FK_D_ORDER__REFERENCE_D_PRODUC foreign key (pro_id)
      references d_product (id);

 
 insert into d_order_item values('1',3,100,'1',11111111111111111111111111111111);
 insert into d_order_item values('2',6,140,'2',11111111111111111111111111111111);
 insert into d_order_item values('3',2,888,'3',11111111111111111111111111111111);
 insert into d_order_item values('4',6,468,'5',22222222222222222222222222222222);
 insert into d_order_item values('5',2,78,'6',22222222222222222222222222222222);
 commit;
 
 select * from d_order_item;
 
 
 
 
 
 
 
 
 