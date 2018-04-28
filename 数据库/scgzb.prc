create or replace procedure scgzb(rq date) is
 jrspj thq.thq_jrspj%type;
 jlcount integer;
 ye tkjkmye.tkjkmye_ye%type;
 fse tkjkmye.tkjkmye_ye%type;
 ye2 tkjkmye.tkjkmye_ye%type;
 fse2 tkjkmye.tkjkmye_ye%type;
 zsz3 tkjkmye.tkjkmye_ye%type;
 zcb3 tkjkmye.tkjkmye_ye%type;
  cursor scmmgz(rq date)--股票估值增值
    IS select a.tzqjc_zqdm,a.tzqjc_zqmc,a.tzqjc_jysc,a.tzqjc_ljsl,a.tzqjc_ljcb,a.tzqjc_ljgz,b.thq_jrspj 
    from tzqjc a ,thq b where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='买卖' and b.thq_hqrq=rq and b.thq_zqdm=a.tzqjc_zqdm;
    dm1 tzqjc.tzqjc_zqdm%type;
    mc1 tzqjc.tzqjc_zqmc%type;
    sc1 tzqjc.tzqjc_jysc%type;
    ljsl1 tzqjc.tzqjc_ljsl%type;  
    ljcb1 tzqjc.tzqjc_ljcb%type;
    ljgz1 tzqjc.tzqjc_ljgz%type;
    jrspj1 thq.thq_jrspj%type;
  cursor sczqgz(rq date)--债券估值增值
    IS select a.tzqjc_zqdm,a.tzqjc_zqmc,a.tzqjc_jysc,a.tzqjc_ljsl,a.tzqjc_ljcb,a.tzqjc_ljgz,b.thq_jrspj 
    from tzqjc a ,thq b where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='债券' and b.thq_hqrq=rq and b.thq_zqdm=a.tzqjc_zqdm;
    dm2 tzqjc.tzqjc_zqdm%type;
    mc2 tzqjc.tzqjc_zqmc%type;
    sc2 tzqjc.tzqjc_jysc%type;
    ljsl2 tzqjc.tzqjc_ljsl%type;  
    ljcb2 tzqjc.tzqjc_ljcb%type;
    ljgz2 tzqjc.tzqjc_ljgz%type;
    jrspj2 thq.thq_jrspj%type;  
  cursor scgz(rq date)--生成估值表
    is select a.tkjkmye_kmdm,a.tkjkmye_kmmc,a.tkjkmye_ye 
       from tkjkmye a 
       where a.tkjkmye_ywrq=rq and 
       (a.tkjkmye_kmdm like '1%' or a.tkjkmye_kmdm like '2%' or a.tkjkmye_kmdm like '3%') and 
       (a.tkjkmye_kmdm not like'1102%' and a.tkjkmye_kmdm not like'1103%' and a.tkjkmye_kmdm not like'1204%');
    dm3 tkjkmye.tkjkmye_kmdm%type;
    mc3 tkjkmye.tkjkmye_kmmc%type;
    ye3 tkjkmye.tkjkmye_ye%type;
  cursor scxggz(rq date)--生成估值表里关于新股的数据
    IS select a.tzqjc_zqdm,a.tzqjc_zqmc,a.tzqjc_jysc,a.tzqjc_ljsl,a.tzqjc_ljcb,a.tzqjc_ljgz,b.thq_jrspj
    from tzqjc a,thq b where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='新股' and b.thq_hqrq=rq and b.thq_zqdm=a.tzqjc_zqdm;
    dm4 tzqjc.tzqjc_zqdm%type;
    mc4 tzqjc.tzqjc_zqmc%type;
    sc4 tzqjc.tzqjc_jysc%type;
    ljsl4 tzqjc.tzqjc_ljsl%type;  
    ljcb4 tzqjc.tzqjc_ljcb%type;
    ljgz4 tzqjc.tzqjc_ljgz%type;
    jrspj4 thq.thq_jrspj%type;
  cursor scyslx(rq date)--应收利息
    is select a.tzqjc_zqdm,a.tzqjc_zqmc,a.tzqjc_ljlx,a.tzqjc_jysc
    from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='债券';
    dm5 tzqjc.tzqjc_zqdm%type;
    mc5 tzqjc.tzqjc_zqmc%type;
    ljlx5 tzqjc.tzqjc_ljlx%type;
    sc5 tzqjc.tzqjc_jysc%type;
begin
  --生成估值表，除股票投资（1102）债券投资（1103）应收利息（1204）涉及的科目，其余全部从会计科目余额表中取
  --删除当日的估值表
  delete from tgz a where a.tgz_ywrq=rq;
  --生成2类科目的估值表
  open scgz(rq);
  fetch scgz into dm3,mc3,ye3;
  while scgz%found loop
    insert into tgz(tgz_ywrq,tgz_kmdm,tgz_kmmc,tgz_zcb,tgz_zsz) values(rq,dm3,mc3,ye3,ye3);
    fetch scgz into dm3,mc3,ye3;       
  end loop;
  close scgz; 
  ---------------------------------------------------------------------------------------股票投资
  --生成估值表中1102一级科目的记录
  select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='买卖';
  if jlcount>0 then
    insert into tgz select rq,'1102','股票投资',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) from tzqjc a 
      where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='买卖';
  end if;
  
  --生成估值表中1102的二、三级科目的记录
  --生成股票的二、三级科目记录
  select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='买卖' and a.tzqjc_jysc='上海';
  if jlcount>0 then
    insert into tgz select rq,'110201','股票投资-上交所A股',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='买卖' and a.tzqjc_jysc='上海';
    insert into tgz select rq,'11020101','股票投资-上交所A股-上交所A股成本',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='买卖' and a.tzqjc_jysc='上海';
    insert into tgz select rq,'11020199','股票投资-上交所A股-上交所A股估值增值','','',sum(a.tzqjc_ljgz),'','',sum(a.tzqjc_ljgz),'','' 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='买卖' and a.tzqjc_jysc='上海';
  end if;
  select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='买卖' and a.tzqjc_jysc='深圳';
  if jlcount>0 then
    insert into tgz select rq,'110231','股票投资-深交所A股',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='买卖' and a.tzqjc_jysc='深圳';
    insert into tgz select rq,'11023101','股票投资-深交所A股-深交所A股成本',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='买卖' and a.tzqjc_jysc='深圳';
    insert into tgz select rq,'11023199','股票投资-深交所A股-深交所A股估值增值','','',sum(a.tzqjc_ljgz),'','',sum(a.tzqjc_ljgz),'','' 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='买卖' and a.tzqjc_jysc='深圳';
  end if;
  --生成新股的二、三级科目记录
  select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='新股' and a.tzqjc_jysc='上海';
  if jlcount>0 then
    insert into tgz select rq,'110203','股票投资-上交所新股',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb),'','' 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='新股' and a.tzqjc_jysc='上海';
    insert into tgz select rq,'11020301','股票投资-上交所新股-上交所新股成本',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb),'',''
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='新股' and a.tzqjc_jysc='上海';
  end if;
  select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='新股' and a.tzqjc_jysc='深圳';
  if jlcount>0 then
    insert into tgz select rq,'110233','股票投资-深交所新股',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb),'','' 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='新股' and a.tzqjc_jysc='深圳';
    insert into tgz select rq,'11023301','股票投资-深交所新股-深交所新股成本',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb),'',''
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='新股' and a.tzqjc_jysc='深圳';
  end if;
  
  --生成股票成本四级科目
  open scmmgz(rq);
  fetch scmmgz into dm1,mc1,sc1,ljsl1,ljcb1,ljgz1,jrspj1;
  while scmmgz%found loop
    if sc1='上海' then
     insert into tgz values(rq,'11020101'||dm1,'股票投资-上交所A股-上交所A股成本-'||mc1,ljsl1,ljcb1/ljsl1,ljcb1,'',jrspj1,ljcb1+ljgz1,'',ljgz1);
    elsif sc1='深圳'then
     insert into tgz values(rq,'11023101'||dm1,'股票投资-深交所A股-深交所A股成本-'||mc1,ljsl1,ljcb1/ljsl1,ljcb1,'',jrspj1,ljcb1+ljgz1,'',ljgz1);      
    end if;
    fetch scmmgz into dm1,mc1,sc1,ljsl1,ljcb1,ljgz1,jrspj1;
  end loop;
  close scmmgz; 
  --生成新股成本四级科目
  open scxggz(rq);
  fetch scxggz into dm4,mc4,sc4,ljsl4,ljcb4,ljgz4,jrspj4;
  while scxggz%found loop
    if sc4='上海' then
     insert into tgz values(rq,'11020301'||dm4,'股票投资-上交所新股-上交所新股成本-'||mc4,ljsl4,ljcb4/ljsl4,ljcb4,'',jrspj4,ljcb4,'',ljgz4);
    elsif sc4='深圳'then
     insert into tgz values(rq,'11023301'||dm4,'股票投资-深交所新股-深交所新股成本-'||mc4,ljsl4,ljcb4/ljsl4,ljcb4,'',jrspj4,ljcb4,'',ljgz4);
    end if;
    fetch scxggz into dm4,mc4,sc4,ljsl4,ljcb4,ljgz4,jrspj4;
  end loop;
  close scxggz;
  
  ------------------------------------------------------------------------------------------债券投资
  --生成估值表中1103债券投资一级科目的记录
  select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='债券';
  if jlcount>0 then
    insert into tgz select rq,'1103','债券投资',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) 
      from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='债券';
  end if;
  --生成估值表中1103的二、三级科目的记录
  --生成债券投资的二、三级科目记录
  select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='债券' and a.tzqjc_jysc='上海';
  if jlcount>0 then
    insert into tgz select rq,'110311','债券投资-上交所债券',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='债券' and a.tzqjc_jysc='上海';
    insert into tgz select rq,'11031101','债券投资-上交所债券-上交所债券成本',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='债券' and a.tzqjc_jysc='上海';
    insert into tgz select rq,'11031199','债券投资-上交所债券-上交所债券估值增值','','',sum(a.tzqjc_ljgz),'','',sum(a.tzqjc_ljgz),'','' 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='债券' and a.tzqjc_jysc='上海';
  end if;
  select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='债券' and a.tzqjc_jysc='深圳';
  if jlcount>0 then
    insert into tgz select rq,'110333','债券投资-深交所债券',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='债券' and a.tzqjc_jysc='深圳';
    insert into tgz select rq,'11033301','债券投资-深交所债券-深交所债券成本',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='债券' and a.tzqjc_jysc='深圳';
    insert into tgz select rq,'11033399','债券投资-深交所债券-深交所债券估值增值','','',sum(a.tzqjc_ljgz),'','',sum(a.tzqjc_ljgz),'','' 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='债券' and a.tzqjc_jysc='深圳';
  end if;
  --生成债券投资四级科目
  open sczqgz(rq);
  fetch sczqgz into dm2,mc2,sc2,ljsl2,ljcb2,ljgz2,jrspj2;
  while sczqgz%found loop
    if sc2='上海' then
     insert into tgz values(rq,'11031101'||dm2,'债券投资-上交所债券-上交所债券成本-'||mc2,ljsl2,ljcb2/ljsl2,ljcb2,'',jrspj2,ljcb2+ljgz2,'',ljgz2);
    elsif sc2='深圳'then
     insert into tgz values(rq,'11033301'||dm2,'债券投资-深交所债券-深交所债券成本-'||mc2,ljsl2,ljcb2/ljsl2,ljcb2,'',jrspj2,ljcb2+ljgz2,'',ljgz2);      
    end if;
    fetch sczqgz into dm2,mc2,sc2,ljsl2,ljcb2,ljgz2,jrspj2;
  end loop;
  close sczqgz; 
  
  ------------------------------------------------------------------------------------------应收利息
  --生成估值表中1103债券投资一级科目的记录
  select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='债券';
  if jlcount>0 then
    insert into tgz select rq,'1204','应收利息','','',sum(a.tzqjc_ljlx),'','',sum(a.tzqjc_ljlx),'','' 
      from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='债券';
  end if;
  --生成估值表中1204的二、三级科目的记录
  --生成应收利息的二、三级科目记录
  select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='债券';
  if jlcount>0 then
    insert into tgz select rq,'120410','应收利息-应收债券利息','','',sum(a.tzqjc_ljlx),'','',sum(a.tzqjc_ljlx),'','' 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='债券';
    insert into tgz select rq,'12041011','应收利息-应收债券利息-应收上交所债券利息','','',sum(a.tzqjc_ljlx),'','',sum(a.tzqjc_ljlx),'','' 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='债券' and a.tzqjc_jysc='上海';
       insert into tgz select rq,'12041033','应收利息-应收债券利息-应收深交所债券利息','','',sum(a.tzqjc_ljlx),'','',sum(a.tzqjc_ljlx),'','' 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='债券' and a.tzqjc_jysc='深圳';
  end if;
  /*select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='债券' and a.tzqjc_jysc='深圳';
  if jlcount>0 then
    insert into tgz select rq,'110333','债券投资-深交所债券',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='债券' and a.tzqjc_jysc='深圳';
    insert into tgz select rq,'11033301','债券投资-深交所债券-深交所债券成本',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='债券' and a.tzqjc_jysc='深圳';
  end if;*/
  --生成应收利息四级科目
  open scyslx(rq);
  fetch scyslx into dm5,mc5,ljlx5,sc5;
  while scyslx%found loop
    if sc5='上海' then
     insert into tgz values(rq,'12041011'||dm5,'应收利息-应收债券利息-应收上交所债券利息-'||mc5,'','',ljlx5,'','',ljlx5,'','');
    elsif sc5='深圳'then
     insert into tgz values(rq,'12041033'||dm5,'应收利息-应收债券利息-应收深交所债券利息-'||mc5,'','',ljlx5,'','',ljlx5,'','');      
    end if;
    fetch scyslx into dm5,mc5,ljlx5,sc5;
  end loop;
  close scyslx;
  -----------------------------------------------------------------------------------------
  --生成资产类、负债类总计，以及资产总净值
  select sum(a.tgz_zcb),sum(a.tgz_zsz) into fse,ye 
    from tgz a where a.tgz_ywrq=rq and length(a.tgz_kmdm)=4 and a.tgz_kmdm like'1%';  
    insert into tgz(tgz_ywrq,tgz_kmmc,tgz_zcb,tgz_zsz)values(rq,'资产类总计',fse,ye);
    
  /*select count(*) into jlcount from tgz a where a.tgz_ywrq=rq and a.tgz_kmdm like '2%';  
    if jlcount>=0 then*/
      select sum(a.tgz_zcb),sum(a.tgz_zsz) into fse,ye 
        from tgz a where a.tgz_ywrq=rq and a.tgz_kmdm like '2%';
        insert into tgz(tgz_ywrq,tgz_kmmc,tgz_zcb,tgz_zsz)values(rq,'负债类总计',fse,ye);
    /*else
        insert into tgz(tgz_ywrq,tgz_kmmc,tgz_zcb,tgz_zsz)values(rq,'负债类总计',0,0);
    end if;*/
  select sum(a.tgz_zcb),sum(a.tgz_zsz) into fse,ye
    from tgz a where a.tgz_ywrq=rq and (a.tgz_kmdm='11020199' or a.tgz_kmdm='11023199' or a.tgz_kmdm='11031199');
    update tgz a set a.tgz_zcb=a.tgz_zcb+fse,a.tgz_zsz=a.tgz_zsz+ye where a.tgz_kmmc='资产类总计';
    
  select sum(a.tgz_zcb),sum(a.tgz_zsz) into fse,ye 
    from tgz a where a.tgz_ywrq=rq /*and length(a.tgz_kmdm)=4*/ and a.tgz_kmdm like'3%';  
      if fse>=0 then
        update tgz a set a.tgz_zcb=a.tgz_zcb+fse,a.tgz_zsz=a.tgz_zsz+ye where a.tgz_ywrq=rq and a.tgz_kmmc='资产类总计';
      else
        update tgz a set a.tgz_zcb=-a.tgz_zcb+fse,a.tgz_zsz=-a.tgz_zsz+ye where a.tgz_ywrq=rq and a.tgz_kmmc='负债类总计'; 
      end if;
  select a.tgz_zcb+b.tgz_zcb,a.tgz_zsz+b.tgz_zsz into fse,ye 
    from tgz a,tgz b where a.tgz_ywrq=rq and b.tgz_ywrq=rq and a.tgz_kmmc='资产类总计'and b.tgz_kmmc='负债类总计';
  
  select a.tgz_zcb,a.tgz_zsz into fse2,ye2 
    from tgz a where a.tgz_ywrq=rq-1 and a.tgz_kmmc='资产总净值';
    /*select sum(a.tgz_zcb),sum(a.tgz_zsz) into zcb3,zsz3
      from tgz a where a.tgz_ywrq=rq 
        and (a.tgz_kmdm='11020101' or a.tgz_kmdm='11023101' 
        or a.tgz_kmdm='11020301' or a.tgz_kmdm='11023301' 
        or a.tgz_kmdm='11031101' or a.tgz_kmdm='11033301') ;*/
    insert into tgz(tgz_ywrq,tgz_kmmc,tgz_zcb,tgz_zsz)values(rq,'资产总净值',fse+fse2,ye+ye2);
  /*select a.tgz_zcb,a.tgz_zsz into fse,ye 
    from tgz a where a.tgz_ywrq=rq-1 and a.tgz_kmmc='资产总净值';
    update tgz a set a.tgz_zcb=a.tgz_zcb+fse,a.tgz_zsz=a.tgz_zsz+ye where a.tgz_kmmc='资产总净值';*/
  --资产总净值算出来后，可以算出所有的成本占净值、市值占净值的百分比
  update tgz a set a.tgz_cbzjz=round(100*a.tgz_zcb/(fse+fse2),4),
                   a.tgz_szzjz=round(100*a.tgz_zsz/(ye+ye2),4) where a.tgz_ywrq=rq;
commit;
end scgzb;
/
