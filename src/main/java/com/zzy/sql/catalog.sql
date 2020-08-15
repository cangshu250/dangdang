alter table d_catalog
   drop constraint FK_D_CATALO_REFERENCE_D_CATALO;

alter table d_product
   drop constraint FK_D_PRODUC_REFERENCE_D_CATALO;

drop table d_catalog cascade constraints;

/*==============================================================*/
/* Table: d_catalog                                             */
/*==============================================================*/
create table d_catalog  (
   id                   varchar2(40)                    not null,
   classname            varchar2(40),
   pid                  varchar2(40),
   count                number(8),
   constraint PK_D_CATALOG primary key (id)
);

alter table d_catalog
   add constraint FK_D_CATALO_REFERENCE_D_CATALO foreign key (pid)
      references d_catalog (id);

insert into d_catalog (id,classname,count) values('1','小说',15);
insert into d_catalog (id,classname,count) values('2','青春',0);
insert into d_catalog (id,classname,count) values('3','人文社科',0);
insert into d_catalog values('4','当代小说','1',10);
insert into d_catalog values('5','近现代小说','1',5);
insert into d_catalog values('6','古典小说','1',0);
insert into d_catalog values('7','四大名著','1',0);
insert into d_catalog values('8','世界名著','1',0);
insert into d_catalog values('9','校园','2',0);
insert into d_catalog values('10','爱情/情感','2',0);
insert into d_catalog values('11','叛逆/成长','2',0);
insert into d_catalog values('12','玄幻','2',0);
insert into d_catalog values('13','原创','2',0);
insert into d_catalog values('14','政治','3',0);
insert into d_catalog values('15','经济','3',0);
insert into d_catalog values('16','法律','3',0);
insert into d_catalog values('17','哲学','3',0);
insert into d_catalog values('18','历史','3',0);

commit;

select c1.id id1,c1.classname cname1,c2.id id2,c2.classname cname2 
		from d_catalog c1 join d_catalog c2 
		on c1.id=c2.pid

select * from d_catalog

















