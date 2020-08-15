/*==============================================================*/
/* Table: d_user                                                */
/*==============================================================*/
alter table d_address
   drop constraint FK_D_ADDRES_REFERENCE_D_USER;

alter table d_order
   drop constraint FK_D_ORDER_REFERENCE_D_USER;

drop table d_user cascade constraints;


create table d_user  (
   id                   varchar2(40)                    not null,
   status               varchar2(1),
   email                varchar2(40),
   password             varchar2(40),
   nickname             varchar2(40),
   salt                 varchar2(40),
   constraint PK_D_USER primary key (id)
);
commit;
select * from d_user;

drop table d_user;

insert into d_user values(1,'y','mingming@qq.com','a9c4020fa0fc89c333afe8fa91228d28','xiaoming','aaaa')


















