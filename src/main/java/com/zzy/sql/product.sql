alter table d_order_pro
   drop constraint FK_D_ORDER__REFERENCE_D_PRODUC;

alter table d_product
   drop constraint FK_D_PRODUC_REFERENCE_D_CATALO;

drop table d_product cascade constraints;

select * from d_product


/*==============================================================*/
/* Table: d_product                                             */
/*==============================================================*/
create table d_product  (
   id                   varchar2(40)                    not null,--id  主键
   pro_name             varchar2(40),--书名		不同	
   classes              varchar2(40),--丛书名		都是上课头疼的故事
   author               varchar2(40),--作者		随便写
   press                varchar2(40),--出版社
   publication_date     date,		 --出版时间     系统时间
   Edition              number(4),   --版次   		1
   printing_time        date,		 --印刷时间	系统时间
   Impression           number(4),   --印次		1
   ISBN                 varchar2(40),--ISBN 	12345678
   words                number(8),   --字数    		10000
   pages                number(3),   --页数    		100
   Format               varchar2(40),--开本   	    16开
   paper                varchar2(40),--纸张   		胶版纸
   packaging            varchar2(40),--包装		平装
   price                number(5,2), --定价		统一设置为200
   dangdang_price       number(5,2), --当当价		统一设置为180
   recommanded          varchar2(40),--编辑推荐	自身
   content_brief        varchar2(40),--内容简介	自身
   author_brief         varchar2(40),--作者简介	自身
   catalog              varchar2(40),--目录		自身
   comments             varchar2(40),--媒体评论	自身
   part_images          varchar2(40),--书摘插图           自身
   src                  varchar2(40),--图片路径	不同
   online_date          date,		 --上线时间	系统时间
   sold_amount          number(4),	 --卖的数量	统一为100
   cid                  varchar2(40),--分类id
   constraint PK_D_PRODUCT primary key (id)
);






alter table d_product
   add constraint FK_D_PRODUC_REFERENCE_D_CATALO foreign key (cid)
      references d_catalog (id);
      
insert into d_product values(
	'1',
	'一个陌生女人的来信',
	'上课头疼的故事',
	'我写的',
	'地球出版社',
	sysdate,
	1,
	sysdate,
	1,
	'12345678',
	10000,
	100,
	'16开',
	'胶版纸',
	'平装',
	200.0,
	180.0,
	'编辑推荐',
	'内容简介',
	'作者简介',
	'目录',
	'媒体评论',
	'书摘插图',
	'16.jpg',
	sysdate,
	100,
	'4'
);     
insert into d_product values(
	'2',
	'鲁宾逊漂流记',
	'上课头疼的故事',
	'我写的',
	'地球出版社',
	sysdate,
	1,
	sysdate,
	1,
	'12345678',
	10000,
	100,
	'16开',
	'胶版纸',
	'平装',
	200.0,
	180.0,
	'编辑推荐',
	'内容简介',
	'作者简介',
	'目录',
	'媒体评论',
	'书摘插图',
	'17.jpg',
	sysdate,
	100,
	'4'
);     
insert into d_product values(
	'3',
	'老子说',
	'上课头疼的故事',
	'我写的',
	'地球出版社',
	sysdate,
	1,
	sysdate,
	1,
	'12345678',
	10000,
	100,
	'16开',
	'胶版纸',
	'平装',
	200.0,
	180.0,
	'编辑推荐',
	'内容简介',
	'作者简介',
	'目录',
	'媒体评论',
	'书摘插图',
	'18.jpg',
	sysdate,
	100,
	'4'
);     
insert into d_product values(
	'4',
	'达芬奇密码',
	'上课头疼的故事',
	'我写的',
	'地球出版社',
	sysdate,
	1,
	sysdate,
	1,
	'12345678',
	10000,
	100,
	'16开',
	'胶版纸',
	'平装',
	200.0,
	180.0,
	'编辑推荐',
	'内容简介',
	'作者简介',
	'目录',
	'媒体评论',
	'书摘插图',
	'19.jpg',
	sysdate,
	100,
	'4'
);     
insert into d_product values(
	'5',
	'淘气包马小跳',
	'上课头疼的故事',
	'我写的',
	'地球出版社',
	sysdate,
	1,
	sysdate,
	1,
	'12345678',
	10000,
	100,
	'16开',
	'胶版纸',
	'平装',
	200.0,
	180.0,
	'编辑推荐',
	'内容简介',
	'作者简介',
	'目录',
	'媒体评论',
	'书摘插图',
	'20.jpg',
	sysdate,
	100,
	'4'
);     
insert into d_product values(
	'6',
	'海水观赏鱼',
	'上课头疼的故事',
	'我写的',
	'地球出版社',
	sysdate,
	1,
	sysdate,
	1,
	'12345678',
	10000,
	100,
	'16开',
	'胶版纸',
	'平装',
	200.0,
	180.0,
	'编辑推荐',
	'内容简介',
	'作者简介',
	'目录',
	'媒体评论',
	'书摘插图',
	'3.jpg',
	sysdate,
	100,
	'5'
);     
insert into d_product values(
	'7',
	'小妇人',
	'上课头疼的故事',
	'我写的',
	'地球出版社',
	sysdate,
	1,
	sysdate,
	1,
	'12345678',
	10000,
	100,
	'16开',
	'胶版纸',
	'平装',
	200.0,
	180.0,
	'编辑推荐',
	'内容简介',
	'作者简介',
	'目录',
	'媒体评论',
	'书摘插图',
	'4.jpg',
	sysdate,
	100,
	'5'
);     
insert into d_product values(
	'8',
	'双螺旋',
	'上课头疼的故事',
	'我写的',
	'地球出版社',
	sysdate,
	1,
	sysdate,
	1,
	'12345678',
	10000,
	100,
	'16开',
	'胶版纸',
	'平装',
	200.0,
	180.0,
	'编辑推荐',
	'内容简介',
	'作者简介',
	'目录',
	'媒体评论',
	'书摘插图',
	'5.jpg',
	sysdate,
	100,
	'5'
);    
insert into d_product values(
	'9',
	'夏洛的网',
	'上课头疼的故事',
	'我写的',
	'地球出版社',
	sysdate,
	1,
	sysdate,
	1,
	'12345678',
	10000,
	100,
	'16开',
	'胶版纸',
	'平装',
	200.0,
	180.0,
	'编辑推荐',
	'内容简介',
	'作者简介',
	'目录',
	'媒体评论',
	'书摘插图',
	'21.jpg',
	sysdate,
	39,
	'4'
);    
insert into d_product values(
	'10',
	'servlet与jsp的核心编程',
	'上课头疼的故事',
	'我写的',
	'地球出版社',
	sysdate,
	1,
	sysdate,
	1,
	'12345678',
	10000,
	100,
	'16开',
	'胶版纸',
	'平装',
	200.0,
	180.0,
	'编辑推荐',
	'内容简介',
	'作者简介',
	'目录',
	'媒体评论',
	'书摘插图',
	'22.jpg',
	sysdate,
	75,
	'4'
);      
insert into d_product values(
	'11',
	'卢隐',
	'上课头疼的故事',
	'我写的',
	'地球出版社',
	sysdate,
	1,
	sysdate,
	1,
	'12345678',
	10000,
	100,
	'16开',
	'胶版纸',
	'平装',
	200.0,
	180.0,
	'编辑推荐',
	'内容简介',
	'作者简介',
	'目录',
	'媒体评论',
	'书摘插图',
	'23.jpg',
	sysdate,
	74,
	'4'
);      
insert into d_product values(
	'12',
	'野蛮人',
	'上课头疼的故事',
	'我写的',
	'地球出版社',
	sysdate,
	1,
	sysdate,
	1,
	'12345678',
	10000,
	100,
	'16开',
	'胶版纸',
	'平装',
	200.0,
	180.0,
	'编辑推荐',
	'内容简介',
	'作者简介',
	'目录',
	'媒体评论',
	'书摘插图',
	'24.jpg',
	sysdate,
	47,
	'4'
);      
insert into d_product values(
	'13',
	'童年在人间我的大学',
	'上课头疼的故事',
	'我写的',
	'地球出版社',
	sysdate,
	1,
	sysdate,
	1,
	'12345678',
	10000,
	100,
	'16开',
	'胶版纸',
	'平装',
	200.0,
	180.0,
	'编辑推荐',
	'内容简介',
	'作者简介',
	'目录',
	'媒体评论',
	'书摘插图',
	'2.jpg',
	sysdate,
	52,
	'4'
);      
insert into d_product values(
	'14',
	'简爱',
	'上课头疼的故事',
	'我写的',
	'地球出版社',
	sysdate,
	1,
	sysdate,
	1,
	'12345678',
	10000,
	100,
	'16开',
	'胶版纸',
	'平装',
	200.0,
	180.0,
	'编辑推荐',
	'内容简介',
	'作者简介',
	'目录',
	'媒体评论',
	'书摘插图',
	'6.jpg',
	sysdate,
	30,
	'5'
);      
insert into d_product values(
	'15',
	'Java',
	'上课头疼的故事',
	'我写的',
	'地球出版社',
	sysdate,
	1,
	sysdate,
	1,
	'12345678',
	10000,
	100,
	'16开',
	'胶版纸',
	'平装',
	200.0,
	180.0,
	'编辑推荐',
	'内容简介',
	'作者简介',
	'目录',
	'媒体评论',
	'书摘插图',
	'7.jpg',
	sysdate,
	23,
	'5'
);      
 commit;
      select * from d_product;

      	select id,pro_name,src,price,dangdang_price
		from (select id,pro_name,src,price,dangdang_price,rownum rn 
		from(select id,pro_name,src,price,dangdang_price from d_product order by sold_amount desc))
		where rn between 1 and 8
      
      select id,pro_name,src,price,dangdang_price
		from (select id,pro_name,src,price,dangdang_price,rownum rn 
		from(select id,pro_name,src,price,dangdang_price from d_product order by online_date desc))
		where rn between 1 and 8
 
 select id,pro_name,src,price,dangdang_price ,online_date,sold_amount
  from d_product order by sold_amount desc,online_date desc
  
  	select id,pro_name,src,price,dangdang_price
		from (select id,pro_name,src,price,dangdang_price,rownum rn 
		from(select id,pro_name,src,price,dangdang_price from d_product order by sold_amount desc,online_date desc))
		where rn between 1 and 8
		
		select count(*)
		from d_product p
		join d_catalog c
		on p.cid=c.id where c.id=4;