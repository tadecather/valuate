/*�����û���*/
create table tyh
(
  yh_bh varchar2(10) not null primary key ,
  yh_mc VARCHAR2(20) not null��
  yh_mm VARCHAR2(20) not null
);
comment on table tyh is '�û���';
comment on column tyh.yh_bh is '�û����';
comment on column tyh.yh_mc is '�û�����';
comment on column tyh.yh_mm is '�û�����';

/*����������Ϣ��*/
/*
create table tztxx
(
  tztxx_ztbh number(10) not null primary key,
  tztxx_jjdm VARCHAR2(20) not null,
  tztxx_ztmc VARCHAR2(30) not null,
  tztxx_clrq DATE not null,
);
comment on table tztxx is '������Ϣ��';
comment on column tztxx.tztxx_ztbh is '���ױ��';
comment on column tztxx.tztxx_jjdm is '�������';
comment on column tztxx.tztxx_ztmc is '��������';
comment on column tztxx.tztxx_clrq is '��������';
*/


/*����֤ȯ��Ϣ��*/
create table tzqxx
(
  tzqxx_zqdm Varchar(10) not null primary key,
  tzqxx_jysc VARCHAR2(10) not null,
  tzqxx_zqlb VARCHAR2(6) not null,
  tzqxx_zqmc VARCHAR2(30) not null,
  tzqxx_zgb number(12,2) ,
  tzqxx_mgmz number(12,4) ,
  tzqxx_fxrq DATE not null,
  tzqxx_qxr DATE ,
  tzqxx_nll number(12,6),
  tzqxx_lxs number(12,6),
  tzqxx_fxfs VARCHAR2(20),
  tzqxx_hgts number(4)
);
comment on table tzqxx is '֤ȯ��Ϣ��';
comment on column tzqxx.tzqxx_zqdm is '֤ȯ����';
comment on column tzqxx.tzqxx_jysc is '�����г�';
comment on column tzqxx.tzqxx_zqlb is '֤ȯ���';
comment on column tzqxx.tzqxx_zqmc is '֤ȯ����';
comment on column tzqxx.tzqxx_zgb is '�ܹɱ�';
comment on column tzqxx.tzqxx_mgmz is 'ÿ����ֵ';
comment on column tzqxx.tzqxx_fxrq is '��������';
comment on column tzqxx.tzqxx_qxr is '��Ϣ��';
comment on column tzqxx.tzqxx_nll is '������';
comment on column tzqxx.tzqxx_lxs is '��Ϣ˰';
comment on column tzqxx.tzqxx_fxfs is '��Ϣ��ʽ';
comment on column tzqxx.tzqxx_hgts is '�ع�����';



/*�����г���Ϣ��*/
/*
create table tscxx
(
  tscxx_scdm number(4) not null primary key,
  tscxx_scmc VARCHAR2(30) not null,
);
comment on table tscxx is '�г���Ϣ��';
comment on column tscxx.tscxx_scdm is '�г�����';
comment on column tscxx.tscxx_scmc is '�г�����';
*/


/*�������׷��ʱ�*/
create table tjyfl
(
  --tjyfl_ztbh number(10) not null primary key(tjyfl_ztbh,tscxx_jysc,tscxx_ywlb),
  tjyfl_jysc VARCHAR2(10) not null ,
  tjyfl_ywlb VARCHAR2(10) not null,
  tjyfl_yhs number(12,8) ,
  tjyfl_jsf number(12,8) ,
  tjyfl_ghf number(12,8) ,
  tjyfl_zgf number(12,8) ,
  tjyfl_yj number(12,8) ��
  primary key(tjyfl_jysc,tjyfl_ywlb)
);
comment on table tjyfl is '���׷��ʱ�';
--comment on column tjyfl.tjyfl_ztbh is '���ױ��';
comment on column tjyfl.tjyfl_jysc is '�����г�';
comment on column tjyfl.tjyfl_ywlb is 'ҵ�����';
comment on column tjyfl.tjyfl_yhs is 'ӡ��˰';
comment on column tjyfl.tjyfl_jsf is '���ַ�';
comment on column tjyfl.tjyfl_ghf is '������';
comment on column tjyfl.tjyfl_zgf is '֤�ܷ�';
comment on column tjyfl.tjyfl_yj is 'Ӷ��';


/*�����������ѱ�*/
create table tstlf
(
  --tstlf_ztbh number(10) not null primary key(tstlf_ztbh,tstlf_fylx),
  tstlf_fylx VARCHAR2(10) not null primary key ,
  tstlf_ksrq DATE not null,
  tstlf_jsrq DATE not null,
  tstlf_jtbl number(10,8) ,
  tstlf_fyze number(10,8),
  tstlf_jtcs number(10) not null
);
comment on table tstlf is '�������ѱ�';
--comment on column tstlf.tstlf_ztbh is '���ױ��';
comment on column tstlf.tstlf_fylx is '��������';
comment on column tstlf.tstlf_ksrq is '��ʼ����';
comment on column tstlf.tstlf_jsrq is '��������';
comment on column tstlf.tstlf_jtbl is '�������';
comment on column tstlf.tstlf_fyze is '�����ܶ�';
comment on column tstlf.tstlf_jtcs is '�������';


/*��������·����*/
create table tjslj
(
  --tjsj_ztbh number(10) not null ,
  tjslj_jkmc VARCHAR2(30) not null,
  tjslj_jkbh VARCHAR2(8) not null primary key,
  tjslj_wjlj VARCHAR2(200),
  tjslj_wjmc VARCHAR2(50)
);
comment on table tjslj is '����·����';
--comment on column tjslj.tjslj_ztbh is '���ױ��';
comment on column tjslj.tjslj_jkmc is '�ӿ�����';
comment on column tjslj.tjslj_jkbh is '�ӿڱ��';
comment on column tjslj.tjslj_wjlj is '�ļ�·��';
comment on column tjslj.tjslj_wjmc is '�ļ�����';


/*������ƿ�Ŀ��*/
create table tkjkm
(
  tkjkm_kmdm VARCHAR2(30) not null primary key,
  tkjkm_kmmc VARCHAR2(60) not null,
  tkjkm_jdfx VARCHAR2(2) not null
);
comment on table tkjkm is '��ƿ�Ŀ��';
comment on column tkjkm.tkjkm_kmdm is '��Ŀ����';
comment on column tkjkm.tkjkm_kmmc is '��Ŀ����';
comment on column tkjkm.tkjkm_jdfx is '�������';


/*����ƾ֤ģ���*/
create table tpzmb
(
  tpzmb_pzbh Varchar(10) not null ,
  tpzmb_kmdm VARCHAR2(30) not null,
  tpzmb_kmmc VARCHAR2(60) not null,
  tpzmb_ywzy VARCHAR2(90) not null,
  primary key(tpzmb_pzbh,tpzmb_kmdm)
);
comment on table tpzmb is 'ƾ֤ģ���';
comment on column tpzmb.tpzmb_pzbh is 'ƾ֤���';
comment on column tpzmb.tpzmb_kmdm is '��Ŀ����';
comment on column tpzmb.tpzmb_kmmc is '��Ŀ����';
comment on column tpzmb.tpzmb_ywzy is 'ҵ��ժҪ';



/*������ƿ�Ŀ����*/
create table tkjkmye
(
  tkjkmye_ywrq DATE not null ,
  tkjkmye_kmdm VARCHAR2(30) not null,
  tkjkmye_kmmc VARCHAR2(60) not null,
  tkjkmye_jdfx VARCHAR2(2) not null,
  tkjkmye_jffsje number(16,2) ,
  tkjkmye_dffsje number(16,2) ,
  tkjkmye_ye number(16,2),
  primary key(tkjkmye_ywrq,tkjkmye_kmdm)
);
comment on table tkjkmye is '��ƿ�Ŀ����';
comment on column tkjkmye.tkjkmye_ywrq is 'ҵ������';
comment on column tkjkmye.tkjkmye_kmdm is '��Ŀ����';
comment on column tkjkmye.tkjkmye_kmmc is '��Ŀ����';
comment on column tkjkmye.tkjkmye_jdfx is '�������';
comment on column tkjkmye.tkjkmye_jffsje is '�跽�������';
comment on column tkjkmye.tkjkmye_dffsje is '�����������';
comment on column tkjkmye.tkjkmye_ye is '���';


/*���������*/
create table thq                        
(
  thq_hqrq DATE not null,
  thq_zqdm VARCHAR2(10) not null,
  thq_jrspj number(16,4) ,
  thq_zqmc VARCHAR2(30) not null,
   primary key(thq_hqrq,thq_zqdm)
);
comment on table thq is '�����';
comment on column thq.thq_hqrq is '��������';
comment on column thq.thq_zqdm is '֤ȯ����';
comment on column thq.thq_jrspj is '�������̼�';
comment on column thq.thq_zqmc is '֤ȯ����';


/*������Ʊ���ױ�*/
create table tgpjy                        
(
  tgpjy_zqdm VARCHAR2(10) not null,
  tgpjy_zqmc VARCHAR2(30) not null,
  tgpjy_jyrq DATE not null,
  tgpjy_jyfx VARCHAR2(4) not null,
  tgpjy_jysc VARCHAR2(10) not null,
  tgpjy_cjjg number(16,4) not null,
  tgpjy_cjje number(16,2) not null,
  tgpjy_cjsl number(12) not null,
  tgpjy_jsf number(12,2) ,
  tgpjy_yhs number(12,2) ,
  tgpjy_ghf number(12,2) ,
  tgpjy_zgf number(12,2) ,
  tgpjy_yongjin number(12,2)
  --primary key(tgpjy_zqdm,tgpjy_jyrq,tgpjy_jyfx)   --��ʱ���ǲ�������
);
comment on table tgpjy is '��Ʊ���ױ�';
comment on column tgpjy.tgpjy_zqdm is '֤ȯ����';
comment on column tgpjy.tgpjy_zqmc is '֤ȯ����';
comment on column tgpjy.tgpjy_jyrq is '��������';
comment on column tgpjy.tgpjy_jyfx is '���׷���';
comment on column tgpjy.tgpjy_jysc is '�����г�';
comment on column tgpjy.tgpjy_cjjg is '�ɽ��۸�';
comment on column tgpjy.tgpjy_cjje is '�ɽ����';
comment on column tgpjy.tgpjy_cjsl is '�ɽ�����';
comment on column tgpjy.tgpjy_jsf is '���ַ�';
comment on column tgpjy.tgpjy_yhs is 'ӡ��˰';
comment on column tgpjy.tgpjy_ghf is '������';
comment on column tgpjy.tgpjy_zgf is '���ܷ�';
comment on column tgpjy.tgpjy_yongjin is 'Ӷ��';


/*����ծȯ���ױ�*/
create table tzqjy                        
(
  tzqjy_zqdm VARCHAR2(10) not null,
  tzqjy_zqmc VARCHAR2(30) not null,        
  tzqjy_jyrq DATE not null,
  tzqjy_jyfx VARCHAR2(4) not null,
  tzqjy_jysc VARCHAR2(10) not null,
  tzqjy_cjjg number(16,4) not null, -- ��Ϣ����Ҫ�ֶΣ���Ϊ��
  tzqjy_cjje number(16,2) not null, -- ��Ϣ����Ҫ�ֶΣ���Ϊ��
  tzqjy_cjsl number(12) not null,   -- ��Ϣ����Ҫ�ֶΣ���Ϊ��
  tzqjy_jsf number(12,2) ,
  tzqjy_yhs number(12,2) ,
  tzqjy_ghf number(12,2) ,
  tzqjy_zgf number(12,2) ,
  tzqjy_yongjin number(12,2),
  tzqjy_sqlx number(12,6) ,     -- �洢 ��Ϣ���
  tzqjy_shlx number(12,6),
  tzqjy_lxs number(12,6)
  --primary key(tzqjy_zqdm,tzqjy_jyrq,tzqjy_jyfx)      --��ʱ���ǲ�������
);
comment on table tzqjy is 'ծȯ���ױ�';
comment on column tzqjy.tzqjy_zqdm is '֤ȯ����';
comment on column tzqjy.tzqjy_zqmc is 'ծȯ����';      --������ֶ�
comment on column tzqjy.tzqjy_jyrq is '��������';
comment on column tzqjy.tzqjy_jyfx is '���׷���';
comment on column tzqjy.tzqjy_jysc is '�����г�';
comment on column tzqjy.tzqjy_cjjg is '�ɽ��۸�';
comment on column tzqjy.tzqjy_cjje is '�ɽ����';
comment on column tzqjy.tzqjy_cjsl is '�ɽ�����';
comment on column tzqjy.tzqjy_jsf is '���ַ�';
comment on column tzqjy.tzqjy_yhs is 'ӡ��˰';
comment on column tzqjy.tzqjy_ghf is '������';
comment on column tzqjy.tzqjy_zgf is '֤�ܷ�';
comment on column tzqjy.tzqjy_yongjin is 'Ӷ��';
comment on column tzqjy.tzqjy_sqlx is '˰ǰ��Ϣ';
comment on column tzqjy.tzqjy_shlx is '˰����Ϣ';
comment on column tzqjy.tzqjy_lxs is '��Ϣ˰';


/*�����ع����ױ�*/
create table thgjy                        
(
  thgjy_zqdm VARCHAR2(10) not null,
  thgjy_hgmc VARCHAR2(30) not null,
  thgjy_hgts number(4) not null,
  thgjy_cjrq DATE not null,
  thgjy_dqrq DATE not null,
  thgjy_hgfx VARCHAR2(6) not null,
  thgjy_jysc VARCHAR2(10) not null,
  thgjy_cjje number(16,2) not null,
  thgjy_fkje number(16,2) not null
);
comment on table thgjy is '�ع����ױ�';
comment on column thgjy.thgjy_zqdm is '֤ȯ����';
comment on column thgjy.thgjy_hgmc is '�ع�����';
comment on column thgjy.thgjy_hgts is '�ع�����';
comment on column thgjy.thgjy_cjrq is '�ɽ�����';
comment on column thgjy.thgjy_dqrq is '��������';
comment on column thgjy.thgjy_hgfx is '�ع�����';
comment on column thgjy.thgjy_jysc is '�����г�';
comment on column thgjy.thgjy_cjje is '�ɽ����';
comment on column thgjy.thgjy_fkje is '������';
--comment on column thgjy.thgjy_qssd is '�����ٶ�';


/*����ƾ֤��ϸ��*/
create table tpzmx                        
(
  tpzmx_pzrq DATE not null ,
  tpzmx_pzbh Varchar2(10) not null  ,
  tpzmx_kmdm VARCHAR2(30) not null ,
  tpzmx_kmmc VARCHAR2(60) not null ,
  tpzmx_ywzy VARCHAR2(90) not null ,
  tpzmx_jdfx VARCHAR2(4) not null ,
  tpzmx_je Number(16,2) not null ,
  tpzmx_sl Number(12) not null ,
  tpzmx_zdr varchar2(20) not null,
  primary key(tpzmx_pzbh,tpzmx_kmdm)
);
comment on table tpzmx is 'ƾ֤��ϸ��';
comment on column tpzmx.tpzmx_pzrq is 'ƾ֤����';
comment on column tpzmx.tpzmx_pzbh is 'ƾ֤���';
comment on column tpzmx.tpzmx_kmdm is '��Ŀ����';
comment on column tpzmx.tpzmx_kmmc is '��Ŀ����';
comment on column tpzmx.tpzmx_ywzy is 'ҵ��ժҪ';
comment on column tpzmx.tpzmx_jdfx is '�������';
comment on column tpzmx.tpzmx_je is '���';
comment on column tpzmx.tpzmx_sl is '����';
comment on column tpzmx.tpzmx_zdr is '�Ƶ���';


/*������ֵ��*/
create table tgz                        
(
  tgz_ywrq DATE not null ,
  tgz_kmdm Varchar2(30) not null,
  tgz_kmmc Varchar2(100) not null,
  tgz_sl Number(12) ,
  tgz_dwcb Number(16,4) ,
  tgz_zcb Number(16,2) ,
  tgz_cbzjz Number(7,6) ,
  tgz_sj Number(16,4) ,
  tgz_zsz Number(16,2) ,
  tgz_szzjz Number(7,6) ,
  tgz_gzzz Number(12,2) ,
  primary key(tgz_ywrq,tgz_kmdm) 
);
comment on table tgz is '��ֵ��';
comment on column tgz.tgz_ywrq is 'ҵ������';
comment on column tgz.tgz_kmdm is '��Ŀ����';
comment on column tgz.tgz_kmmc is '��Ŀ����';
comment on column tgz.tgz_sl is '����';
comment on column tgz.tgz_dwcb is '��λ�ɱ�';
comment on column tgz.tgz_zcb is '�ܳɱ�';
comment on column tgz.tgz_cbzjz is '�ɱ�ռ��ֵ';
comment on column tgz.tgz_sj is '�м�';
comment on column tgz.tgz_zsz is '����ֵ';
comment on column tgz.tgz_szzjz is '��ֵռ��ֵ';
comment on column tgz.tgz_gzzz is '��ֵ��ֵ';


/*����֤ȯ����*/
create table tzqjc                        
(
  tzqjc_jyrq DATE not null ,
  tzqjc_zqdm Varchar2(10) not null,
  tzqjc_zqmc Varchar2(30),               --������ֶ�
  tzqjc_ljsl Number(12) ,
  tzqjc_ljcb Number(16,8) ,
  tzqjc_ljgz Number(16,8) ,
  tzqjc_ljlx Number(16,8) ,
  tzqjc_ywlb Varchar2(6),                --������ֶ�
  tzqjc_jysc Varchar2(6),                --������ֶ�
  primary key(tzqjc_jyrq,tzqjc_zqdm) 
);
comment on table tzqjc is '֤ȯ����';
comment on column tzqjc.tzqjc_jyrq is '��������';
comment on column tzqjc.tzqjc_zqdm is '֤ȯ����';
comment on column tzqjc.tzqjc_zqmc is '֤ȯ����';
comment on column tzqjc.tzqjc_ljsl is '�ۼ�����';
comment on column tzqjc.tzqjc_ljcb is '�ۼƳɱ�';
comment on column tzqjc.tzqjc_ljgz is '�ۼƹ���';
comment on column tzqjc.tzqjc_ljlx is '�ۼ���Ϣ';
comment on column tzqjc.tzqjc_ywlb is 'ҵ�����';
comment on column tzqjc.tzqjc_jysc is '�����г�';

/*�����¹ɱ�*/
create table txg                        
(
  txg_zqdm Varchar2(10) not null ,
  txg_jysc Varchar2(10) not null,
  txg_ywlb Varchar2(10) not null,
  txg_cjjg Number(16,4) not null ,
  txg_cjje Number(16,2) not null ,
  txg_cjsl Number(12) not null ,
  txg_ywrq DATE not null,
  txg_zqmc Varchar2(30) not null
  --primary key(txg_zqdm,txg_ywlb,txg_ywrq) 
);
comment on table txg is '�����¹ɱ�';
comment on column txg.txg_zqdm is '֤ȯ����';--
comment on column txg.txg_jysc is '�����г�';
comment on column txg.txg_ywlb is 'ҵ�����'; -- �ĸ����¹���ǩ���¹ɽɿ�¹ɽ��գ��¹���ͨ
comment on column txg.txg_cjjg is '�ɽ��۸�';
comment on column txg.txg_cjje is '�ɽ����';
comment on column txg.txg_cjsl is '�ɽ�����';
comment on column txg.txg_ywrq is 'ҵ������';
comment on column txg.txg_zqmc is '֤ȯ����';


/*����������*/
create table thl                        
(
  thl_ywrq DATE not null ,
  thl_dzrq DATE,
  thl_ywlb Varchar2(10) not null,
  thl_jysc Varchar2(10) not null,
  thl_zqdm Varchar2(10) not null,
  thl_zqmc Varchar2(30) not null,
  thl_djsl Number(12) ,
  thl_fhje Number(16,4),
  thl_qybl Number(9,6) 
  --primary key(thl_zqdm,thl_ywlb,thl_jsrq)
);
comment on table thl is '���ܺ�����';
comment on column thl.thl_ywrq is 'ҵ������';
comment on column thl.thl_dzrq is '��������';
comment on column thl.thl_ywlb is 'ҵ�����'; --���࣬�ֺ칫�� �������� ������Ȩ         
comment on column thl.thl_jysc is '�����г�';      
comment on column thl.thl_zqdm is '֤ȯ����';
comment on column thl.thl_zqmc is '֤ȯ����';
comment on column thl.thl_djsl is '�Ǽ�����';
comment on column thl.thl_fhje is '�ֺ���';   -- �洢�ֺ���
comment on column thl.thl_qybl is 'Ȩ�����';


/*ԭʼ�ӿڱ� ͳһ����d_ywrq�ֶ�

��������Ϣ
tjk_cpxx���Ϻ�֤ȯ��Ϣ�ӿڱ�        --cpxx.txt
tjk_security������֤ȯ��Ϣ�ӿڱ�        --security
������Ϣ
tjk_mktdt00���Ϻ�����ӿڱ�              --mktdt00
tjk_ cashsecurityclosed����������ӿڱ�     --cashsecurityclosed
������Ϣ
tjk_gh���Ϻ����׽ӿڱ�
tjk_sjsmx1�����ڽ��׽ӿڱ�
������Ϣ
tjk_jsmx���Ϻ�������ϸ��         --�����Ϻ��¹���ǩ����ǩ���ա���������
tjk_zqbd���Ϻ�֤ȯ��             --�����¹���ͨ���Ϻ���Ʊ�ֺ�
tjk_sjsfx������������б�       --�����¹���ǩ����ǩ����
tjk_sjsjg����������           --�����¹���ͨ�����ڷֺ졢��������

*/

/*�Ϻ�֤ȯ��������Ϣԭʼ�ӿڱ�cpxx*/
create table tjk_shzqxx
(
  tjk_shzqxx_zqdm Varchar2(10) not null,
  tjk_shzqxx_zqlb Varchar2(6) not null,
  tjk_shzqxx_zqmc Varchar2(30) not null,
  tjk_shzqxx_zgb number(16) not null,
  tjk_shzqxx_mgmz number(12��8) not null,
  tjk_shzqxx_fxrq DATE not null,
  d_ywrq DATE not null
);
comment on table tjk_shzqxx is 'cpxxԭʼ�ӿڱ�';
comment on column tjk_shzqxx.tjk_shzqxx_zqdm is '֤ȯ����'; -- ��һ��
comment on column tjk_shzqxx.tjk_shzqxx_zqlb is '֤ȯ���'; -- �ڰ��� ES ��Ʊ EU���� Dծȯ RWSȨ֤ FF�ڻ�
comment on column tjk_shzqxx.tjk_shzqxx_zqmc is '֤ȯ����'; -- ������
comment on column tjk_shzqxx.tjk_shzqxx_zgb is '�ܹɱ�';    
comment on column tjk_shzqxx.tjk_shzqxx_mgmz is 'ÿ����ֵ'; -- ��ʮһ��
comment on column tjk_shzqxx.tjk_shzqxx_fxrq is '��������'; -- ��ʮ����
comment on column tjk_shzqxx.d_ywrq is 'ҵ������';

/*����֤ȯ��������Ϣԭʼ�ӿڱ�securities*/
create table tjk_szzqxx
(
  tjk_szzqxx_zqdm Varchar2(10) not null,
  --TODO 6 -> 20
  tjk_szzqxx_zqlb Varchar2(6) not null,
  tjk_szzqxx_zqmc Varchar2(30) not null,
  tjk_szzqxx_zgb number(16) not null,
  tjk_szzqxx_mgmz number(12��8) not null,
  tjk_szzqxx_fxrq DATE not null,
  d_ywrq DATE not null
);
comment on table tjk_szzqxx is 'securitiesԭʼ�ӿڱ�';
comment on column tjk_szzqxx.tjk_szzqxx_zqdm is '֤ȯ����'; --SecurityID
comment on column tjk_szzqxx.tjk_szzqxx_zqlb is '֤ȯ���'; --SecurityType
{1,2,3,4 ��Ʊ�� 5,6,7,8,9,10,11 ծȯ��14,15,16,17,19,20,23,24,25,26 ����28 Ȩ֤�� 12 ��Ѻʽ�ع���}
comment on column tjk_szzqxx.tjk_szzqxx_zqmc is '֤ȯ����';--symbol
comment on column tjk_szzqxx.tjk_szzqxx_zgb is '�ܹɱ�';
comment on column tjk_szzqxx.tjk_szzqxx_mgmz is 'ÿ����ֵ';--ParValue
comment on column tjk_szzqxx.tjk_szzqxx_fxrq is '��������';--ListDate
comment on column tjk_szzqxx.d_ywrq is 'ҵ������';


/*���ԭʼ�ӿڱ�sjsmx1*/--4��12, 14, 33,34,���ݳɽ���������жϣ����뵱ǰ����
create table tjk_sjsmx1
(
  tjk_sjsmx1_ZQDM Varchar2(10) not null,
  tjk_sjsmx1_CJSL number(12) not null,
  tjk_sjsmx1_CJJG number(12,4) not null,
  tjk_sjsmx1_CJJE number(12,2) not null,
  tjk_sjsmx1_CJRQ DATE not null,
  tjk_sjsmx1_JYFX Varchar2(6) not null,
  d_ywrq DATE not null
);
comment on table tjk_sjsmx1 is 'sjsmx1ԭʼ�ӿڱ�';
comment on column tjk_sjsmx1.tjk_sjsmx1_ZQDM is '֤ȯ����';
comment on column tjk_sjsmx1.tjk_sjsmx1_CJSL is '�ɽ�����';
comment on column tjk_sjsmx1.tjk_sjsmx1_CJJG is '�ɽ��۸�';
comment on column tjk_sjsmx1.tjk_sjsmx1_CJJE is '�ɽ����';
--comment on column tjk_sjsmx1.MXYHS is 'ӡ��˰';
--comment on column tjk_sjsmx1.MXJYJSF is '���ַ�';
--comment on column tjk_sjsmx1.MXJGGF is '֤�ܷ�';
--comment on column tjk_sjsmx1.MXGHF is '������';
--comment on column tjk_sjsmx1.MXSFJE is 'ʵ�����';
comment on column tjk_sjsmx1.tjk_sjsmx1_CJRQ is '�ɽ�����';
--comment on column tjk_sjsmx1.tjk_sjsmx1_QSRQ is '��������';
comment on column tjk_sjsmx1.tjk_sjsmx1_JYFX is '���׷���';
comment on column tjk_sjsmx1.d_ywrq is 'ҵ������';


/*�Ͻ���ԭʼ�ӿڱ�gh*/
create table tjk_gh
(
  tjk_gh_zqdm Varchar2(10) not null ,
  tjk_gh_cjsl number(12) not null ,
  tjk_gh_cjjg number(12,4) not null ,
  tjk_gh_cjje number(12,2) not null ,
  tjk_gh_jyfx Varchar2(6) not null ,
  tjk_gh_cjrq DATE not null,
  d_ywrq DATE not null 
);
comment on table tjk_gh is 'GHԭʼ�ӿڱ�';
comment on column tjk_gh.tjk_gh_zqdm is '֤ȯ����'; -- H 8
comment on column tjk_gh.tjk_gh_cjsl is '�ɽ�����'; -- F 6
comment on column tjk_gh.tjk_gh_cjjg is '�ɽ��۸�'; -- K 11
comment on column tjk_gh.tjk_gh_cjje is '�ɽ����'; -- L 12
comment on column tjk_gh.tjk_gh_jyfx is '���׷���'; -- N 14
comment on column tjk_gh.tjk_gh_cjrq is '�ɽ�����'; -- C 3
comment on column tjk_gh.d_ywrq is 'ҵ������';


/*�Ͻ��������ļ�ԭʼ�ӿڱ�mktdt00*/
create table tjk_mktdt00
(
  tjk_mktdt00_ZQDM Varchar2(10) not null,
  --tjk_mktdt00_ZQMC Varchar2(30) not null,         --������
  tjk_mktdt00_CLOSEPX number(16,4) not null,
  d_ywrq DATE not null
);
comment on table tjk_mktdt00 is 'MKTDT00ԭʼ�ӿڱ�';
comment on column tjk_mktdt00.tjk_mktdt00_ZQDM is '֤ȯ����';
--comment on column tjk_mktdt00.tjk_mktdt00_ZQMC is '֤ȯ����';
comment on column tjk_mktdt00.tjk_mktdt00_CLOSEPX is '�������̼�';
comment on column tjk_mktdt00.d_ywrq is 'ҵ������';


/*��������ļ�ԭʼ�ӿڱ�cashsecurityclosemd*/
create table tjk_cashsecurity
(
  tjk_cashsecurity_ZQDM Varchar2(10) not null,
  --tjk_cashsecurity_ZQMC Varchar2(30) not null,          --<Symbol>
  tjk_cashsecurity_CLOSEPX number(16,4) not null,
  d_ywrq DATE not null
);
comment on table tjk_cashsecurity is 'cashsecurityclosemdԭʼ�ӿڱ�';
comment on column tjk_cashsecurity.tjk_cashsecurity_ZQDM is '֤ȯ����';
--comment on column tjk_cashsecurity.tjk_cashsecurity_ZQMC is '֤ȯ����';
comment on column tjk_cashsecurity.tjk_cashsecurity_CLOSEPX is '�������̼�';
comment on column tjk_cashsecurity.d_ywrq is 'ҵ������';


/*�Ϻ�������ϸ�ļ�ԭʼ�ӿڱ�tjk_jsmx*/
create table tjk_jsmx
(
  tjk_jsmx_JLLX Varchar2(4) not null,
  tjk_jsmx_JYRQ DATE not null,
  tjk_jsmx_ZQDM Varchar2(10) not null,
  tjk_jsmx_CJSL number(12),
  tjk_jsmx_CJJG number(16,4),
  tjk_jsmx_CJJE number(16,2),
  tjk_jsmx_ZQLB Varchar2(4) not null,
  d_ywrq DATE not null
);
comment on table tjk_jsmx is 'JSMXԭʼ�ӿڱ�';
comment on column tjk_jsmx.tjk_jsmx_JLLX is '��¼����'; --2  
--��001���� ������ϸ��¼
--��002���� �ǵ�������ҵ��Ľ���֪ͨ��¼
--��003���� �ǵ�������ҵ��Ľ��ս����¼
--��990�� ����
comment on column tjk_jsmx.tjk_jsmx_JYRQ is '��������'; --12
comment on column tjk_jsmx.tjk_jsmx_ZQDM is '֤ȯ����'; --25
comment on column tjk_jsmx.tjk_jsmx_CJSL is '�ɽ�����'; --32
comment on column tjk_jsmx.tjk_jsmx_CJJG is '�ɽ��۸�'; --35
comment on column tjk_jsmx.tjk_jsmx_CJJE is '�ɽ����'; --37
comment on column tjk_jsmx.tjk_jsmx_ZQLB is '֤ȯ���'; --26
comment on column tjk_jsmx.d_ywrq is 'ҵ������';


/*�Ϻ�֤ȯ�䶯�ļ�ԭʼ�ӿڱ�tjk_zqbd*/
create table tjk_zqbd
(
  tjk_zqbd_ZQDM Varchar2(10) not null,
  tjk_zqbd_ZQLB Varchar2(4) not null,
  tjk_zqbd_BDSL number(12) not null��
  tjk_zqbd_BDLX Varchar2(6) not null,
  tjk_zqbd_BDRQ DATE not null,
  d_ywrq DATE not null
);
comment on table tjk_zqbd is 'ZQBDԭʼ�ӿڱ�';
comment on column tjk_zqbd.tjk_zqbd_ZQDM is '֤ȯ����'; --5
comment on column tjk_zqbd.tjk_zqbd_ZQLB is '֤ȯ���'; --6
comment on column tjk_zqbd.tjk_zqbd_BDSL is '�䶯����'; --10
comment on column tjk_zqbd.tjk_zqbd_BDLX is '�䶯����'; --11
comment on column tjk_zqbd.tjk_zqbd_BDRQ is '�䶯����'; --12
comment on column tjk_zqbd.d_ywrq is 'ҵ������';


/*������б�tjk_sjsfx*/
create table tjk_sjsfx
(
  tjk_sjsfx_ZQDM Varchar2(10) not null,
  tjk_sjsfx_FXYWLB Varchar2(10) not null,
  tjk_sjsfx_QRGS number(12),
  tjk_sjsfx_ZJJE number(12,4),
  tjk_sjsfx_FSRQ DATE not null,
  d_ywrq DATE not null
);
comment on table tjk_sjsfx is 'SJSFXԭʼ�ӿڱ�';
comment on column tjk_sjsfx.tjk_sjsfx_ZQDM is '֤ȯ����'; --2
comment on column tjk_sjsfx.tjk_sjsfx_FXYWLB is '����ҵ�����'; --4
comment on column tjk_sjsfx.tjk_sjsfx_QRGS is 'ȷ�Ϲ���'; --8
comment on column tjk_sjsfx.tjk_sjsfx_ZJJE is '�ʽ���/�ɽ����'; --9
comment on column tjk_sjsfx.tjk_sjsfx_FSRQ is '��������'; --11
comment on column tjk_sjsfx.d_ywrq is 'ҵ������';


/*��������tjk_sjsjg*/
create table tjk_sjsjg
(
  tjk_sjsjg_ZQDM Varchar2(10) not null,
  tjk_sjsjg_JGYWLB Varchar2(10) not null,
  tjk_sjsjg_CJSL number(12),
  tjk_sjsjg_CJJG number(12,4),
  tjk_sjsjg_ZJJE number(16,2),
  tjk_sjsjg_CJRQ DATE not null,
  d_ywrq DATE not null
);
comment on table tjk_sjsjg is 'SJSJGԭʼ�ӿڱ�';
comment on column tjk_sjsjg.tjk_sjsjg_ZQDM is '֤ȯ����'; --5
comment on column tjk_sjsjg.tjk_sjsjg_JGYWLB is '���ҵ�����'; --4
comment on column tjk_sjsjg.tjk_sjsjg_CJSL is '�ɽ�����';  --15
comment on column tjk_sjsjg.tjk_sjsjg_CJJG is '�ɽ��۸�'; --16
comment on column tjk_sjsjg.tjk_sjsjg_ZJJE is '�ʽ���/�ɽ����'; --34
comment on column tjk_sjsjg.tjk_sjsjg_CJRQ is '�ɽ�����'; --38
comment on column tjk_sjsjg.d_ywrq is 'ҵ������';


/*\*��Ʊ��Ϣ�ӿڱ�tjk_par_stock*\
create table tjk_par_stock
(
  tjk_par_stock_ZQDM Varchar2(10) primary key,
  tjk_par_stock_ZQMC Varchar2(30),
  tjk_par_stock_JYSC Varchar2(10),
  tjk_par_stock_ZGB number(20),
  tjk_par_stock_LTGB  number(20),
  tjk_par_stock_MGMZ  number(10,2),
  d_ywrq DATE not null
);
comment on table tjk_par_stock is 'PAR_STOCKԭʼ�ӿڱ�';
comment on column tjk_par_stock.tjk_par_stock_ZQDM is '֤ȯ����';
comment on column tjk_par_stock.tjk_par_stock_ZQMC is '֤ȯ����';
comment on column tjk_par_stock.tjk_par_stock_JYSC is '�����г�';
comment on column tjk_par_stock.tjk_par_stock_ZGB is '�ܹɱ�';
comment on column tjk_par_stock.tjk_par_stock_LTGB is '��ͨ�ɱ�';
comment on column tjk_par_stock.tjk_par_stock_MGMZ is 'ÿ����ֵ';
comment on column tjk_par_stock.d_ywrq is 'ҵ������';
*/

/*\*ծȯ��Ϣ�ӿڱ�tjk_par_bond*\
create table tjk_par_bond
(
  tjk_par_bond_ZQDM Varchar2(10) primary key,
  tjk_par_bond_ZQMC Varchar2(30),
  tjk_par_bond_QXR DATE,
  tjk_par_bond_JZR DATE,
  tjk_par_bond_SQPMLV number(12,8),
  tjk_par_bond_PMLV number(12,8),
  tjk_par_bond_PMJE number(6,4),
  tjk_par_bond_FXJG number(6,4),
  tjk_par_bond_FXFS number(3),
  tjk_par_bond_ZQLB Varchar2(20),
  tjk_par_bond_JYSC Varchar2(20),
  tjk_par_bond_JJQJ number(3),
  d_ywrq DATE not null
);
comment on table tjk_par_bond is 'PAR_BONDԭʼ�ӿڱ�';
comment on column tjk_par_bond.tjk_par_bond_ZQDM is '֤ȯ����';
comment on column tjk_par_bond.tjk_par_bond_ZQMC is '֤ȯ����';
comment on column tjk_par_bond.tjk_par_bond_QXR is '��Ϣ��';
comment on column tjk_par_bond.tjk_par_bond_JZR is '��ֹ��';
comment on column tjk_par_bond.tjk_par_bond_SQPMLV is '˰ǰƱ������';
comment on column tjk_par_bond.tjk_par_bond_PMLV is 'Ʊ������';
comment on column tjk_par_bond.tjk_par_bond_PMJE is 'Ʊ����';
comment on column tjk_par_bond.tjk_par_bond_FXJG is '���м۸�';
comment on column tjk_par_bond.tjk_par_bond_FXFS is '��Ϣ��ʽ';    --0ÿ���¸�Ϣ��1���긶Ϣ��2�긶Ϣ��3��һ���Ը�Ϣ
comment on column tjk_par_bond.tjk_par_bond_ZQLB is '֤ȯ���';    --��ծ��
comment on column tjk_par_bond.tjk_par_bond_JYSC is '�����г�';    --�Ϻ����Ϻ�
comment on column tjk_par_bond.tjk_par_bond_JJQJ is '����ȫ��';
comment on column tjk_par_bond.d_ywrq is 'ҵ������';


*/
