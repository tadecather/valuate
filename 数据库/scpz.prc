create or replace procedure scpz(rq date) is

 i integer;
 jrspj thq.thq_jrspj%type;
 jlcount integer;
 ye tkjkmye.tkjkmye_ye%type;
 fse tkjkmye.tkjkmye_ye%type;
 cursor scmchgrz(rq date)--�����ع�����
    is select a.thgjy_zqdm,a.thgjy_hgmc,a.thgjy_jysc,a.thgjy_cjje from thgjy a where a.thgjy_cjrq=rq and a.thgjy_hgfx='����';
    dm22 thgjy.thgjy_zqdm%type; 
    mc22 thgjy.thgjy_hgmc%type;
    sc22 thgjy.thgjy_jysc%type;
    je22 thgjy.thgjy_cjje%type;
 cursor scmchgrzjx(rq date)--�����ع����ʼ�Ϣ
    is select a.thgjy_cjrq,a.thgjy_zqdm,a.thgjy_hgmc,a.thgjy_jysc,a.thgjy_cjje,a.thgjy_fkje,a.thgjy_hgts from thgjy a where a.thgjy_cjrq<rq and a.thgjy_dqrq>=rq and a.thgjy_hgfx='����';
    cjrq23 thgjy.thgjy_cjrq%type;
    dm23 thgjy.thgjy_zqdm%type; 
    mc23 thgjy.thgjy_hgmc%type;
    sc23 thgjy.thgjy_jysc%type;
    cjje23 thgjy.thgjy_cjje%type;
    fkje23 thgjy.thgjy_fkje%type;
    ts23 thgjy.thgjy_hgts%type;
 cursor scmchgrzdq(rq date)--�����ع����ʵ���
    is select a.thgjy_zqdm,a.thgjy_hgmc,a.thgjy_jysc,a.thgjy_cjje,a.thgjy_fkje from thgjy a where a.thgjy_dqrq=rq and a.thgjy_hgfx='����';
    dm24 thgjy.thgjy_zqdm%type; 
    mc24 thgjy.thgjy_hgmc%type;
    sc24 thgjy.thgjy_jysc%type;
    cjje24 thgjy.thgjy_cjje%type;
    fkje24 thgjy.thgjy_fkje%type;
 cursor scmrhgrq(rq date)--����ع���ȯ
    is select a.thgjy_zqdm,a.thgjy_hgmc,a.thgjy_jysc,a.thgjy_cjje from thgjy a where a.thgjy_cjrq=rq and a.thgjy_hgfx='��ȯ';
    dm25 thgjy.thgjy_zqdm%type; 
    mc25 thgjy.thgjy_hgmc%type;
    sc25 thgjy.thgjy_jysc%type;
    je25 thgjy.thgjy_cjje%type;
 cursor scmrhgrqjx(rq date)--����ع���ȯ��Ϣ
    is select a.thgjy_cjrq,a.thgjy_zqdm,a.thgjy_hgmc,a.thgjy_jysc,a.thgjy_cjje,a.thgjy_fkje,a.thgjy_hgts from thgjy a where a.thgjy_cjrq<rq and a.thgjy_dqrq>=rq and a.thgjy_hgfx='��ȯ';
    cjrq26 thgjy.thgjy_cjrq%type;
    dm26 thgjy.thgjy_zqdm%type; 
    mc26 thgjy.thgjy_hgmc%type;
    sc26 thgjy.thgjy_jysc%type;
    cjje26 thgjy.thgjy_cjje%type;
    fkje26 thgjy.thgjy_fkje%type;
    ts26 thgjy.thgjy_hgts%type;
 cursor scmrhgrqdq(rq date)--����ع���ȯ����
    is select a.thgjy_zqdm,a.thgjy_hgmc,a.thgjy_jysc,a.thgjy_cjje,a.thgjy_fkje from thgjy a where a.thgjy_dqrq=rq and a.thgjy_hgfx='��ȯ';
    dm27 thgjy.thgjy_zqdm%type; 
    mc27 thgjy.thgjy_hgmc%type;
    sc27 thgjy.thgjy_jysc%type;
    cjje27 thgjy.thgjy_cjje%type;
    fkje27 thgjy.thgjy_fkje%type;
    
    --��Ҫ������ں����Ǽ�
 CURSOR schldj(rq date)--�Ϻ������Ǽ�
    IS select a.thl_zqdm,a.thl_zqmc,a.thl_fhje from thl a where a.thl_dzrq=rq and a.thl_ywlb='������Ȩ';--and a.thl_jysc='�Ϻ�';
    dm5 thl.thl_zqdm%type;
    mc5 thl.thl_zqmc%type;
    je5 thl.thl_fhje%type;
 CURSOR schldz(rq date)--��������
    IS select a.thl_zqdm,a.thl_zqmc,a.thl_jysc,a.thl_fhje,a.thl_djsl,a.thl_qybl from thl a where a.thl_dzrq=rq and a.thl_ywlb='��������';
    dm6 thl.thl_zqdm%type;
    mc6 thl.thl_zqmc%type;
    sc6 thl.thl_jysc%type;
    je6 thl.thl_fhje%type;
    sl6 thl.thl_djsl%type;
    bl6 thl.thl_qybl%type;
 CURSOR schgdz(rq date)--��ɵ���
    IS select a.thl_zqdm,a.thl_zqmc,a.thl_jysc,a.thl_djsl from thl a where a.thl_dzrq=rq and a.thl_ywlb='��ɵ���';
    dm7 thl.thl_zqdm%type;
    mc7 thl.thl_zqmc%type;
    sc7 thl.thl_jysc%type;
    sl7 thl.thl_djsl%type;
 /*CURSOR scxgsg(rq date)--�¹��깺
    IS select a.txg_zqdm,a.txg_zqmc,a.txg_jysc,a.txg_cjje from txg a where a.txg_ywrq=rq and a.txg_ywlb='�¹��깺';
    dm8 txg.txg_zqdm%type;
    mc8 txg.txg_zqmc%type;
    sc8 txg.txg_jysc%type;
    je8 txg.txg_cjje%type;*/
 cursor scxgzq(rq date)--�¹���ǩ
    IS select a.txg_zqdm,a.txg_zqmc,a.txg_jysc,a.txg_cjje,a.txg_cjsl from txg a where a.txg_ywrq=rq and a.txg_ywlb='�¹���ǩ';
    dm9 txg.txg_zqdm%type;
    mc9 txg.txg_zqmc%type;
    sc9 txg.txg_jysc%type;
    je9 txg.txg_cjje%type;
    sl9 txg.txg_cjsl%type; 
 CURSOR scxgjk(rq date)--�¹ɽɿ�
    IS select a.txg_zqdm,a.txg_zqmc,a.txg_jysc,a.txg_cjje from txg a where a.txg_ywrq=rq and a.txg_ywlb='�¹ɽɿ�';
    dm10 txg.txg_zqdm%type;
    mc10 txg.txg_zqmc%type;
    sc10 txg.txg_jysc%type;
    je10 txg.txg_cjje%type; 
 CURSOR scxgjs(rq date)--�¹ɽ���
    IS select a.txg_zqdm,a.txg_zqmc,a.txg_jysc,a.txg_cjje,a.txg_cjsl from txg a where a.txg_ywrq=rq and a.txg_ywlb='�¹ɽ���';
    dm11 txg.txg_zqdm%type;
    mc11 txg.txg_zqmc%type;
    sc11 txg.txg_jysc%type;
    je11 txg.txg_cjje%type;
    sl11 txg.txg_cjsl%type;
 cursor scxglt(rq date)--�¹���ͨ
    IS select a.txg_zqdm,a.txg_zqmc,a.txg_jysc,a.txg_cjsl,b.tzqjc_ljsl,b.tzqjc_ljcb from txg a,tzqjc b 
    where a.txg_ywrq=rq and a.txg_ywlb='�¹���ͨ'and b.tzqjc_jyrq=rq and b.tzqjc_zqdm=a.txg_zqdm and b.tzqjc_ywlb='�¹�' and b.tzqjc_jysc=a.txg_jysc ;
    dm12 txg.txg_zqdm%type;
    mc12 txg.txg_zqmc%type;
    sc12 txg.txg_jysc%type;
    sl12 txg.txg_cjsl%type;
    ljsl12 tzqjc.tzqjc_ljsl%type;
    ljcb12 tzqjc.tzqjc_ljcb%type;
 /*cursor scgpmr(rq date)--��Ʊ����
    is select a.zqdm,a.zqmc,a.jysc,a.sl,a.cb,a.fy,a.qsk,a.yfyj from gpmr_v a where a.jyrq=rq;
    dm19 gpmr_v.zqdm%type;
    mc19 gpmr_v.zqmc%type;
    sc19 gpmr_v.jysc%type;
    sl19 gpmr_v.sl%type;
    cb19 gpmr_v.cb%type;
    fy19 gpmr_v.fy%type;
    qsk19 gpmr_v.qsk%type;
    yfyj19 gpmr_v.yfyj%type;*/
    
cursor scgpmr(rq date)--��Ʊ����
    is select a.tgpjy_zqdm,a.tgpjy_zqmc,a.tgpjy_jysc,a.tgpjy_cjsl,a.tgpjy_cjje,a.tgpjy_jsf,a.tgpjy_yhs,a.tgpjy_ghf,a.tgpjy_zgf,a.tgpjy_yongjin from tgpjy a where a.tgpjy_jyfx='����' and a.tgpjy_jyrq=rq;
    dm19 tgpjy.tgpjy_zqdm%type;
    mc19 tgpjy.tgpjy_zqmc%type;
    sc19 tgpjy.tgpjy_jysc%type;
    sl19 tgpjy.tgpjy_cjsl%type;
    je19 tgpjy.tgpjy_cjje%type;
    js19 tgpjy.tgpjy_jsf%type;
    yh19 tgpjy.tgpjy_yhs%type;
    gh19 tgpjy.tgpjy_ghf%type;
    zg19 tgpjy.tgpjy_zgf%type;   
    yfyj19 tgpjy.tgpjy_yongjin%type;
    
 cursor scgpmc(rq date)--��Ʊ����
    is select a.tgpjy_zqdm,a.tgpjy_zqmc,a.tgpjy_jysc,a.tgpjy_cjsl,a.tgpjy_cjje,a.tgpjy_jsf,a.tgpjy_yhs,a.tgpjy_ghf,a.tgpjy_zgf,a.tgpjy_yongjin,b.tzqjc_ljcb,b.tzqjc_ljsl,b.tzqjc_ljgz
    from tgpjy a,tzqjc b where a.tgpjy_jyfx='����' and b.tzqjc_jyrq=a.tgpjy_jyrq and a.tgpjy_jyrq=rq and b.tzqjc_zqdm=a.tgpjy_zqdm and b.tzqjc_ywlb='����';
    dm20 tgpjy.tgpjy_zqdm%type;
    mc20 tgpjy.tgpjy_zqmc%type;
    sc20 tgpjy.tgpjy_jysc%type;
    sl20 tgpjy.tgpjy_cjsl%type;
    je20 tgpjy.tgpjy_cjje%type;
    js20 tgpjy.tgpjy_jsf%type;
    yh20 tgpjy.tgpjy_yhs%type;
    gh20 tgpjy.tgpjy_ghf%type;
    zg20 tgpjy.tgpjy_zgf%type;   
    yfyj20 tgpjy.tgpjy_yongjin%type;
    ljcb20 tzqjc.tzqjc_ljcb%type;
    ljsl20 tzqjc.tzqjc_ljsl%type;   
    ljgz20 tzqjc.tzqjc_ljgz%type;
    
 cursor scmmgz(rq date)--��Ʊ��ֵ��ֵ
    IS select a.tzqjc_zqdm,a.tzqjc_zqmc,a.tzqjc_jysc,a.tzqjc_ljsl,a.tzqjc_ljcb,a.tzqjc_ljgz,b.thq_jrspj 
    from tzqjc a ,thq b where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='����' and b.thq_hqrq=rq and a.tzqjc_zqdm=b.thq_zqdm;
    dm21 tzqjc.tzqjc_zqdm%type;
    mc21 tzqjc.tzqjc_zqmc%type;
    sc21 tzqjc.tzqjc_jysc%type;
    ljsl21 tzqjc.tzqjc_ljsl%type;  
    ljcb21 tzqjc.tzqjc_ljcb%type;
    ljgz21 tzqjc.tzqjc_ljgz%type;
    jrspj21 thq.thq_jrspj%type;
    
 cursor sczqmr(rq date)--ծȯ����
    is select a.tzqjy_zqdm,a.tzqjy_zqmc,a.tzqjy_jysc,a.tzqjy_cjje,a.tzqjy_cjsl,a.tzqjy_jsf,a.tzqjy_yhs,a.tzqjy_ghf,a.tzqjy_zgf,a.tzqjy_yongjin,a.tzqjy_sqlx,a.tzqjy_shlx,a.tzqjy_lxs from tzqjy a where a.tzqjy_jyfx ='����' and a.tzqjy_jyrq =rq;
    dm30 tzqjy.tzqjy_zqdm%type;
    mc30 tzqjy.tzqjy_zqmc%type;
    sc30 tzqjy.tzqjy_jysc%type;
    je30 tzqjy.tzqjy_cjje%type;
    sl30 tzqjy.tzqjy_cjsl%type;
    js30 tzqjy.tzqjy_jsf%type;
    yh30 tzqjy.tzqjy_yhs%type;
    gh30 tzqjy.tzqjy_ghf%type;
    zg30 tzqjy.tzqjy_zgf%type;
    yfyj30 tzqjy.tzqjy_yongjin%type;
    sqlx30 tzqjy.tzqjy_sqlx%type;
    shlx30 tzqjy.tzqjy_shlx%type;
    lxs30 tzqjy.tzqjy_lxs%type;
    
    
cursor sczqmc(rq date)--ծȯ����
    is select a.tzqjy_zqdm,a.tzqjy_zqmc,a.tzqjy_jysc,a.tzqjy_cjje,a.tzqjy_cjsl,a.tzqjy_jsf,a.tzqjy_yhs,a.tzqjy_ghf,a.tzqjy_zgf,a.tzqjy_yongjin,a.tzqjy_sqlx,a.tzqjy_shlx,a.tzqjy_lxs,b.tzqjc_ljcb,b.tzqjc_ljsl,b.tzqjc_ljgz,b.tzqjc_ljlx 
    from tzqjy a,tzqjc b where a.tzqjy_jyfx='����' and b.tzqjc_jyrq=a.tzqjy_jyrq and a.tzqjy_jyrq =rq and b.tzqjc_zqdm=a.tzqjy_zqdm and b.tzqjc_ywlb='ծȯ';
    dm31 tzqjy.tzqjy_zqdm%type;
    mc31 tzqjy.tzqjy_zqmc%type;
    sc31 tzqjy.tzqjy_jysc%type;
    je31 tzqjy.tzqjy_cjje%type;
    sl31 tzqjy.tzqjy_cjsl%type;
    js31 tzqjy.tzqjy_jsf%type;
    yh31 tzqjy.tzqjy_yhs%type;
    gh31 tzqjy.tzqjy_ghf%type;
    zg31 tzqjy.tzqjy_zgf%type;
    yfyj31 tzqjy.tzqjy_yongjin%type;
    sqlx31 tzqjy.tzqjy_sqlx%type;
    shlx31 tzqjy.tzqjy_shlx%type;
    lxs31 tzqjy.tzqjy_lxs%type;
    ljcb31 tzqjc.tzqjc_ljcb%type;
    ljsl31 tzqjc.tzqjc_ljsl%type;   
    ljgz31 tzqjc.tzqjc_ljgz%type;
    ljlx31 tzqjc.tzqjc_ljlx%type;


 cursor sczqgz(rq date)--ծȯ��ֵ��ֵ
    IS select a.tzqjc_zqdm,a.tzqjc_zqmc,a.tzqjc_jysc,a.tzqjc_ljsl,a.tzqjc_ljcb,a.tzqjc_ljgz,b.thq_jrspj 
    from tzqjc a ,thq b where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='ծȯ' and b.thq_hqrq=rq and b.thq_zqdm=a.tzqjc_zqdm;
    dm32 tzqjc.tzqjc_zqdm%type;
    mc32 tzqjc.tzqjc_zqmc%type;
    sc32 tzqjc.tzqjc_jysc%type;
    ljsl32 tzqjc.tzqjc_ljsl%type;  
    ljcb32 tzqjc.tzqjc_ljcb%type;
    ljgz32 tzqjc.tzqjc_ljgz%type;
    jrspj32 thq.thq_jrspj%type;
    
 cursor sczqjx(rq date)--ծȯÿ�ռ�Ϣ
    IS select a.tzqjc_zqdm,a.tzqjc_zqmc,a.tzqjc_jysc,a.tzqjc_ljsl,a.tzqjc_ljlx,b.tzqxx_qxr,b.tzqxx_nll,b.tzqxx_lxs
    from tzqjc a ,tzqxx b where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='ծȯ' and b.tzqxx_zqdm=a.tzqjc_zqdm;
    dm33 tzqjc.tzqjc_zqdm%type;
    mc33 tzqjc.tzqjc_zqmc%type;
    sc33 tzqjc.tzqjc_jysc%type;
    ljsl33 tzqjc.tzqjc_ljsl%type;  
    ljlx33 tzqjc.tzqjc_ljlx%type;
    qxr33 tzqxx.tzqxx_qxr%type;
    nll33 tzqxx.tzqxx_nll%type;
    lxsl33 tzqxx.tzqxx_lxs%type;
    
 cursor sczqdxzc(rq date)--ծȯ��Ϣת��
    IS select a.tzqjy_zqdm,tzqjy_zqmc,tzqjy_jysc,tzqjy_shlx from tzqjy a where a.tzqjy_jyfx='��Ϣת��' and tzqjy_jyrq=rq ;
    dm34 tzqjy.tzqjy_zqdm%type;
    mc34 tzqjy.tzqjy_zqmc%type;
    sc34 tzqjy.tzqjy_jysc%type;
    shlx34 tzqjy.tzqjy_shlx%type;

 cursor sczqdxdz(rq date)--ծȯ��Ϣ����
    IS select a.tzqjy_zqdm,tzqjy_zqmc,tzqjy_jysc,tzqjy_shlx,tzqjy_lxs from tzqjy a where a.tzqjy_jyfx='��Ϣ����' and tzqjy_jyrq=rq ;
    dm35 tzqjy.tzqjy_zqdm%type;
    mc35 tzqjy.tzqjy_zqmc%type;
    sc35 tzqjy.tzqjy_jysc%type;
    shlx35 tzqjy.tzqjy_shlx%type;
    lxs35 tzqjy.tzqjy_lxs%type;

begin
   --ɾ��ԭ������ƾ֤
  delete from tpzmx where tpzmx_pzrq=rq;/* and to_number(tpzmx_flbh)<>0*/
  --ɾ������ĳֱֲ�
  delete from tzqjc a where a.tzqjc_jyrq=rq; 
  --��ǰһ�������ս���ʱ�ĳֱֲ����ɽ���ĳֱֲ�
  insert into tzqjc select rq,a.tzqjc_zqdm,a.tzqjc_zqmc,a.tzqjc_ljsl,a.tzqjc_ljcb,a.tzqjc_ljgz,a.tzqjc_ljlx,a.tzqjc_ywlb,a.tzqjc_jysc from tzqjc a where a.tzqjc_jyrq=rq-1;  -- 
  i:=1;  --����ƾ֤�����
  --�����,����pzmb��ƾ֤���pzbh����
  select count(*) into jlcount from tgz  where tgz_ywrq=rq-1 and tgz_kmmc='�ʲ��ܾ�ֵ';
  if jlcount>0 then   
     insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,b.tgz_zsz*c.tstlf_jtbl/c.tstlf_jtcs/100,'',a.tpzmb_jdfx ,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb 
        from tpzmb a,tgz b,tstlf c where a.tpzmb_pzbh='000002'and b.tgz_ywrq=(rq-1) and b.tgz_kmmc='�ʲ��ܾ�ֵ' and c.tstlf_fylx='�����';
     i:=i+1;
  --�йܷ�
     insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,b.tgz_zsz*c.tstlf_jtbl/c.tstlf_jtcs/100,'',a.tpzmb_jdfx ,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb 
        from tpzmb a,tgz b,tstlf c where a.tpzmb_pzbh='000003'and b.tgz_ywrq=(rq-1) and b.tgz_kmmc='�ʲ��ܾ�ֵ' and c.tstlf_fylx='�йܷ�';
     i:=i+1;
  end if;
  --��Ϣ��¶��
     insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,round(b.tstlf_fyze/b.tstlf_jtcs,2),'',a.tpzmb_jdfx ,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb 
     from tpzmb a,tstlf b where a.tpzmb_pzbh='000004' and b.tstlf_fylx='��Ϣ��¶��'; 
  i:=i+1;
  --��Ʒ�
  insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,round(b.tstlf_fyze/b.tstlf_jtcs,2),'',a.tpzmb_jdfx ,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb 
     from tpzmb a,tstlf b where a.tpzmb_pzbh='000005' and b.tstlf_fylx='��Ʒ�';
  i:=i+1;
  
  --�����ع�����
  OPEN scmchgrz(rq);--���α�
  FETCH scmchgrz INTO dm22,mc22,sc22,je22;--����һ���α������ 
  WHILE scmchgrz%FOUND LOOP--ѭ����䣬����tpzmb��pzbh+��Ŀ����kmdmȷ����¼
     if sc22='�Ϻ�'then
        insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je22,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm22||mc22 
           from tpzmb a where a.tpzmb_pzbh='000044'and a.tpzmb_kmdm='30030101';
        insert into tpzmx select rq,i,a.tpzmb_kmdm||dm22,a.tpzmb_kmmc||mc22,a.tpzmb_ywlb,je22,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm22||mc22 
           from tpzmb a where a.tpzmb_pzbh='000044'and a.tpzmb_kmdm='22020101';
     elsif sc22='����'then
        insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je22,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm22||mc22 
           from tpzmb a where a.tpzmb_pzbh='000045'and a.tpzmb_kmdm='30030201';
        insert into tpzmx select rq,i,a.tpzmb_kmdm||dm22,a.tpzmb_kmmc||mc22,a.tpzmb_ywlb,je22,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm22||mc22 
           from tpzmb a where a.tpzmb_pzbh='000045'and a.tpzmb_kmdm='22020201';
     end if;
     i:=i+1;
     FETCH scmchgrz INTO dm22,mc22,sc22,je22; --������ɺ������һ��
  END LOOP;
  CLOSE scmchgrz;
  --�����ع����ʼ�Ϣ    ****�޸������ж�
  OPEN scmchgrzjx(rq);
  FETCH scmchgrzjx INTO cjrq23,dm23,mc23,sc23,cjje23,fkje23,ts23; 
  WHILE scmchgrzjx%FOUND LOOP
     if sc23='�Ϻ�'then
       if rq=cjrq23+ts23 then
          insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,fkje23-cjje23-round((fkje23-cjje23)/ts23,2)*(ts23-1),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm23||mc23
             from tpzmb a where a.tpzmb_pzbh='000046'; 
       else
          insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,round((fkje23-cjje23)/ts23,2),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm23||mc23
             from tpzmb a where a.tpzmb_pzbh='000046'; 
       end if;
     elsif sc23='����'then
        if rq=cjrq23+ts23 then
          insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,fkje23-cjje23-round((fkje23-cjje23)/ts23,2)*(ts23-1),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm23||mc23
             from tpzmb a where a.tpzmb_pzbh='000048'; 
       else
          insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,round((fkje23-cjje23)/ts23,2),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm23||mc23
             from tpzmb a where a.tpzmb_pzbh='000048'; 
       end if;
     end if;
     i:=i+1;
     FETCH scmchgrzjx INTO cjrq23,dm23,mc23,sc23,cjje23,fkje23,ts23;  
  END LOOP;
  CLOSE scmchgrzjx;
  --�����ع����ʵ���
  OPEN scmchgrzdq(rq);
  FETCH scmchgrzdq INTO dm24,mc24,sc24,cjje24,fkje24; 
  WHILE scmchgrzdq%FOUND LOOP
     if sc24='�Ϻ�'then
        insert into tpzmx select rq,i,a.tpzmb_kmdm||dm24,a.tpzmb_kmmc||mc24,a.tpzmb_ywlb,cjje24,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm24||mc24 
           from tpzmb a where a.tpzmb_pzbh='000047'and a.tpzmb_kmdm='22020101';
        insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,fkje24-cjje24,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm24||mc24 
           from tpzmb a where a.tpzmb_pzbh='000047'and a.tpzmb_kmdm='22310111';
        insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,fkje24,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm24||mc24 
           from tpzmb a where a.tpzmb_pzbh='000047'and a.tpzmb_kmdm='30030101';
     elsif sc24='����'then
        insert into tpzmx select rq,i,a.tpzmb_kmdm||dm24,a.tpzmb_kmmc||mc24,a.tpzmb_ywlb,cjje24,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm24||mc24 
           from tpzmb a where a.tpzmb_pzbh='000049'and a.tpzmb_kmdm='22020201';
        insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,fkje24-cjje24,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm24||mc24 
           from tpzmb a where a.tpzmb_pzbh='000049'and a.tpzmb_kmdm='22310131';
        insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,fkje24,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm24||mc24 
           from tpzmb a where a.tpzmb_pzbh='000049'and a.tpzmb_kmdm='30030201';
     end if;
     i:=i+1;
     FETCH scmchgrzdq INTO dm24,mc24,sc24,cjje24,fkje24; 
  END LOOP;
  CLOSE scmchgrzdq;
  
  --����ع���ȯ
  OPEN scmrhgrq(rq);
  FETCH scmrhgrq INTO dm25,mc25,sc25,je25; 
  WHILE scmrhgrq%FOUND LOOP
     if sc25='�Ϻ�'then
        insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je25,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm25||mc25 
           from tpzmb a where a.tpzmb_pzbh='000050'and a.tpzmb_kmdm='30030101';
        insert into tpzmx select rq,i,a.tpzmb_kmdm||dm25,a.tpzmb_kmmc||mc25,a.tpzmb_ywlb,je25,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm25||mc25 
           from tpzmb a where a.tpzmb_pzbh='000050'and a.tpzmb_kmdm='12020101';
     elsif sc25='����'then
        insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je25,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm25||mc25 
           from tpzmb a where a.tpzmb_pzbh='000051'and a.tpzmb_kmdm='30030201';
        insert into tpzmx select rq,i,a.tpzmb_kmdm||dm25,a.tpzmb_kmmc||mc25,a.tpzmb_ywlb,je25,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm25||mc25 
           from tpzmb a where a.tpzmb_pzbh='000051'and a.tpzmb_kmdm='12020201';
     end if;
     i:=i+1;
     FETCH scmrhgrq INTO dm25,mc25,sc25,je25; 
  END LOOP;
  CLOSE scmrhgrq;
  --����ع���ȯ��Ϣ          ****�޸������ж�
  OPEN scmrhgrqjx(rq);
  FETCH scmrhgrqjx INTO cjrq26,dm26,mc26,sc26,cjje26,fkje26,ts26; 
  WHILE scmrhgrqjx%FOUND LOOP
     if sc26='�Ϻ�'then
       if rq=cjrq26+ts26 then
          insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,fkje26-cjje26-round((fkje26-cjje26)/ts26,2)*(ts26-1),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm26||mc26
             from tpzmb a where a.tpzmb_pzbh='000052'; 
       else
          insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,round((fkje26-cjje26)/ts26,2),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm26||mc26
             from tpzmb a where a.tpzmb_pzbh='000052'; 
       end if;
     elsif sc26='����'then
        if rq=cjrq26+ts26 then
          insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,fkje26-cjje26-(fkje26-cjje26)*(ts26-1)/ts26,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm26||mc26
             from tpzmb a where a.tpzmb_pzbh='000054'; 
       else
          insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,(fkje26-cjje26)/ts26,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm26||mc26
             from tpzmb a where a.tpzmb_pzbh='000054'; 
       end if;
     end if;
     i:=i+1;
      FETCH scmrhgrqjx INTO cjrq26,dm26,mc26,sc26,cjje26,fkje26,ts26;   
  END LOOP;
  CLOSE scmrhgrqjx;
  --����ع���ȯ����
  OPEN scmrhgrqdq(rq);
  FETCH scmrhgrqdq INTO dm27,mc27,sc27,cjje27,fkje27; 
  WHILE scmrhgrqdq%FOUND LOOP
     if sc27='�Ϻ�'then
        insert into tpzmx select rq,i,a.tpzmb_kmdm||dm27,a.tpzmb_kmmc||mc27,a.tpzmb_ywlb,cjje27,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm27||mc27 
           from tpzmb a where a.tpzmb_pzbh='000053'and a.tpzmb_kmdm='12020101';
        insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,fkje27-cjje27,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm27||mc27 
           from tpzmb a where a.tpzmb_pzbh='000053'and a.tpzmb_kmdm='12049111';
        insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,fkje27,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm27||mc27 
           from tpzmb a where a.tpzmb_pzbh='000053'and a.tpzmb_kmdm='30030101';
     elsif sc27='����'then
        insert into tpzmx select rq,i,a.tpzmb_kmdm||dm27,a.tpzmb_kmmc||mc27,a.tpzmb_ywlb,cjje27,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm27||mc27 
           from tpzmb a where a.tpzmb_pzbh='000055'and a.tpzmb_kmdm='12020201';
        insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,fkje27-cjje27,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm27||mc27 
           from tpzmb a where a.tpzmb_pzbh='000055'and a.tpzmb_kmdm='12049131';
        insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,fkje27,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm27||mc27 
           from tpzmb a where a.tpzmb_pzbh='000055'and a.tpzmb_kmdm='30030201';
     end if;
     i:=i+1;
     FETCH scmrhgrqdq INTO dm27,mc27,sc27,cjje27,fkje27;
  END LOOP;
  CLOSE scmrhgrqdq;
  
  --�����Ǽ�
  /*OPEN schldj(rq);
  FETCH schldj INTO dm5,mc5,je5; 
  WHILE schldj%FOUND LOOP
     insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je5,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm5||mc5
        from tpzmb a where a.tpzmb_pzbh='000013';
     i:=i+1;
     FETCH schldj INTO dm5,mc5,je5;  
  END LOOP;
  CLOSE schldj;*/
  --��������               ****�޸��Ϻ���Ʊ�ֺ������
  OPEN schldz(rq);
  FETCH schldz INTO dm6,mc6,sc6,je6,sl6,bl6; 
  WHILE schldz%FOUND LOOP
     if sc6='�Ϻ�' then
        insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,sl6*bl6,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm6||mc6
           from tpzmb a where a.tpzmb_pzbh='000014' and a.tpzmb_kmdm='10020101';
        insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,sl6*bl6,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm6||mc6
           from tpzmb a where a.tpzmb_pzbh='000014' and a.tpzmb_kmdm='61119901';
     elsif sc6='����' then
        insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je6,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm6||mc6
           from tpzmb a where a.tpzmb_pzbh='000017' and a.tpzmb_kmdm='10020101';  
        insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je6,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm6||mc6
           from tpzmb a where a.tpzmb_pzbh='000017' and a.tpzmb_kmdm='61119903';
     end if;
     i:=i+1;
     FETCH schldz INTO dm6,mc6,sc6,je6,sl6,bl6;   
  END LOOP;
  CLOSE schldz;
  --��ɵ���
  OPEN schgdz(rq);
  FETCH schgdz INTO dm7,mc7,sc7,sl7; 
  WHILE schgdz%FOUND LOOP
     if sc7='�Ϻ�' then
        insert into tpzmx select rq,i,a.tpzmb_kmdm||dm7,a.tpzmb_kmmc||mc7,a.tpzmb_ywlb,0.01,sl7,a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm6||mc6
           from tpzmb a where a.tpzmb_pzbh='000015';
     elsif sc7='����' then
        insert into tpzmx select rq,i,a.tpzmb_kmdm||dm7,a.tpzmb_kmmc||mc7,a.tpzmb_ywlb,0.01,sl7,a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm6||mc6
           from tpzmb a where a.tpzmb_pzbh='000016';  
     end if;
     i:=i+1;
     --�������������tzqjc��ҵ��Ϊ�����������ۼ�����
     update tzqjc a set a.tzqjc_ljsl=a.tzqjc_ljsl+sl7 where a.tzqjc_jyrq=rq and a.tzqjc_zqdm=dm7 and a.tzqjc_ywlb='����' and a.tzqjc_jysc=sc7; 
     FETCH schgdz INTO dm7,mc7,sc7,sl7;  
  END LOOP;
  CLOSE schgdz;
  
  --�¹���ǩ
  OPEN scxgzq(rq);
  FETCH scxgzq INTO dm9,mc9,sc9,je9,sl9; 
  WHILE scxgzq%FOUND LOOP
     if sc9='�Ϻ�' then
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je9,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm9||mc9 
         from tpzmb a where a.tpzmb_pzbh='000018' and a.tpzmb_kmdm='30030102';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je9,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm9||mc9 
         from tpzmb a where a.tpzmb_pzbh='000018' and a.tpzmb_kmdm='30030121';
     elsif sc9='����' then
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je9,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm9||mc9 
         from tpzmb a where a.tpzmb_pzbh='000022' and a.tpzmb_kmdm='30030202';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je9,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm9||mc9 
         from tpzmb a where a.tpzmb_pzbh='000022' and a.tpzmb_kmdm='30030221';
     end if;
     i:=i+1;  
     select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_zqdm=dm9 and a.tzqjc_ywlb='�¹�' and a.tzqjc_jysc=sc9 ;
     if jlcount=0 then
       insert into tzqjc values(rq,dm9,mc9,sl9,je9,0,null,'�¹�',sc9);
     else
       --��ǩ���������ɱ�����cc���У�ҵ�����Ϊ���¹ɡ�����ͨǰ��û�й�����
       update tzqjc a set a.tzqjc_ljsl=a.tzqjc_ljsl+sl9,a.tzqjc_ljcb=a.tzqjc_ljcb+je9 where a.tzqjc_jyrq=rq and a.tzqjc_zqdm=dm9 and a.tzqjc_ywlb='�¹�' and a.tzqjc_jysc=sc9;
     end if;   
     FETCH scxgzq INTO dm9,mc9,sc9,je9,sl9; 
  END LOOP;
  CLOSE scxgzq;
  --�¹ɽɿ�
  OPEN scxgjk(rq);
  FETCH scxgjk INTO dm10,mc10,sc10,je10; 
  WHILE scxgjk%FOUND LOOP
     if sc10='�Ϻ�' then
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je10,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm10||mc10 
         from tpzmb a where a.tpzmb_pzbh='000019' and a.tpzmb_kmdm='30030121';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je10,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm10||mc10 
         from tpzmb a where a.tpzmb_pzbh='000019' and a.tpzmb_kmdm='30030101';
     elsif sc10='����' then
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je10,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm10||mc10 
         from tpzmb a where a.tpzmb_pzbh='000023' and a.tpzmb_kmdm='30030221';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je10,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm10||mc10 
         from tpzmb a where a.tpzmb_pzbh='000023' and a.tpzmb_kmdm='30030201';
     end if;
     i:=i+1;  
     FETCH scxgjk INTO dm10,mc10,sc10,je10; 
  END LOOP;
  CLOSE scxgjk;
  --�¹���ǩ����
  OPEN scxgjs(rq);
  FETCH scxgjs INTO dm11,mc11,sc11,je11,sl11; 
  WHILE scxgjs%FOUND LOOP
     if sc11='�Ϻ�'then
        insert into tpzmx select rq,i,a.tpzmb_kmdm||dm11,a.tpzmb_kmmc||mc11,a.tpzmb_ywlb,je11,sl11,a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm11||mc11 
           from tpzmb a where a.tpzmb_pzbh='000020' and a.tpzmb_kmdm='11020301';
        insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je11,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm11||mc11 
           from tpzmb a where a.tpzmb_pzbh='000020' and a.tpzmb_kmdm='30030102';
     elsif sc11='����'then
        insert into tpzmx select rq,i,a.tpzmb_kmdm||dm11,a.tpzmb_kmmc||mc11,a.tpzmb_ywlb,je11,sl11,a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm11||mc11 
           from tpzmb a where a.tpzmb_pzbh='000024' and a.tpzmb_kmdm='11024301';
        insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je11,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm11||mc11 
           from tpzmb a where a.tpzmb_pzbh='000024' and a.tpzmb_kmdm='30030202';
     end if;
     i:=i+1;
     FETCH scxgjs INTO dm11,mc11,sc11,je11,sl11; 
  END LOOP;
  CLOSE scxgjs;
  --�¹���ͨ
  OPEN scxglt(rq);
  FETCH scxglt INTO dm12,mc12,sc12,sl12,ljsl12,ljcb12; 
  WHILE scxglt%FOUND LOOP
     if sc12='�Ϻ�' then
      insert into tpzmx select rq,i,a.tpzmb_kmdm||dm12,a.tpzmb_kmmc||mc12,a.tpzmb_ywlb,ljcb12*sl12/ljsl12,sl12,a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm12||mc12 
           from tpzmb a where a.tpzmb_pzbh='000021' and a.tpzmb_kmdm='11020101';
      insert into tpzmx select rq,i,a.tpzmb_kmdm||dm12,a.tpzmb_kmmc||mc12,a.tpzmb_ywlb,ljcb12*sl12/ljsl12,sl12,a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm11||mc11 
           from tpzmb a where a.tpzmb_pzbh='000021' and a.tpzmb_kmdm='11020301';    
     elsif sc12='����' then
      insert into tpzmx select rq,i,a.tpzmb_kmdm||dm12,a.tpzmb_kmmc||mc12,a.tpzmb_ywlb,ljcb12*sl12/ljsl12,sl12,a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm12||mc12 
           from tpzmb a where a.tpzmb_pzbh='000025' and a.tpzmb_kmdm='11024101';
      insert into tpzmx select rq,i,a.tpzmb_kmdm||dm12,a.tpzmb_kmmc||mc12,a.tpzmb_ywlb,ljcb12*sl12/ljsl12,sl12,a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm12||mc12 
           from tpzmb a where a.tpzmb_pzbh='000025' and a.tpzmb_kmdm='11024301';
     end if;
     i:=i+1;
     select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_zqdm=dm12 and a.tzqjc_ywlb='����' and a.tzqjc_jysc=sc12 ;
     --�¹���ͨ�󣬡��¹ɡ���ת��Ϊ����������,���ջ��й�����ƾ֤��ֱ�����ɡ��������Ĺ���
     if jlcount=0 then
       insert into tzqjc values(rq,dm12,mc12,sl12,ljcb12*sl12/ljsl12,0,'','����',sc12);
     else
       update tzqjc a set a.tzqjc_ljsl=a.tzqjc_ljsl+sl12,a.tzqjc_ljcb=a.tzqjc_ljcb+ljcb12*sl12/ljsl12 where a.tzqjc_jyrq=rq and a.tzqjc_zqdm=dm12 and a.tzqjc_ywlb='����' ; 
     end if;
       update tzqjc a set a.tzqjc_ljsl=a.tzqjc_ljsl-sl12,a.tzqjc_ljcb=a.tzqjc_ljcb-ljcb12*sl12/ljsl12 where a.tzqjc_jyrq=rq and a.tzqjc_zqdm=dm12 and  a.tzqjc_ywlb='�¹�'  ; 
     FETCH scxglt INTO dm12,mc12,sc12,sl12,ljsl12,ljcb12; 
  END LOOP;
  CLOSE scxglt;
  
 --��Ʊ����
  open scgpmr(rq);
  FETCH scgpmr INTO dm19,mc19,sc19,sl19,je19,js19,yh19,gh19,zg19,yfyj19;
  WHILE scgpmr%FOUND LOOP
     if sc19='�Ϻ�'then
      insert into tpzmx select rq,i,a.tpzmb_kmdm||dm19,a.tpzmb_kmmc||mc19,a.tpzmb_ywlb,je19,sl19,a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm19||mc19
         from tpzmb a where a.tpzmb_pzbh='000038' and a.tpzmb_kmdm='11020101';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,js19+yh19+gh19+zg19+yfyj19,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm19||mc19
         from tpzmb a where a.tpzmb_pzbh='000038' and a.tpzmb_kmdm='64070101';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je19+js19+yh19+gh19+zg19,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm19||mc19
         from tpzmb a where a.tpzmb_pzbh='000038' and a.tpzmb_kmdm='30030101';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,yfyj19,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm19||mc19
         from tpzmb a where a.tpzmb_pzbh='000038' and a.tpzmb_kmdm='220901';  
     elsif sc19='����'then
      insert into tpzmx select rq,i,a.tpzmb_kmdm||dm19,a.tpzmb_kmmc||mc19,a.tpzmb_ywlb,je19,sl19,a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm19||mc19
         from tpzmb a where a.tpzmb_pzbh='000039' and a.tpzmb_kmdm='11023101';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,js19+yh19+gh19+zg19+yfyj19,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm19||mc19
         from tpzmb a where a.tpzmb_pzbh='000039' and a.tpzmb_kmdm='64070301';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je19+js19+yh19+gh19+zg19,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm19||mc19
         from tpzmb a where a.tpzmb_pzbh='000039' and a.tpzmb_kmdm='30030201';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,yfyj19,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm19||mc19
         from tpzmb a where a.tpzmb_pzbh='000039' and a.tpzmb_kmdm='220901';
     end if;
     i:=i+1;
     --��������tzqjc���е��������ɱ���ҵ�����Ϊ��������
     select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_zqdm=dm19 and a.tzqjc_ywlb='����' and a.tzqjc_jysc=sc19 ;
     if jlcount=0 then
       insert into tzqjc values(rq,dm19,mc19,sl19,je19,0,'','����',sc19);
     else
       update tzqjc a set a.tzqjc_ljsl=a.tzqjc_ljsl+sl19,a.tzqjc_ljcb=a.tzqjc_ljcb+je19 where a.tzqjc_jyrq=rq and a.tzqjc_zqdm=dm19 and a.tzqjc_ywlb='����' and a.tzqjc_jysc=sc19;
     end if;
     FETCH scgpmr INTO dm19,mc19,sc19,sl19,je19,js19,yh19,gh19,zg19,yfyj19;
  END LOOP;
  CLOSE scgpmr; 
  --��Ʊ����
  open scgpmc(rq);
  FETCH scgpmc INTO dm20,mc20,sc20,sl20,je20,js20,yh20,gh20,zg20,yfyj20,ljcb20,ljsl20,ljgz20;
  WHILE scgpmc%FOUND LOOP
     if sc20='�Ϻ�'then     
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je20-js20-yh20-gh20-zg20,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm20||mc20
         from tpzmb a where a.tpzmb_pzbh='000040' and a.tpzmb_kmdm='30030101';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,js20+yh20+gh20+zg20+yfyj20,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm20||mc20
         from tpzmb a where a.tpzmb_pzbh='000040' and a.tpzmb_kmdm='64070101';
      insert into tpzmx select rq,i,a.tpzmb_kmdm||dm20,a.tpzmb_kmmc||mc20,a.tpzmb_ywlb,round(ljcb20/ljsl20*sl20,2),sl20,a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm20||mc20
         from tpzmb a where a.tpzmb_pzbh='000040' and a.tpzmb_kmdm='11020101';
      insert into tpzmx select rq,i,a.tpzmb_kmdm||dm20,a.tpzmb_kmmc||mc20,a.tpzmb_ywlb,round(ljgz20/ljsl20*sl20,2),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm20||mc20
         from tpzmb a where a.tpzmb_pzbh='000040' and a.tpzmb_kmdm='11020199';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,yfyj20,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm20||mc20
         from tpzmb a where a.tpzmb_pzbh='000040' and a.tpzmb_kmdm='220901';  
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je20-round(ljcb20/ljsl20*sl20,2)-round(ljgz20/ljsl20*sl20,2),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm20||mc20
         from tpzmb a where a.tpzmb_pzbh='000040' and a.tpzmb_kmdm='61110101';  
      i:=i+1;
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,0-round(ljgz20/ljsl20*sl20,2),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm20||mc20
         from tpzmb a where a.tpzmb_pzbh='000041' and a.tpzmb_kmdm='610101';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,round(ljgz20/ljsl20*sl20,2),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm20||mc20
         from tpzmb a where a.tpzmb_pzbh='000041' and a.tpzmb_kmdm='61110101';
     elsif sc20='����'then
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je20-js20-yh20-gh20-zg20,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm20||mc20
         from tpzmb a where a.tpzmb_pzbh='000042' and a.tpzmb_kmdm='30030201';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,js20+yh20+gh20+zg20+yfyj20,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm20||mc20
         from tpzmb a where a.tpzmb_pzbh='000042' and a.tpzmb_kmdm='64070301';
      insert into tpzmx select rq,i,a.tpzmb_kmdm||dm20,a.tpzmb_kmmc||mc20,a.tpzmb_ywlb,round(ljcb20/ljsl20*sl20,2),sl20,a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm20||mc20
         from tpzmb a where a.tpzmb_pzbh='000042' and a.tpzmb_kmdm='11023101';
      insert into tpzmx select rq,i,a.tpzmb_kmdm||dm20,a.tpzmb_kmmc||mc20,a.tpzmb_ywlb,round(ljgz20/ljsl20*sl20,2),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm20||mc20
         from tpzmb a where a.tpzmb_pzbh='000042' and a.tpzmb_kmdm='11023199';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,yfyj20,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm20||mc20
         from tpzmb a where a.tpzmb_pzbh='000042' and a.tpzmb_kmdm='220901';  
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je20-round(ljcb20/ljsl20*sl20,2)-round(ljgz20/ljsl20*sl20,2),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm20||mc20
         from tpzmb a where a.tpzmb_pzbh='000042' and a.tpzmb_kmdm='61110131';  
      i:=i+1;
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,0-round(ljgz20/ljsl20*sl20,2),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm20||mc20
         from tpzmb a where a.tpzmb_pzbh='000043' and a.tpzmb_kmdm='610101';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,round(ljgz20/ljsl20*sl20,2),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm20||mc20
         from tpzmb a where a.tpzmb_pzbh='000043' and a.tpzmb_kmdm='61110131';
     end if;
     i:=i+1;
     --���������tzqjc���е��������ɱ���ҵ�����Ϊ��������
     update tzqjc a set a.tzqjc_ljsl=a.tzqjc_ljsl-sl20,
            a.tzqjc_ljcb=a.tzqjc_ljcb-round(ljcb20/ljsl20*sl20,2),
            a.tzqjc_ljgz=a.tzqjc_ljgz-round(ljgz20/ljsl20*sl20,2) 
            where a.tzqjc_jyrq=rq and a.tzqjc_zqdm=dm20 and a.tzqjc_ywlb='����' and a.tzqjc_jysc=sc20;
     FETCH scgpmc INTO dm20,mc20,sc20,sl20,je20,js20,yh20,gh20,zg20,yfyj20,ljcb20,ljsl20,ljgz20;
  END LOOP;  
  CLOSE scgpmc;
  --�������¹���ͨ�仯�͹�Ʊ�����仯������ʹtzqjc���С��¹ɡ��������������ۼ�����Ϊ0��Ϊ0�����
  delete from tzqjc a where a.tzqjc_ljsl=0;
  --A�ɹ���
  open scmmgz(rq);
  fetch scmmgz into dm21,mc21,sc21,ljsl21,ljcb21,ljgz21,jrspj21;
  while scmmgz%found loop
    if sc21='�Ϻ�' then
       insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,jrspj21*ljsl21-ljcb21-ljgz21,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm21||mc21 
          from tpzmb a where a.tpzmb_pzbh='000058' and a.tpzmb_kmdm='610101';
       insert into tpzmx select rq,i,a.tpzmb_kmdm||dm21,a.tpzmb_kmmc||mc21,a.tpzmb_ywlb,jrspj21*ljsl21-ljcb21-ljgz21,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm21||mc21 
          from tpzmb a where a.tpzmb_pzbh='000058' and a.tpzmb_kmdm='11020199';
    elsif sc21='����' then
       insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,jrspj21*ljsl21-ljcb21-ljgz21,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm21||mc21 
          from tpzmb a where a.tpzmb_pzbh='000059' and a.tpzmb_kmdm='610101';
       insert into tpzmx select rq,i,a.tpzmb_kmdm||dm21,a.tpzmb_kmmc||mc21,a.tpzmb_ywlb,jrspj21*ljsl21-ljcb21-ljgz21,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm21||mc21 
          from tpzmb a where a.tpzmb_pzbh='000059' and a.tpzmb_kmdm='11023199';
    end if;
    i:=i+1;
    --��ֵ��ֵ������ٸ���tzqjc����ۼƹ���
    update tzqjc a set a.tzqjc_ljgz=jrspj21*ljsl21-ljcb21 where a.tzqjc_jyrq=rq and a.tzqjc_zqdm=dm21 and a.tzqjc_ywlb='����'  and a.tzqjc_jysc=sc21; 
    fetch scmmgz into dm21,mc21,sc21,ljsl21,ljcb21,ljgz21,jrspj21;
  end loop;
  close scmmgz; 
  
  --ծȯ��Ϣת��
  open sczqdxzc(rq);
  fetch sczqdxzc into  dm34,mc34,sc34,shlx34;
  while sczqdxzc%found loop
    if sc34='�Ϻ�' then
       insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,shlx34,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm34||mc34 
          from tpzmb a where a.tpzmb_pzbh='000071' and a.tpzmb_kmdm='30030101';
       insert into tpzmx select rq,i,a.tpzmb_kmdm||dm34,a.tpzmb_kmmc||mc34,a.tpzmb_ywlb,shlx34,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm34||mc34 
          from tpzmb a where a.tpzmb_pzbh='000071' and a.tpzmb_kmdm='12041013';
    elsif sc34='����' then
       insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,shlx34,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm34||mc34 
          from tpzmb a where a.tpzmb_pzbh='000072' and a.tpzmb_kmdm='30030201';
       insert into tpzmx select rq,i,a.tpzmb_kmdm||dm34,a.tpzmb_kmmc||mc34,a.tpzmb_ywlb,shlx34,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm34||mc34 
          from tpzmb a where a.tpzmb_pzbh='000072' and a.tpzmb_kmdm='12041031';   
    end if;
    i:=i+1;
    --ծȯ��Ϣת�����ٸ���tzqjc����ۼ���Ϣ
    /*update tzqjc a set a.tzqjc_ljlx=tzqjc_ljlx-shlx34
      where a.tzqjc_jyrq=rq and a.tzqjc_zqdm=dm34 and a.tzqjc_ywlb='ծȯ' and a.tzqjc_jysc=sc34; */
    fetch sczqdxzc into  dm34,mc34,sc34,shlx34;
  end loop;
  close sczqdxzc;
  --ծȯ��Ϣ����
  open sczqdxdz(rq);
  fetch sczqdxdz into dm35,mc35,sc35,shlx35,lxs35;
  while sczqdxdz%found loop
    if sc35='�Ϻ�' then
       insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,shlx35+lxs35,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm35||mc35 
          from tpzmb a where a.tpzmb_pzbh='000073' and a.tpzmb_kmdm='10020101';
       insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,shlx35,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm35||mc35 
          from tpzmb a where a.tpzmb_pzbh='000073' and a.tpzmb_kmdm='30030101';
       insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,lxs35,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm35||mc35 
          from tpzmb a where a.tpzmb_pzbh='000073' and a.tpzmb_kmdm='60110113';
    elsif sc35='����' then
       insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,shlx35+lxs35,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm35||mc35 
          from tpzmb a where a.tpzmb_pzbh='000074' and a.tpzmb_kmdm='10020101';
       insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,shlx35,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm35||mc35 
          from tpzmb a where a.tpzmb_pzbh='000074' and a.tpzmb_kmdm='30030201';
       insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,lxs35,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm35||mc35 
          from tpzmb a where a.tpzmb_pzbh='000074' and a.tpzmb_kmdm='60110131';
    end if;
    i:=i+1;
    fetch sczqdxdz into dm35,mc35,sc35,shlx35,lxs35;
  end loop;
  close sczqdxdz;
  
  --ծȯÿ�ռ�Ϣ
  open sczqjx(rq);
  fetch sczqjx into dm33,mc33,sc33,ljsl33,ljlx33,qxr33,nll33,lxsl33;
  while sczqjx%found loop
    if sc33='�Ϻ�' then
       insert into tpzmx select rq,i,a.tpzmb_kmdm||dm33,a.tpzmb_kmmc||mc33,a.tpzmb_ywlb,round(nll33/365*(rq-qxr33)*(1-lxsl33)*ljsl33-ljlx33,2),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm33||mc33 
          from tpzmb a where a.tpzmb_pzbh='000069' and a.tpzmb_kmdm='12041011';
       insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,round(nll33/365*(rq-qxr33)*(1-lxsl33)*ljsl33-ljlx33,2),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm33||mc33 
          from tpzmb a where a.tpzmb_pzbh='000069' and a.tpzmb_kmdm='60110111';
    elsif sc33='����' then
       insert into tpzmx select rq,i,a.tpzmb_kmdm||dm33,a.tpzmb_kmmc||mc33,a.tpzmb_ywlb,round(nll33/365*(rq-qxr33)*(1-lxsl33)*ljsl33-ljlx33,2),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm33||mc33 
          from tpzmb a where a.tpzmb_pzbh='000070' and a.tpzmb_kmdm='12041033';
       insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,round(nll33/365*(rq-qxr33)*(1-lxsl33)*ljsl33-ljlx33,2),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm33||mc33 
          from tpzmb a where a.tpzmb_pzbh='000070' and a.tpzmb_kmdm='60110133';
    end if;
    i:=i+1;
    --��ֵ��ֵ������ٸ���tzqjc����ۼ���Ϣ
    update tzqjc a set a.tzqjc_ljlx=tzqjc_ljlx+round(nll33/365*(rq-qxr33)*(1-lxsl33)*ljsl33-ljlx33,2) where a.tzqjc_jyrq=rq and a.tzqjc_zqdm=dm33 and a.tzqjc_ywlb='ծȯ'  and a.tzqjc_jysc=sc33; 
    fetch sczqjx into dm33,mc33,sc33,ljsl33,ljlx33,qxr33,nll33,lxsl33;
  end loop;
  close sczqjx;
  --ծȯ����
  open sczqmr(rq);
  FETCH sczqmr INTO dm30,mc30,sc30,je30,sl30,js30,yh30,gh30,zg30,yfyj30,sqlx30,shlx30,lxs30;
  WHILE sczqmr%FOUND LOOP
     if sc30='�Ϻ�'then
      insert into tpzmx select rq,i,a.tpzmb_kmdm||dm30,a.tpzmb_kmmc||mc30,a.tpzmb_ywlb,je30+lxs30,sl30,a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm30||mc30
         from tpzmb a where a.tpzmb_pzbh='000061' and a.tpzmb_kmdm='11031101';
      insert into tpzmx select rq,i,a.tpzmb_kmdm||dm30,a.tpzmb_kmmc||mc30,a.tpzmb_ywlb,shlx30,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm30||mc30
         from tpzmb a where a.tpzmb_pzbh='000061' and a.tpzmb_kmdm='12041011';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,js30+yh30+gh30+zg30,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm30||mc30
         from tpzmb a where a.tpzmb_pzbh='000061' and a.tpzmb_kmdm='64070102';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je30+lxs30+shlx30+js30+yh30+gh30+zg30,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm30||mc30
         from tpzmb a where a.tpzmb_pzbh='000061' and a.tpzmb_kmdm='30030101';  
     elsif sc30='����'then
      insert into tpzmx select rq,i,a.tpzmb_kmdm||dm30,a.tpzmb_kmmc||mc30,a.tpzmb_ywlb,je30+lxs30,sl30,a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm30||mc30
         from tpzmb a where a.tpzmb_pzbh='000062' and a.tpzmb_kmdm='11033301';
      insert into tpzmx select rq,i,a.tpzmb_kmdm||dm30,a.tpzmb_kmmc||mc30,a.tpzmb_ywlb,shlx30,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm30||mc30
         from tpzmb a where a.tpzmb_pzbh='000062' and a.tpzmb_kmdm='12041033';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,js30+yh30+gh30+zg30,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm30||mc30
         from tpzmb a where a.tpzmb_pzbh='000062' and a.tpzmb_kmdm='64070302';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je30+lxs30+shlx30+js30+yh30+gh30+zg30,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm30||mc30
         from tpzmb a where a.tpzmb_pzbh='000062' and a.tpzmb_kmdm='30030201';
     end if;
     i:=i+1;    
     --��������tzqjc���е��������ɱ���ҵ�����Ϊ��ծȯ��
     select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_zqdm=dm30 and a.tzqjc_ywlb='ծȯ' and a.tzqjc_jysc=sc30 ;
     if jlcount=0 then
       insert into tzqjc values(rq,dm30,mc30,sl30,je30+lxs30,0,shlx30,'ծȯ',sc30);
     else
       update tzqjc a set a.tzqjc_ljsl=a.tzqjc_ljsl+sl30,a.tzqjc_ljcb=a.tzqjc_ljcb+je30+lxs30,tzqjc_ljlx=tzqjc_ljlx+shlx30 where a.tzqjc_jyrq=rq and a.tzqjc_zqdm=dm30 and a.tzqjc_ywlb='ծȯ' and a.tzqjc_jysc=sc30;
     end if;
     FETCH sczqmr INTO dm30,mc30,sc30,je30,sl30,js30,yh30,gh30,zg30,yfyj30,sqlx30,shlx30,lxs30;
  END LOOP;
  CLOSE sczqmr; 
  --ծȯ����
  open sczqmc(rq);
  FETCH sczqmc INTO dm31,mc31,sc31,je31,sl31,js31,yh31,gh31,zg31,yfyj31,sqlx31,shlx31,lxs31,ljcb31,ljsl31,ljgz31,ljlx31;
  WHILE sczqmc%FOUND LOOP
     if sc31='�Ϻ�'then     
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je31+sqlx31-js31-yh31-gh31-zg31,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm31||mc31
         from tpzmb a where a.tpzmb_pzbh='000063' and a.tpzmb_kmdm='30030101';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,js31+yh31+gh31+zg31+yfyj31,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm31||mc31
         from tpzmb a where a.tpzmb_pzbh='000063' and a.tpzmb_kmdm='64070102';
      insert into tpzmx select rq,i,a.tpzmb_kmdm||dm31,a.tpzmb_kmmc||mc31,a.tpzmb_ywlb,round(ljcb31/ljsl31*sl31,2),sl31,a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm31||mc31
         from tpzmb a where a.tpzmb_pzbh='000063' and a.tpzmb_kmdm='11031101';
      insert into tpzmx select rq,i,a.tpzmb_kmdm||dm31,a.tpzmb_kmmc||mc31,a.tpzmb_ywlb,round(ljgz31/ljsl31*sl31,2),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm31||mc31
         from tpzmb a where a.tpzmb_pzbh='000063' and a.tpzmb_kmdm='11031199';
      insert into tpzmx select rq,i,a.tpzmb_kmdm||dm31,a.tpzmb_kmmc||mc31,a.tpzmb_ywlb,shlx31,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm31||mc31
         from tpzmb a where a.tpzmb_pzbh='000063' and a.tpzmb_kmdm='12041011';  
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je31+sqlx31-round(ljcb31/ljsl31*sl31,2)-round(ljgz31/ljsl31*sl31,2)-shlx31,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm31||mc31
         from tpzmb a where a.tpzmb_pzbh='000063' and a.tpzmb_kmdm='61110211';  
      i:=i+1;
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,0-round(ljgz31/ljsl31*sl31,2),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm31||mc31
         from tpzmb a where a.tpzmb_pzbh='000064' and a.tpzmb_kmdm='610102';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,round(ljgz31/ljsl31*sl31,2),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm31||mc31
         from tpzmb a where a.tpzmb_pzbh='000064' and a.tpzmb_kmdm='61110211';  
     elsif sc31='����'then
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je31+sqlx31-js31-yh31-gh31-zg31,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm31||mc31
         from tpzmb a where a.tpzmb_pzbh='000065' and a.tpzmb_kmdm='30030201';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,js31+yh31+gh31+zg31+yfyj31,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm31||mc31
         from tpzmb a where a.tpzmb_pzbh='000065' and a.tpzmb_kmdm='64070302';
      insert into tpzmx select rq,i,a.tpzmb_kmdm||dm31,a.tpzmb_kmmc||mc31,a.tpzmb_ywlb,round(ljcb31/ljsl31*sl31,2),sl31,a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm31||mc31
         from tpzmb a where a.tpzmb_pzbh='000065' and a.tpzmb_kmdm='11033301';
      insert into tpzmx select rq,i,a.tpzmb_kmdm||dm31,a.tpzmb_kmmc||mc31,a.tpzmb_ywlb,round(ljgz31/ljsl31*sl31,2),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm31||mc31
         from tpzmb a where a.tpzmb_pzbh='000065' and a.tpzmb_kmdm='11033399';
      insert into tpzmx select rq,i,a.tpzmb_kmdm||dm31,a.tpzmb_kmmc||mc31,a.tpzmb_ywlb,shlx31,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm31||mc31
         from tpzmb a where a.tpzmb_pzbh='000065' and a.tpzmb_kmdm='12041033';  
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,je31+sqlx31-round(ljcb31/ljsl31*sl31,2)-round(ljgz31/ljsl31*sl31,2)-shlx31,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm31||mc31
         from tpzmb a where a.tpzmb_pzbh='000065' and a.tpzmb_kmdm='61110233';  
      i:=i+1;
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,0-round(ljgz31/ljsl31*sl31,2),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm31||mc31
         from tpzmb a where a.tpzmb_pzbh='000066' and a.tpzmb_kmdm='610102';
      insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,round(ljgz31/ljsl31*sl31,2),'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm31||mc31
         from tpzmb a where a.tpzmb_pzbh='000066' and a.tpzmb_kmdm='61110233';     
     end if;
     i:=i+1;
     --���������tzqjc���е��������ɱ���ҵ�����Ϊ��ծȯ��
     update tzqjc a set a.tzqjc_ljsl=a.tzqjc_ljsl-sl31,
            a.tzqjc_ljcb=a.tzqjc_ljcb-round(ljcb31/ljsl31*sl31,2),
            a.tzqjc_ljgz=a.tzqjc_ljgz-round(ljgz31/ljsl31*sl31,2),
            a.tzqjc_ljlx=a.tzqjc_ljlx-shlx31 
            where a.tzqjc_jyrq=rq and a.tzqjc_zqdm=dm31 and a.tzqjc_ywlb='ծȯ' and a.tzqjc_jysc=sc31;
     FETCH sczqmc INTO dm31,mc31,sc31,je31,sl31,js31,yh31,gh31,zg31,yfyj31,sqlx31,shlx31,lxs31,ljcb31,ljsl31,ljgz31,ljlx31;
  END LOOP;  
  CLOSE sczqmc;
  --������ծȯ�����仯������ʹtzqjc���е��ۼ�����Ϊ0��Ϊ0�����
  delete from tzqjc a where a.tzqjc_ljsl=0;
  --ծȯ����
  open sczqgz(rq);
  fetch sczqgz into dm32,mc32,sc32,ljsl32,ljcb32,ljgz32,jrspj32;
  while sczqgz%found loop
    if sc32='�Ϻ�' then
       insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,jrspj32*ljsl32-ljcb32-ljgz32,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm32||mc32 
          from tpzmb a where a.tpzmb_pzbh='000067' and a.tpzmb_kmdm='610102';
       insert into tpzmx select rq,i,a.tpzmb_kmdm||dm32,a.tpzmb_kmmc||mc32,a.tpzmb_ywlb,jrspj32*ljsl32-ljcb32-ljgz32,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm32||mc32 
          from tpzmb a where a.tpzmb_pzbh='000067' and a.tpzmb_kmdm='11031199';
    elsif sc32='����' then
       insert into tpzmx select rq,i,a.tpzmb_kmdm,a.tpzmb_kmmc,a.tpzmb_ywlb,jrspj32*ljsl32-ljcb32-ljgz32,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm32||mc32 
          from tpzmb a where a.tpzmb_pzbh='000068' and a.tpzmb_kmdm='610102';
       insert into tpzmx select rq,i,a.tpzmb_kmdm||dm32,a.tpzmb_kmmc||mc32,a.tpzmb_ywlb,jrspj32*ljsl32-ljcb32-ljgz32,'',a.tpzmb_jdfx,to_char(rq,'[yyyy/mm/dd]')||a.tpzmb_ywlb||dm32||mc32 
          from tpzmb a where a.tpzmb_pzbh='000068' and a.tpzmb_kmdm='11033399';  
    end if;
    i:=i+1;
    --��ֵ��ֵ������ٸ���tzqjc����ۼƹ���
    update tzqjc a set a.tzqjc_ljgz=jrspj32*ljsl32-ljcb32 
      where a.tzqjc_jyrq=rq and a.tzqjc_zqdm=dm32 and a.tzqjc_ywlb='ծȯ'  and a.tzqjc_jysc=sc32; 
    fetch sczqgz into dm32,mc32,sc32,ljsl32,ljcb32,ljgz32,jrspj32;
  end loop;
  close sczqgz;
  
  
  
  delete from tpzmx a where a.tpzmx_je=0;
 commit; 
end scpz;
/
