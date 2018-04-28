create or replace procedure sckjkmyeb(rq date) is
jlcount integer;
cursor sckmyeb(rq date)--取凭证明细表科目金额
    is select a.tpzmx_kmdm,a.tpzmx_kmmc,a.tpzmx_je,a.tpzmx_sl,a.tpzmx_jdfx
    from tpzmx a where a.tpzmx_pzrq=rq;
    dm1 tpzmx.tpzmx_kmdm%type; 
    mc1 tpzmx.tpzmx_kmmc%type;
    je1 tpzmx.tpzmx_je%type;
    sl1 tpzmx.tpzmx_sl%type;
    fx1 tpzmx.tpzmx_jdfx%type;
    
begin
  --生成会计科目余额表
  delete from tkjkmye a where a.tkjkmye_ywrq=rq;--先删除当日的会计科目余额表
  --将昨日会计科目余额表插入到今天的会计科目余额表中
  insert into tkjkmye 
  select rq,a.tkjkmye_kmdm,a.tkjkmye_kmmc,a.tkjkmye_jdfx,a.tkjkmye_jffsje,a.tkjkmye_dffsje,a.tkjkmye_ye
  from tkjkmye a where a.tkjkmye_ywrq=rq-1; 
  
 -- 生成会计科目余额表
  OPEN sckmyeb(rq);
  FETCH sckmyeb INTO dm1,mc1,je1,sl1,fx1;
  WHILE sckmyeb%FOUND LOOP
    if dm1 like '1%' or dm1 like '3%' or dm1 like '64%' or dm1 like '66%'then
      select count(*) into jlcount from tkjkmye a where a.tkjkmye_ywrq=rq and a.tkjkmye_kmdm=dm1 ;
      if jlcount=0 then 
         insert into tkjkmye values(rq,dm1,mc1,
                decode(fx1,'借','借','贷'),
                decode(fx1,'借',je1,0),
                decode(fx1,'借',0,je1),
                decode(fx1,'借',je1,-je1));
      elsif jlcount>0 then 
         if fx1='借' then
           update tkjkmye a set a.tkjkmye_jffsje=a.tkjkmye_jffsje+je1,a.tkjkmye_ye=a.tkjkmye_ye+je1 
           where a.tkjkmye_kmdm=dm1;
         elsif fx1='贷' then
           update tkjkmye a set a.tkjkmye_dffsje=a.tkjkmye_dffsje+je1,a.tkjkmye_ye=a.tkjkmye_ye-je1 
           where a.tkjkmye_kmdm=dm1;
         end if;
      end if;
    elsif dm1 like '2%' or dm1 like '4%' or dm1 like '60%' or dm1 like '61%'then
      select count(*) into jlcount from tkjkmye a where a.tkjkmye_ywrq=rq and a.tkjkmye_kmdm=dm1 ;
      if jlcount=0 then 
         insert into tkjkmye values(rq,dm1,mc1,'贷',0,je1,je1-0);
      else
         /*update tkjkmye a set a.tkjkmye_dffsje=a.tkjkmye_dffsje+je1,a.tkjkmye_ye=a.tkjkmye_ye+je1 
          where a.tkjkmye_kmdm=dm1;*/
          if fx1='借' then
           update tkjkmye a set a.tkjkmye_jffsje=a.tkjkmye_jffsje+je1,a.tkjkmye_ye=a.tkjkmye_ye-je1 
           where a.tkjkmye_kmdm=dm1;
         elsif fx1='贷' then
           update tkjkmye a set a.tkjkmye_dffsje=a.tkjkmye_dffsje+je1,a.tkjkmye_ye=a.tkjkmye_ye+je1 
           where a.tkjkmye_kmdm=dm1;
         end if;
      end if;
    end if;
      FETCH sckmyeb INTO dm1,mc1,je1,sl1,fx1;
  END LOOP;
  CLOSE sckmyeb;
  
--删除余额为0 的记录 
 delete from tkjkmye a where a.tkjkmye_ye=0;
 
 commit;
end sckjkmyeb;
/
