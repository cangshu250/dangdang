alter table d_address
   drop constraint FK_D_ADDRES_REFERENCE_D_USER;

alter table d_order
   drop constraint FK_D_ORDER_REFERENCE_D_ADDRES;

drop table d_address cascade constraints;

/*==============================================================*/
/* Table: d_address                                             */
/*==============================================================*/
create table d_address  (
   id                   varchar2(40)                    not null,
   name                 varchar2(40),
   address              varchar2(40),
   zipcode              varchar2(40),
   telphone             varchar2(40),
   mobile               varchar2(40),
   user_id              varchar2(40),
   constraint PK_D_ADDRESS primary key (id)
);

alter table d_address
   add constraint FK_D_ADDRES_REFERENCE_D_USER foreign key (user_id)
      references d_user (id);
      
commit;
insert into d_address values('1','张三','北京','111000','123-1231231','12312312312','a55d2e64e2c64acab6dd877c4f4b61f1');
insert into d_address values('2','张四','广州','112200','123-1231231','12312312312','a55d2e64e2c64acab6dd877c4f4b61f1');
insert into d_address values('3','张五','郑州','113300','123-1231231','12312312312','a55d2e64e2c64acab6dd877c4f4b61f1');
insert into d_address values('4','李四','郑州','113300','000-1111111','66666666666','b8c440dac1684c8196d8875e43ac4b5a');
insert into d_address values('5','李五','广州','112200','000-1111111','66666666666','b8c440dac1684c8196d8875e43ac4b5a');
insert into d_address values('6','王五','广州','112200','000-1111111','66666666666','d1aa77ac9dd34013ae6eb3317ec096fe');



select * from d_address;



















