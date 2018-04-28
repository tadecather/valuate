create or replace procedure recoveryData(rq date) is
begin
  delete from tjk_cashsecurity a where a.d_ywrq=rq; 
  delete from tjk_gh a where a.d_ywrq=rq;
  delete from tjk_mktdt00 a where a.d_ywrq=rq;
  delete from tjk_shzqxx a where a.d_ywrq=rq;
  delete from tjk_szzqxx a where a.d_ywrq=rq;
  delete from tjk_jsmx a where a.d_ywrq=rq;
  delete from tjk_sjsfx a where a.d_ywrq=rq;
  delete from tjk_sjsjg a where a.d_ywrq=rq;
  delete from tjk_zqbd a where a.d_ywrq=rq;
  delete from tjk_sjsmx1 a where a.d_ywrq=rq;
  
  commit;
end recoveryData;
/
