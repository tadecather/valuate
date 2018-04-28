create or replace procedure rzqs(rq date) is

begin
--------------------------------------------------------导入证券基本信息

/*--将tjk_sh数据录入证券信息表
  --删除证券信息表记录
  delete from tzqxx;
  
  insert into tzqxx 
    select a.tjk_shzqxx_zqdm,'上海',a.tjk_shzqxx_zqlb,a.tjk_shzqxx_zqmc,a.tjk_shzqxx_zgb,a.tjk_shzqxx_mgmz,a.tjk_shzqxx_fxrq,'','','','',''
    from tjk_shzqxx a where a.d_ywrq=rq;
  --将tjk_cashsecurity数据录入证券信息表
  insert into tzqxx
    select a.tjk_szzqxx_zqdm,'深圳',a.tjk_szzqxx_zqlb,a.tjk_szzqxx_zqmc,a.tjk_szzqxx_zgb,a.tjk_szzqxx_mgmz,a.tjk_szzqxx_fxrq,'','','','',''
    from tjk_szzqxx a where a.d_ywrq=rq;*/

--------------------------------------------------------导入当日行情数据
--删除行情表当天记录
delete from thq a where a.thq_hqrq=rq;
--将tjk_mktdt00数据录入行情表
insert into thq 
  select a.d_ywrq,a.tjk_mktdt00_zqdm,a.tjk_mktdt00_closepx,b.tzqxx_zqmc
  from tjk_mktdt00 a,tzqxx b
  where a.d_ywrq=rq and a.tjk_mktdt00_zqdm=b.tzqxx_zqdm and b.tzqxx_jysc='上海'
      and (b.tzqxx_zqlb='股票' or b.tzqxx_zqlb='债券' or b.tzqxx_zqlb='回购');
--将tjk_cashsecurity数据录入行情表
insert into thq
  select a.d_ywrq,a.tjk_cashsecurity_zqdm,a.tjk_cashsecurity_closepx,b.tzqxx_zqmc
  from tjk_cashsecurity a ,tzqxx b
  where a.d_ywrq=rq and a.tjk_cashsecurity_zqdm=b.tzqxx_zqdm and b.tzqxx_jysc='深圳' 
     and (b.tzqxx_zqlb='股票' or b.tzqxx_zqlb='债券' or b.tzqxx_zqlb='回购');
  
------------------------------------------------------------------债券交易、兑息业务
--删除当日的债券交易表数据
  delete from tzqjy a where a.tzqjy_ywrq=rq;
   --插入上海当天债券交易流水                    
   insert into tzqjy
     select a.tjk_gh_zqdm,b.tzqxx_zqmc,rq,a.tjk_gh_jyfx,b.tzqxx_jysc,
          round(sum(a.tjk_gh_cjje)/sum(a.tjk_gh_cjsl*10),2),
          sum(a.tjk_gh_cjje),sum(a.tjk_gh_cjsl*10),
          sum(round(a.tjk_gh_cjje*c.tjyfl_jsf,2)),
          sum(round(a.tjk_gh_cjje*c.tjyfl_yhs,2)),
          sum(round(a.tjk_gh_cjje*c.tjyfl_ghf,2)),
          sum(round(a.tjk_gh_cjje*c.tjyfl_zgf,2)),
          sum(round(a.tjk_gh_cjje*c.tjyfl_yj,2)),
          sum(round(b.tzqxx_nll*(rq-b.tzqxx_qxr)/365*a.tjk_gh_cjsl*10,2)),
          sum(round(b.tzqxx_nll*(rq-b.tzqxx_qxr)/365*(1-b.tzqxx_lxs)*a.tjk_gh_cjsl*10,2)),
          sum(round(b.tzqxx_nll*(rq-b.tzqxx_qxr)/365*a.tjk_gh_cjsl*10,2))-
          sum(round(b.tzqxx_nll*(rq-b.tzqxx_qxr)/365*(1-b.tzqxx_lxs)*a.tjk_gh_cjsl*10,2)),
          a.d_ywrq
     from tjk_gh a,tzqxx b,tjyfl c 
     where b.tzqxx_zqlb = '债券' and (a.tjk_gh_zqdm like '01%' or a.tjk_gh_zqdm like '12%' or a.tjk_gh_zqdm like '13%')
           and a.tjk_gh_zqdm = b.tzqxx_zqdm and c.tjyfl_ywlb = '债券' and b.tzqxx_jysc = c.tjyfl_jysc and a.d_ywrq = rq
     GROUP BY a.tjk_gh_zqdm,b.tzqxx_zqmc,a.tjk_gh_jyfx,b.tzqxx_jysc,a.d_ywrq;
   --插入深圳当天债券交易流水                    
   insert into tzqjy
    select a.tjk_sjsmx1_zqdm,b.tzqxx_zqmc,rq,a.tjk_sjsmx1_jyfx,b.tzqxx_jysc,
          sum(a.tjk_sjsmx1_cjje)/abs(sum(a.tjk_sjsmx1_cjsl)),
          abs(sum(a.tjk_sjsmx1_cjsl*a.tjk_sjsmx1_cjjg)),
          abs(sum(a.tjk_sjsmx1_cjsl)),
          sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_jsf,2)),
          sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_yhs,2)),
          sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_ghf,2)),
          sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_zgf,2)),
          sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_yj,2)),
          sum(round(b.tzqxx_nll*(rq-b.tzqxx_qxr)/365*abs(a.tjk_sjsmx1_cjsl),2)),
          sum(round(b.tzqxx_nll*(rq-b.tzqxx_qxr)/365*(1-b.tzqxx_lxs)*abs(a.tjk_sjsmx1_cjsl),2)),
          sum(round(b.tzqxx_nll*(rq-b.tzqxx_qxr)/365*abs(a.tjk_sjsmx1_cjsl),2))-sum(round(b.tzqxx_nll*(rq-b.tzqxx_qxr)/365*(1-b.tzqxx_lxs)*abs(a.tjk_sjsmx1_cjsl),2)),
          a.d_ywrq
    from tjk_sjsmx1 a,tzqxx b,tjyfl c 
    where b.tzqxx_zqlb = '债券' and a.tjk_sjsmx1_zqdm like '11%' 
    and a.tjk_sjsmx1_zqdm = b.tzqxx_zqdm and c.tjyfl_ywlb = '债券' and b.tzqxx_jysc = c.tjyfl_jysc and a.d_ywrq = rq 
    GROUP BY a.tjk_sjsmx1_zqdm,b.tzqxx_zqmc,a.tjk_sjsmx1_jyfx,b.tzqxx_jysc,a.d_ywrq;
  --插入当天债券兑息的流水
   insert into tzqjy 
     select b.tzqxx_zqdm,b.tzqxx_zqmc,rq,'兑息转出',b.tzqxx_jysc,0,0,0,0,0,0,0,0,round(b.tzqxx_nll*a.tzqjc_ljsl,2),a.tzqjc_ljlx,round(b.tzqxx_nll*a.tzqjc_ljsl*(b.tzqxx_lxs),2),rq
     from tzqjc a,tzqxx b 
     where a.tzqjc_zqdm=b.tzqxx_zqdm and add_months(b.tzqxx_qxr,12)=rq 
     and a.tzqjc_jyrq=rq-1 and a.tzqjc_ywlb='债券' and b.tzqxx_zqlb='债券';
   insert into tzqjy 
     select b.tzqxx_zqdm,b.tzqxx_zqmc,rq+1,'兑息到账',b.tzqxx_jysc,0,0,0,0,0,0,0,0,round(b.tzqxx_nll*a.tzqjc_ljsl,2),a.tzqjc_ljlx,round(b.tzqxx_nll*a.tzqjc_ljsl*(b.tzqxx_lxs),2),rq
     from tzqjc a,tzqxx b 
     where a.tzqjc_zqdm=b.tzqxx_zqdm and add_months(b.tzqxx_qxr,12)=rq 
     and a.tzqjc_jyrq=rq-1 and a.tzqjc_ywlb='债券' and b.tzqxx_zqlb='债券';

------------------------------------------------------------------股票交易业务
--删除当天股票交易流水
   delete from tgpjy a where a.tgpjy_jyrq = rq;
   --插入上海当天股票交易流水
   insert into tgpjy
    select a.tjk_gh_zqdm,b.tzqxx_zqmc,rq,a.tjk_gh_jyfx,b.tzqxx_jysc,
          sum(a.tjk_gh_cjje)/abs(sum(a.tjk_gh_cjsl)),
          sum(a.tjk_gh_cjje),
          sum(a.tjk_gh_cjsl),
          sum(round(a.tjk_gh_cjje*c.tjyfl_jsf,2)),
          decode(a.tjk_gh_jyfx,'买入',0,sum(round(a.tjk_gh_cjje*c.tjyfl_yhs,2))),--利用decode判断
          sum(round(a.tjk_gh_cjje*c.tjyfl_ghf,2)),
          sum(round(a.tjk_gh_cjje*c.tjyfl_zgf,2)),
          sum(round(a.tjk_gh_cjje*c.tjyfl_yj,2))
    from tjk_gh a,tzqxx b,tjyfl c 
    where b.tzqxx_zqlb = '股票' and a.tjk_gh_zqdm like '60%' and a.tjk_gh_zqdm = b.tzqxx_zqdm
          and b.tzqxx_jysc = c.tjyfl_jysc and c.tjyfl_ywlb = '股票' and a.d_ywrq = rq
    GROUP BY a.tjk_gh_zqdm,b.tzqxx_zqmc,a.tjk_gh_jyfx,b.tzqxx_jysc;
   --插入深圳当天股票交易流水
   insert into tgpjy
    select a.tjk_sjsmx1_zqdm,b.tzqxx_zqmc,rq,a.tjk_sjsmx1_jyfx,b.tzqxx_jysc,
          sum(a.tjk_sjsmx1_cjje)/sum(a.tjk_sjsmx1_cjsl),
          sum(a.tjk_sjsmx1_cjje),
          decode(a.tjk_sjsmx1_jyfx,'买入',sum(a.tjk_sjsmx1_cjsl),-sum(a.tjk_sjsmx1_cjsl)),
          /*sum(a.tjk_sjsmx1_cjsl),*/
          sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_jsf,2)),
          decode(a.tjk_sjsmx1_jyfx,'买入',0,sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_yhs,2))),--利用decode判断
          /*sum(round(a.tjk_gh_cjje*c.tjyfl_yhs,2)),*/
          sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_ghf,2)),
          sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_zgf,2)),
          sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_yj,2))
    from tjk_sjsmx1 a,tzqxx b,tjyfl c 
    where b.tzqxx_zqlb = '股票' and (a.tjk_sjsmx1_zqdm like '00%' or a.tjk_sjsmx1_zqdm like '30%') 
          and a.tjk_sjsmx1_zqdm = b.tzqxx_zqdm and b.tzqxx_jysc = c.tjyfl_jysc 
          and c.tjyfl_ywlb = '股票' and a.d_ywrq = rq
    GROUP BY a.tjk_sjsmx1_zqdm,b.tzqxx_zqmc,a.tjk_sjsmx1_jyfx,b.tzqxx_jysc;
          
--------------------------------------------------------------------回购交易业务
--删除当天回购交易流水    
   delete from thgjy a where a.thgjy_cjrq = rq;
   --插入上海当天回购交易流水                   ****修改增加费用到成交金额中
   insert into thgjy
     select a.tjk_gh_zqdm,b.tzqxx_zqmc,
               decode(b.tzqxx_hgts,null,1,b.tzqxx_hgts),rq,
               (rq+decode(b.tzqxx_hgts,null,1,b.tzqxx_hgts)),
               decode(a.tjk_gh_jyfx,'买入','融资','融券'),
               /*a.tjk_gh_jyfx,*/
               b.tzqxx_jysc,
               sum(a.tjk_gh_cjje)+
               sum(round(a.tjk_gh_cjje*c.tjyfl_jsf,2))+
               sum(round(a.tjk_gh_cjje*c.tjyfl_ghf,2))+
               sum(round(a.tjk_gh_cjje*c.tjyfl_zgf,2))+
               sum(round(a.tjk_gh_cjje*c.tjyfl_yj,2))+
               decode(a.tjk_gh_jyfx,'买入',0，sum(round(a.tjk_gh_cjje*c.tjyfl_yhs,2))),
               sum(round((100+a.tjk_gh_cjjg*decode(b.tzqxx_hgts,null,1,b.tzqxx_hgts)/360)*a.tjk_gh_cjsl*10,2))
     from tjk_gh a,tzqxx b,tjyfl c
     where b.tzqxx_zqlb='回购' and a.tjk_gh_zqdm like '204%'   
           and a.tjk_gh_zqdm=b.tzqxx_zqdm and b.tzqxx_jysc=c.tjyfl_jysc
           and c.tjyfl_ywlb='回购' and a.d_ywrq=rq
     GROUP BY a.tjk_gh_zqdm,b.tzqxx_zqmc,b.tzqxx_hgts,rq+b.tzqxx_hgts,
               a.tjk_gh_jyfx,b.tzqxx_jysc; 
   --插入深圳当天回购交易流水                   
   insert into thgjy
     select a.tjk_sjsmx1_zqdm,b.tzqxx_zqmc,
               decode(b.tzqxx_hgts,null,1,b.tzqxx_hgts),rq,
               (rq+decode(b.tzqxx_hgts,null,1,b.tzqxx_hgts)),
               decode(a.tjk_sjsmx1_jyfx,'买入','融券','融资'),
               /*a.tjk_sjsmx1_jyfx,*/
               b.tzqxx_jysc,
               sum(a.tjk_sjsmx1_cjje)+
               sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_jsf,2))+
               sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_ghf,2))+
               sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_zgf,2))+
               sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_yj,2))+
               decode(a.tjk_sjsmx1_jyfx,'买入',0，sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_yhs,2))),
               sum(round((100+a.tjk_sjsmx1_cjjg*decode(b.tzqxx_hgts,null,1,b.tzqxx_hgts)/365)*abs(a.tjk_sjsmx1_cjsl),2))
     from tjk_sjsmx1 a,tzqxx b,tjyfl c
     where b.tzqxx_zqlb='回购' and a.tjk_sjsmx1_zqdm like '131%'   
           and a.tjk_sjsmx1_zqdm=b.tzqxx_zqdm and b.tzqxx_jysc=c.tjyfl_jysc
           and c.tjyfl_ywlb='回购' and a.d_ywrq=rq
     GROUP BY a.tjk_sjsmx1_zqdm,b.tzqxx_zqmc,b.tzqxx_hgts,rq+b.tzqxx_hgts,
              a.tjk_sjsmx1_jyfx,b.tzqxx_jysc; 
 
---------------------------------------------------------股票新股业务
 --删除当日新股表的数据
 delete from txg where txg.txg_jyrq=rq;
 --上交所新股中签
 insert into txg
   select a.tjk_jsmx_zqdm,b.tzqxx_jysc,'新股中签',a.tjk_jsmx_cjjg,-sum(a.tjk_jsmx_cjje),
     sum(a.tjk_jsmx_cjsl),a.d_ywrq,b.tzqxx_zqmc,a.d_ywrq
   from tjk_jsmx a,tzqxx b 
   where a.tjk_jsmx_jllx='002' and a.tjk_jsmx_zqlb='PT'
     and a.tjk_jsmx_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq
   GROUP BY a.tjk_jsmx_zqdm,b.tzqxx_jysc,a.tjk_jsmx_cjjg,a.d_ywrq,b.tzqxx_zqmc,a.d_ywrq;
 --上交所新股缴款
 insert into txg
   select a.tjk_jsmx_zqdm,b.tzqxx_jysc,'新股缴款',a.tjk_jsmx_cjjg,-sum(a.tjk_jsmx_cjje),
     sum(a.tjk_jsmx_cjsl),a.d_ywrq+1,b.tzqxx_zqmc,a.d_ywrq
   from tjk_jsmx a,tzqxx b 
   where a.tjk_jsmx_jllx='002' and a.tjk_jsmx_zqlb='PT'
     and a.tjk_jsmx_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq
   GROUP BY a.tjk_jsmx_zqdm,b.tzqxx_jysc,a.tjk_jsmx_cjjg,a.d_ywrq+1,b.tzqxx_zqmc,a.d_ywrq;
 --上交所新股交收
 insert into txg
   select a.tjk_jsmx_zqdm,b.tzqxx_jysc,'新股交收',a.tjk_jsmx_cjjg,-sum(a.tjk_jsmx_cjje),
     sum(a.tjk_jsmx_cjsl),a.d_ywrq,b.tzqxx_zqmc,a.d_ywrq
   from tjk_jsmx a,tzqxx b 
   where a.tjk_jsmx_jllx='003' and a.tjk_jsmx_zqlb='PT'
     and a.tjk_jsmx_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq
   GROUP BY a.tjk_jsmx_zqdm,b.tzqxx_jysc,a.tjk_jsmx_cjjg,a.d_ywrq,b.tzqxx_zqmc,a.d_ywrq;
 --上交所新股上市流通
 insert into txg
   select a.tjk_zqbd_zqdm,b.tzqxx_jysc,'新股流通',0,0,sum(a.tjk_zqbd_bdsl),a.d_ywrq,b.tzqxx_zqmc,a.d_ywrq
   from tjk_zqbd a,tzqxx b 
   where a.tjk_zqbd_zqlb='PT' and a.tjk_zqbd_qylb is null and a.tjk_zqbd_bdsl>0
     and a.tjk_zqbd_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq
   GROUP BY a.tjk_zqbd_zqdm,b.tzqxx_jysc,a.d_ywrq,b.tzqxx_zqmc,a.d_ywrq;
 --深交所新股中签
 insert into txg
   select a.tjk_sjsfx_zqdm,b.tzqxx_jysc,'新股中签',a.tjk_sjsfx_zjje,
     sum(a.tjk_sjsfx_zjje*a.tjk_sjsfx_qrgs),sum(a.tjk_sjsfx_qrgs),a.tjk_sjsfx_fsrq,b.tzqxx_zqmc,a.d_ywrq
   from tjk_sjsfx a,tzqxx b 
   where a.tjk_sjsfx_fxywlb='A3'
     and a.tjk_sjsfx_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq
   group by a.tjk_sjsfx_zqdm,b.tzqxx_jysc,a.tjk_sjsfx_zjje,
            a.tjk_sjsfx_fsrq,b.tzqxx_zqmc,a.d_ywrq;
 --深交所新股缴款
 insert into txg
   select a.tjk_sjsfx_zqdm,b.tzqxx_jysc,'新股缴款',a.tjk_sjsfx_zjje,
     sum(a.tjk_sjsfx_zjje*a.tjk_sjsfx_qrgs),sum(a.tjk_sjsfx_qrgs),a.tjk_sjsfx_fsrq+1,b.tzqxx_zqmc,a.d_ywrq
   from tjk_sjsfx a,tzqxx b 
   where a.tjk_sjsfx_fxywlb='A3'
     and a.tjk_sjsfx_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq
   group by a.tjk_sjsfx_zqdm,b.tzqxx_jysc,a.tjk_sjsfx_zjje,
            a.tjk_sjsfx_fsrq+1,b.tzqxx_zqmc,a.d_ywrq;
 --深交所新股交收
 insert into txg
   select a.tjk_sjsfx_zqdm,b.tzqxx_jysc,'新股交收',a.tjk_sjsfx_zjje,
     sum(a.tjk_sjsfx_zjje*a.tjk_sjsfx_qrgs),sum(a.tjk_sjsfx_qrgs),a.tjk_sjsfx_fsrq,b.tzqxx_zqmc,a.d_ywrq
   from tjk_sjsfx a,tzqxx b 
   where a.tjk_sjsfx_fxywlb='A5'
     and a.tjk_sjsfx_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq
   group by a.tjk_sjsfx_zqdm,b.tzqxx_jysc,a.tjk_sjsfx_zjje,
            a.tjk_sjsfx_fsrq,b.tzqxx_zqmc,a.d_ywrq;
 --深交所新股上市流通
 insert into txg
   select a.tjk_sjsjg_zqdm,b.tzqxx_jysc,'新股流通',0,0,sum(a.tjk_sjsjg_cjsl),
     a.tjk_sjsjg_cjrq,b.tzqxx_zqmc,a.d_ywrq
   from tjk_sjsjg a,tzqxx b 
   where a.tjk_sjsjg_jgywlb='TGXG'
     and a.tjk_sjsjg_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq
   group by a.tjk_sjsjg_zqdm,b.tzqxx_jysc,a.tjk_sjsjg_cjrq,b.tzqxx_zqmc,a.d_ywrq;   
       
---------------------------------------------------------股票分红业务
  --删除当日的红利表数据
  delete from thl where thl.thl_ywrq=rq;
  --上交所红利除权
  insert into thl
  select a.d_ywrq,a.tjk_zqbd_bdrq,'红利除权','上海',a.tjk_zqbd_zqdm,b.tzqxx_zqmc,a.tjk_zqbd_bdsl,0,0 
  from tjk_zqbd a,tzqxx b 
  where a.tjk_zqbd_zqlb='PT' and a.tjk_zqbd_qylb='HL' and a.tjk_zqbd_bdsl>0 
    and a.tjk_zqbd_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq;
  --深交所红利除权
  insert into thl
  select a.d_ywrq,a.tjk_sjsjg_cjrq,'红利除权','深圳',a.tjk_sjsjg_zqdm,b.tzqxx_zqmc,'',a.tjk_sjsjg_zjje,''
  from tjk_sjsjg a,tzqxx b 
  where a.tjk_sjsjg_jgywlb='QPPX' and a.tjk_sjsjg_zjje<>0
    and a.tjk_sjsjg_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq;
  --上交所红利到账  
  insert into thl
  select a.d_ywrq,a.d_ywrq+1,'红利到账','上海',a.tjk_jsmx_zqdm,b.tzqxx_zqmc,c.thl_djsl,a.tjk_jsmx_cjje,a.tjk_jsmx_cjje/c.thl_djsl
  from tjk_jsmx a,tzqxx b,thl c 
  where a.tjk_jsmx_jllx='001' and a.tjk_jsmx_zqlb='PT'
    and a.tjk_jsmx_zqdm=c.thl_zqdm and c.thl_ywlb='红利除权' and c.thl_jysc='上海'
    and a.tjk_jsmx_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq and c.thl_ywrq=rq;
  /*update thl c set c.thl_fhje=
  from tjk_jsmx a,tzqxx b 
  where a.tjk_jsmx_jllx='001' and a.tjk_jsmx_zqlb='PT'
    and a.tjk_jsmx_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq 
    and c.thl_ywlb='红利除权' and c.thl_jysc='上海' and c.thl_zqdm=a.tjk_jsmx_zqdm;*/
    
  --深交所红利到账
  insert into thl
  select a.d_ywrq,a.tjk_sjsjg_cjrq+1,'红利到账','深圳',a.tjk_sjsjg_zqdm,b.tzqxx_zqmc,0,a.tjk_sjsjg_zjje,0
  from tjk_sjsjg a,tzqxx b 
  where a.tjk_sjsjg_jgywlb='QPPX' and a.tjk_sjsjg_zjje<>0
    and a.tjk_sjsjg_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq;
  --上交所送股到账
  insert into thl
  select a.d_ywrq,a.tjk_zqbd_bdrq+1,'红股到账','上海',a.tjk_zqbd_zqdm,b.tzqxx_zqmc,a.tjk_zqbd_bdsl,0,0 
  from tjk_zqbd a,tzqxx b 
  where a.tjk_zqbd_zqlb='PT' and a.tjk_zqbd_qylb='S'
    and a.tjk_zqbd_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq;
  --深交所送股到账
  insert into thl
  select a.d_ywrq,a.tjk_sjsjg_cjrq+1,'红股到账','深圳',a.tjk_sjsjg_zqdm,b.tzqxx_zqmc,a.tjk_sjsjg_cjsl,0,0
  from tjk_sjsjg a,tzqxx b 
  where a.tjk_sjsjg_jgywlb='QPPX' and a.tjk_sjsjg_cjsl<>0
    and a.tjk_sjsjg_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq;

commit;
end rzqs;
/
