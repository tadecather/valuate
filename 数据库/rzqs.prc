create or replace procedure rzqs(rq date) is

begin
--------------------------------------------------------����֤ȯ������Ϣ

/*--��tjk_sh����¼��֤ȯ��Ϣ��
  --ɾ��֤ȯ��Ϣ���¼
  delete from tzqxx;
  
  insert into tzqxx 
    select a.tjk_shzqxx_zqdm,'�Ϻ�',a.tjk_shzqxx_zqlb,a.tjk_shzqxx_zqmc,a.tjk_shzqxx_zgb,a.tjk_shzqxx_mgmz,a.tjk_shzqxx_fxrq,'','','','',''
    from tjk_shzqxx a where a.d_ywrq=rq;
  --��tjk_cashsecurity����¼��֤ȯ��Ϣ��
  insert into tzqxx
    select a.tjk_szzqxx_zqdm,'����',a.tjk_szzqxx_zqlb,a.tjk_szzqxx_zqmc,a.tjk_szzqxx_zgb,a.tjk_szzqxx_mgmz,a.tjk_szzqxx_fxrq,'','','','',''
    from tjk_szzqxx a where a.d_ywrq=rq;*/

--------------------------------------------------------���뵱����������
--ɾ����������¼
delete from thq a where a.thq_hqrq=rq;
--��tjk_mktdt00����¼�������
insert into thq 
  select a.d_ywrq,a.tjk_mktdt00_zqdm,a.tjk_mktdt00_closepx,b.tzqxx_zqmc
  from tjk_mktdt00 a,tzqxx b
  where a.d_ywrq=rq and a.tjk_mktdt00_zqdm=b.tzqxx_zqdm and b.tzqxx_jysc='�Ϻ�'
      and (b.tzqxx_zqlb='��Ʊ' or b.tzqxx_zqlb='ծȯ' or b.tzqxx_zqlb='�ع�');
--��tjk_cashsecurity����¼�������
insert into thq
  select a.d_ywrq,a.tjk_cashsecurity_zqdm,a.tjk_cashsecurity_closepx,b.tzqxx_zqmc
  from tjk_cashsecurity a ,tzqxx b
  where a.d_ywrq=rq and a.tjk_cashsecurity_zqdm=b.tzqxx_zqdm and b.tzqxx_jysc='����' 
     and (b.tzqxx_zqlb='��Ʊ' or b.tzqxx_zqlb='ծȯ' or b.tzqxx_zqlb='�ع�');
  
------------------------------------------------------------------ծȯ���ס���Ϣҵ��
--ɾ�����յ�ծȯ���ױ�����
  delete from tzqjy a where a.tzqjy_ywrq=rq;
   --�����Ϻ�����ծȯ������ˮ                    
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
     where b.tzqxx_zqlb = 'ծȯ' and (a.tjk_gh_zqdm like '01%' or a.tjk_gh_zqdm like '12%' or a.tjk_gh_zqdm like '13%')
           and a.tjk_gh_zqdm = b.tzqxx_zqdm and c.tjyfl_ywlb = 'ծȯ' and b.tzqxx_jysc = c.tjyfl_jysc and a.d_ywrq = rq
     GROUP BY a.tjk_gh_zqdm,b.tzqxx_zqmc,a.tjk_gh_jyfx,b.tzqxx_jysc,a.d_ywrq;
   --�������ڵ���ծȯ������ˮ                    
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
    where b.tzqxx_zqlb = 'ծȯ' and a.tjk_sjsmx1_zqdm like '11%' 
    and a.tjk_sjsmx1_zqdm = b.tzqxx_zqdm and c.tjyfl_ywlb = 'ծȯ' and b.tzqxx_jysc = c.tjyfl_jysc and a.d_ywrq = rq 
    GROUP BY a.tjk_sjsmx1_zqdm,b.tzqxx_zqmc,a.tjk_sjsmx1_jyfx,b.tzqxx_jysc,a.d_ywrq;
  --���뵱��ծȯ��Ϣ����ˮ
   insert into tzqjy 
     select b.tzqxx_zqdm,b.tzqxx_zqmc,rq,'��Ϣת��',b.tzqxx_jysc,0,0,0,0,0,0,0,0,round(b.tzqxx_nll*a.tzqjc_ljsl,2),a.tzqjc_ljlx,round(b.tzqxx_nll*a.tzqjc_ljsl*(b.tzqxx_lxs),2),rq
     from tzqjc a,tzqxx b 
     where a.tzqjc_zqdm=b.tzqxx_zqdm and add_months(b.tzqxx_qxr,12)=rq 
     and a.tzqjc_jyrq=rq-1 and a.tzqjc_ywlb='ծȯ' and b.tzqxx_zqlb='ծȯ';
   insert into tzqjy 
     select b.tzqxx_zqdm,b.tzqxx_zqmc,rq+1,'��Ϣ����',b.tzqxx_jysc,0,0,0,0,0,0,0,0,round(b.tzqxx_nll*a.tzqjc_ljsl,2),a.tzqjc_ljlx,round(b.tzqxx_nll*a.tzqjc_ljsl*(b.tzqxx_lxs),2),rq
     from tzqjc a,tzqxx b 
     where a.tzqjc_zqdm=b.tzqxx_zqdm and add_months(b.tzqxx_qxr,12)=rq 
     and a.tzqjc_jyrq=rq-1 and a.tzqjc_ywlb='ծȯ' and b.tzqxx_zqlb='ծȯ';

------------------------------------------------------------------��Ʊ����ҵ��
--ɾ�������Ʊ������ˮ
   delete from tgpjy a where a.tgpjy_jyrq = rq;
   --�����Ϻ������Ʊ������ˮ
   insert into tgpjy
    select a.tjk_gh_zqdm,b.tzqxx_zqmc,rq,a.tjk_gh_jyfx,b.tzqxx_jysc,
          sum(a.tjk_gh_cjje)/abs(sum(a.tjk_gh_cjsl)),
          sum(a.tjk_gh_cjje),
          sum(a.tjk_gh_cjsl),
          sum(round(a.tjk_gh_cjje*c.tjyfl_jsf,2)),
          decode(a.tjk_gh_jyfx,'����',0,sum(round(a.tjk_gh_cjje*c.tjyfl_yhs,2))),--����decode�ж�
          sum(round(a.tjk_gh_cjje*c.tjyfl_ghf,2)),
          sum(round(a.tjk_gh_cjje*c.tjyfl_zgf,2)),
          sum(round(a.tjk_gh_cjje*c.tjyfl_yj,2))
    from tjk_gh a,tzqxx b,tjyfl c 
    where b.tzqxx_zqlb = '��Ʊ' and a.tjk_gh_zqdm like '60%' and a.tjk_gh_zqdm = b.tzqxx_zqdm
          and b.tzqxx_jysc = c.tjyfl_jysc and c.tjyfl_ywlb = '��Ʊ' and a.d_ywrq = rq
    GROUP BY a.tjk_gh_zqdm,b.tzqxx_zqmc,a.tjk_gh_jyfx,b.tzqxx_jysc;
   --�������ڵ����Ʊ������ˮ
   insert into tgpjy
    select a.tjk_sjsmx1_zqdm,b.tzqxx_zqmc,rq,a.tjk_sjsmx1_jyfx,b.tzqxx_jysc,
          sum(a.tjk_sjsmx1_cjje)/sum(a.tjk_sjsmx1_cjsl),
          sum(a.tjk_sjsmx1_cjje),
          decode(a.tjk_sjsmx1_jyfx,'����',sum(a.tjk_sjsmx1_cjsl),-sum(a.tjk_sjsmx1_cjsl)),
          /*sum(a.tjk_sjsmx1_cjsl),*/
          sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_jsf,2)),
          decode(a.tjk_sjsmx1_jyfx,'����',0,sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_yhs,2))),--����decode�ж�
          /*sum(round(a.tjk_gh_cjje*c.tjyfl_yhs,2)),*/
          sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_ghf,2)),
          sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_zgf,2)),
          sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_yj,2))
    from tjk_sjsmx1 a,tzqxx b,tjyfl c 
    where b.tzqxx_zqlb = '��Ʊ' and (a.tjk_sjsmx1_zqdm like '00%' or a.tjk_sjsmx1_zqdm like '30%') 
          and a.tjk_sjsmx1_zqdm = b.tzqxx_zqdm and b.tzqxx_jysc = c.tjyfl_jysc 
          and c.tjyfl_ywlb = '��Ʊ' and a.d_ywrq = rq
    GROUP BY a.tjk_sjsmx1_zqdm,b.tzqxx_zqmc,a.tjk_sjsmx1_jyfx,b.tzqxx_jysc;
          
--------------------------------------------------------------------�ع�����ҵ��
--ɾ������ع�������ˮ    
   delete from thgjy a where a.thgjy_cjrq = rq;
   --�����Ϻ�����ع�������ˮ                   ****�޸����ӷ��õ��ɽ������
   insert into thgjy
     select a.tjk_gh_zqdm,b.tzqxx_zqmc,
               decode(b.tzqxx_hgts,null,1,b.tzqxx_hgts),rq,
               (rq+decode(b.tzqxx_hgts,null,1,b.tzqxx_hgts)),
               decode(a.tjk_gh_jyfx,'����','����','��ȯ'),
               /*a.tjk_gh_jyfx,*/
               b.tzqxx_jysc,
               sum(a.tjk_gh_cjje)+
               sum(round(a.tjk_gh_cjje*c.tjyfl_jsf,2))+
               sum(round(a.tjk_gh_cjje*c.tjyfl_ghf,2))+
               sum(round(a.tjk_gh_cjje*c.tjyfl_zgf,2))+
               sum(round(a.tjk_gh_cjje*c.tjyfl_yj,2))+
               decode(a.tjk_gh_jyfx,'����',0��sum(round(a.tjk_gh_cjje*c.tjyfl_yhs,2))),
               sum(round((100+a.tjk_gh_cjjg*decode(b.tzqxx_hgts,null,1,b.tzqxx_hgts)/360)*a.tjk_gh_cjsl*10,2))
     from tjk_gh a,tzqxx b,tjyfl c
     where b.tzqxx_zqlb='�ع�' and a.tjk_gh_zqdm like '204%'   
           and a.tjk_gh_zqdm=b.tzqxx_zqdm and b.tzqxx_jysc=c.tjyfl_jysc
           and c.tjyfl_ywlb='�ع�' and a.d_ywrq=rq
     GROUP BY a.tjk_gh_zqdm,b.tzqxx_zqmc,b.tzqxx_hgts,rq+b.tzqxx_hgts,
               a.tjk_gh_jyfx,b.tzqxx_jysc; 
   --�������ڵ���ع�������ˮ                   
   insert into thgjy
     select a.tjk_sjsmx1_zqdm,b.tzqxx_zqmc,
               decode(b.tzqxx_hgts,null,1,b.tzqxx_hgts),rq,
               (rq+decode(b.tzqxx_hgts,null,1,b.tzqxx_hgts)),
               decode(a.tjk_sjsmx1_jyfx,'����','��ȯ','����'),
               /*a.tjk_sjsmx1_jyfx,*/
               b.tzqxx_jysc,
               sum(a.tjk_sjsmx1_cjje)+
               sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_jsf,2))+
               sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_ghf,2))+
               sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_zgf,2))+
               sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_yj,2))+
               decode(a.tjk_sjsmx1_jyfx,'����',0��sum(round(a.tjk_sjsmx1_cjje*c.tjyfl_yhs,2))),
               sum(round((100+a.tjk_sjsmx1_cjjg*decode(b.tzqxx_hgts,null,1,b.tzqxx_hgts)/365)*abs(a.tjk_sjsmx1_cjsl),2))
     from tjk_sjsmx1 a,tzqxx b,tjyfl c
     where b.tzqxx_zqlb='�ع�' and a.tjk_sjsmx1_zqdm like '131%'   
           and a.tjk_sjsmx1_zqdm=b.tzqxx_zqdm and b.tzqxx_jysc=c.tjyfl_jysc
           and c.tjyfl_ywlb='�ع�' and a.d_ywrq=rq
     GROUP BY a.tjk_sjsmx1_zqdm,b.tzqxx_zqmc,b.tzqxx_hgts,rq+b.tzqxx_hgts,
              a.tjk_sjsmx1_jyfx,b.tzqxx_jysc; 
 
---------------------------------------------------------��Ʊ�¹�ҵ��
 --ɾ�������¹ɱ������
 delete from txg where txg.txg_jyrq=rq;
 --�Ͻ����¹���ǩ
 insert into txg
   select a.tjk_jsmx_zqdm,b.tzqxx_jysc,'�¹���ǩ',a.tjk_jsmx_cjjg,-sum(a.tjk_jsmx_cjje),
     sum(a.tjk_jsmx_cjsl),a.d_ywrq,b.tzqxx_zqmc,a.d_ywrq
   from tjk_jsmx a,tzqxx b 
   where a.tjk_jsmx_jllx='002' and a.tjk_jsmx_zqlb='PT'
     and a.tjk_jsmx_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq
   GROUP BY a.tjk_jsmx_zqdm,b.tzqxx_jysc,a.tjk_jsmx_cjjg,a.d_ywrq,b.tzqxx_zqmc,a.d_ywrq;
 --�Ͻ����¹ɽɿ�
 insert into txg
   select a.tjk_jsmx_zqdm,b.tzqxx_jysc,'�¹ɽɿ�',a.tjk_jsmx_cjjg,-sum(a.tjk_jsmx_cjje),
     sum(a.tjk_jsmx_cjsl),a.d_ywrq+1,b.tzqxx_zqmc,a.d_ywrq
   from tjk_jsmx a,tzqxx b 
   where a.tjk_jsmx_jllx='002' and a.tjk_jsmx_zqlb='PT'
     and a.tjk_jsmx_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq
   GROUP BY a.tjk_jsmx_zqdm,b.tzqxx_jysc,a.tjk_jsmx_cjjg,a.d_ywrq+1,b.tzqxx_zqmc,a.d_ywrq;
 --�Ͻ����¹ɽ���
 insert into txg
   select a.tjk_jsmx_zqdm,b.tzqxx_jysc,'�¹ɽ���',a.tjk_jsmx_cjjg,-sum(a.tjk_jsmx_cjje),
     sum(a.tjk_jsmx_cjsl),a.d_ywrq,b.tzqxx_zqmc,a.d_ywrq
   from tjk_jsmx a,tzqxx b 
   where a.tjk_jsmx_jllx='003' and a.tjk_jsmx_zqlb='PT'
     and a.tjk_jsmx_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq
   GROUP BY a.tjk_jsmx_zqdm,b.tzqxx_jysc,a.tjk_jsmx_cjjg,a.d_ywrq,b.tzqxx_zqmc,a.d_ywrq;
 --�Ͻ����¹�������ͨ
 insert into txg
   select a.tjk_zqbd_zqdm,b.tzqxx_jysc,'�¹���ͨ',0,0,sum(a.tjk_zqbd_bdsl),a.d_ywrq,b.tzqxx_zqmc,a.d_ywrq
   from tjk_zqbd a,tzqxx b 
   where a.tjk_zqbd_zqlb='PT' and a.tjk_zqbd_qylb is null and a.tjk_zqbd_bdsl>0
     and a.tjk_zqbd_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq
   GROUP BY a.tjk_zqbd_zqdm,b.tzqxx_jysc,a.d_ywrq,b.tzqxx_zqmc,a.d_ywrq;
 --����¹���ǩ
 insert into txg
   select a.tjk_sjsfx_zqdm,b.tzqxx_jysc,'�¹���ǩ',a.tjk_sjsfx_zjje,
     sum(a.tjk_sjsfx_zjje*a.tjk_sjsfx_qrgs),sum(a.tjk_sjsfx_qrgs),a.tjk_sjsfx_fsrq,b.tzqxx_zqmc,a.d_ywrq
   from tjk_sjsfx a,tzqxx b 
   where a.tjk_sjsfx_fxywlb='A3'
     and a.tjk_sjsfx_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq
   group by a.tjk_sjsfx_zqdm,b.tzqxx_jysc,a.tjk_sjsfx_zjje,
            a.tjk_sjsfx_fsrq,b.tzqxx_zqmc,a.d_ywrq;
 --����¹ɽɿ�
 insert into txg
   select a.tjk_sjsfx_zqdm,b.tzqxx_jysc,'�¹ɽɿ�',a.tjk_sjsfx_zjje,
     sum(a.tjk_sjsfx_zjje*a.tjk_sjsfx_qrgs),sum(a.tjk_sjsfx_qrgs),a.tjk_sjsfx_fsrq+1,b.tzqxx_zqmc,a.d_ywrq
   from tjk_sjsfx a,tzqxx b 
   where a.tjk_sjsfx_fxywlb='A3'
     and a.tjk_sjsfx_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq
   group by a.tjk_sjsfx_zqdm,b.tzqxx_jysc,a.tjk_sjsfx_zjje,
            a.tjk_sjsfx_fsrq+1,b.tzqxx_zqmc,a.d_ywrq;
 --����¹ɽ���
 insert into txg
   select a.tjk_sjsfx_zqdm,b.tzqxx_jysc,'�¹ɽ���',a.tjk_sjsfx_zjje,
     sum(a.tjk_sjsfx_zjje*a.tjk_sjsfx_qrgs),sum(a.tjk_sjsfx_qrgs),a.tjk_sjsfx_fsrq,b.tzqxx_zqmc,a.d_ywrq
   from tjk_sjsfx a,tzqxx b 
   where a.tjk_sjsfx_fxywlb='A5'
     and a.tjk_sjsfx_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq
   group by a.tjk_sjsfx_zqdm,b.tzqxx_jysc,a.tjk_sjsfx_zjje,
            a.tjk_sjsfx_fsrq,b.tzqxx_zqmc,a.d_ywrq;
 --����¹�������ͨ
 insert into txg
   select a.tjk_sjsjg_zqdm,b.tzqxx_jysc,'�¹���ͨ',0,0,sum(a.tjk_sjsjg_cjsl),
     a.tjk_sjsjg_cjrq,b.tzqxx_zqmc,a.d_ywrq
   from tjk_sjsjg a,tzqxx b 
   where a.tjk_sjsjg_jgywlb='TGXG'
     and a.tjk_sjsjg_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq
   group by a.tjk_sjsjg_zqdm,b.tzqxx_jysc,a.tjk_sjsjg_cjrq,b.tzqxx_zqmc,a.d_ywrq;   
       
---------------------------------------------------------��Ʊ�ֺ�ҵ��
  --ɾ�����յĺ���������
  delete from thl where thl.thl_ywrq=rq;
  --�Ͻ���������Ȩ
  insert into thl
  select a.d_ywrq,a.tjk_zqbd_bdrq,'������Ȩ','�Ϻ�',a.tjk_zqbd_zqdm,b.tzqxx_zqmc,a.tjk_zqbd_bdsl,0,0 
  from tjk_zqbd a,tzqxx b 
  where a.tjk_zqbd_zqlb='PT' and a.tjk_zqbd_qylb='HL' and a.tjk_zqbd_bdsl>0 
    and a.tjk_zqbd_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq;
  --���������Ȩ
  insert into thl
  select a.d_ywrq,a.tjk_sjsjg_cjrq,'������Ȩ','����',a.tjk_sjsjg_zqdm,b.tzqxx_zqmc,'',a.tjk_sjsjg_zjje,''
  from tjk_sjsjg a,tzqxx b 
  where a.tjk_sjsjg_jgywlb='QPPX' and a.tjk_sjsjg_zjje<>0
    and a.tjk_sjsjg_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq;
  --�Ͻ�����������  
  insert into thl
  select a.d_ywrq,a.d_ywrq+1,'��������','�Ϻ�',a.tjk_jsmx_zqdm,b.tzqxx_zqmc,c.thl_djsl,a.tjk_jsmx_cjje,a.tjk_jsmx_cjje/c.thl_djsl
  from tjk_jsmx a,tzqxx b,thl c 
  where a.tjk_jsmx_jllx='001' and a.tjk_jsmx_zqlb='PT'
    and a.tjk_jsmx_zqdm=c.thl_zqdm and c.thl_ywlb='������Ȩ' and c.thl_jysc='�Ϻ�'
    and a.tjk_jsmx_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq and c.thl_ywrq=rq;
  /*update thl c set c.thl_fhje=
  from tjk_jsmx a,tzqxx b 
  where a.tjk_jsmx_jllx='001' and a.tjk_jsmx_zqlb='PT'
    and a.tjk_jsmx_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq 
    and c.thl_ywlb='������Ȩ' and c.thl_jysc='�Ϻ�' and c.thl_zqdm=a.tjk_jsmx_zqdm;*/
    
  --�����������
  insert into thl
  select a.d_ywrq,a.tjk_sjsjg_cjrq+1,'��������','����',a.tjk_sjsjg_zqdm,b.tzqxx_zqmc,0,a.tjk_sjsjg_zjje,0
  from tjk_sjsjg a,tzqxx b 
  where a.tjk_sjsjg_jgywlb='QPPX' and a.tjk_sjsjg_zjje<>0
    and a.tjk_sjsjg_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq;
  --�Ͻ����͹ɵ���
  insert into thl
  select a.d_ywrq,a.tjk_zqbd_bdrq+1,'��ɵ���','�Ϻ�',a.tjk_zqbd_zqdm,b.tzqxx_zqmc,a.tjk_zqbd_bdsl,0,0 
  from tjk_zqbd a,tzqxx b 
  where a.tjk_zqbd_zqlb='PT' and a.tjk_zqbd_qylb='S'
    and a.tjk_zqbd_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq;
  --����͹ɵ���
  insert into thl
  select a.d_ywrq,a.tjk_sjsjg_cjrq+1,'��ɵ���','����',a.tjk_sjsjg_zqdm,b.tzqxx_zqmc,a.tjk_sjsjg_cjsl,0,0
  from tjk_sjsjg a,tzqxx b 
  where a.tjk_sjsjg_jgywlb='QPPX' and a.tjk_sjsjg_cjsl<>0
    and a.tjk_sjsjg_zqdm=b.tzqxx_zqdm and a.d_ywrq=rq;

commit;
end rzqs;
/
