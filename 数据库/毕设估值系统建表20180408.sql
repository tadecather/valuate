/*创建用户表*/
create table tyh
(
  yh_bh varchar2(10) not null primary key ,
  yh_mc VARCHAR2(20) not null，
  yh_mm VARCHAR2(20) not null
);
comment on table tyh is '用户表';
comment on column tyh.yh_bh is '用户编号';
comment on column tyh.yh_mc is '用户名称';
comment on column tyh.yh_mm is '用户密码';

/*创建账套信息表*/
/*
create table tztxx
(
  tztxx_ztbh number(10) not null primary key,
  tztxx_jjdm VARCHAR2(20) not null,
  tztxx_ztmc VARCHAR2(30) not null,
  tztxx_clrq DATE not null,
);
comment on table tztxx is '账套信息表';
comment on column tztxx.tztxx_ztbh is '账套编号';
comment on column tztxx.tztxx_jjdm is '基金代码';
comment on column tztxx.tztxx_ztmc is '账套名称';
comment on column tztxx.tztxx_clrq is '成立日期';
*/


/*创建证券信息表*/
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
comment on table tzqxx is '证券信息表';
comment on column tzqxx.tzqxx_zqdm is '证券代码';
comment on column tzqxx.tzqxx_jysc is '交易市场';
comment on column tzqxx.tzqxx_zqlb is '证券类别';
comment on column tzqxx.tzqxx_zqmc is '证券名称';
comment on column tzqxx.tzqxx_zgb is '总股本';
comment on column tzqxx.tzqxx_mgmz is '每股面值';
comment on column tzqxx.tzqxx_fxrq is '发行日期';
comment on column tzqxx.tzqxx_qxr is '起息日';
comment on column tzqxx.tzqxx_nll is '年利率';
comment on column tzqxx.tzqxx_lxs is '利息税';
comment on column tzqxx.tzqxx_fxfs is '付息方式';
comment on column tzqxx.tzqxx_hgts is '回购天数';



/*创建市场信息表*/
/*
create table tscxx
(
  tscxx_scdm number(4) not null primary key,
  tscxx_scmc VARCHAR2(30) not null,
);
comment on table tscxx is '市场信息表';
comment on column tscxx.tscxx_scdm is '市场代码';
comment on column tscxx.tscxx_scmc is '市场名称';
*/


/*创建交易费率表*/
create table tjyfl
(
  --tjyfl_ztbh number(10) not null primary key(tjyfl_ztbh,tscxx_jysc,tscxx_ywlb),
  tjyfl_jysc VARCHAR2(10) not null ,
  tjyfl_ywlb VARCHAR2(10) not null,
  tjyfl_yhs number(12,8) ,
  tjyfl_jsf number(12,8) ,
  tjyfl_ghf number(12,8) ,
  tjyfl_zgf number(12,8) ,
  tjyfl_yj number(12,8) ，
  primary key(tjyfl_jysc,tjyfl_ywlb)
);
comment on table tjyfl is '交易费率表';
--comment on column tjyfl.tjyfl_ztbh is '账套编号';
comment on column tjyfl.tjyfl_jysc is '交易市场';
comment on column tjyfl.tjyfl_ywlb is '业务类别';
comment on column tjyfl.tjyfl_yhs is '印花税';
comment on column tjyfl.tjyfl_jsf is '经手费';
comment on column tjyfl.tjyfl_ghf is '过户费';
comment on column tjyfl.tjyfl_zgf is '证管费';
comment on column tjyfl.tjyfl_yj is '佣金';


/*创建三提两费表*/
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
comment on table tstlf is '三提两费表';
--comment on column tstlf.tstlf_ztbh is '账套编号';
comment on column tstlf.tstlf_fylx is '费用类型';
comment on column tstlf.tstlf_ksrq is '开始日期';
comment on column tstlf.tstlf_jsrq is '结束日期';
comment on column tstlf.tstlf_jtbl is '计提比例';
comment on column tstlf.tstlf_fyze is '费用总额';
comment on column tstlf.tstlf_jtcs is '计提次数';


/*创建接收路径表*/
create table tjslj
(
  --tjsj_ztbh number(10) not null ,
  tjslj_jkmc VARCHAR2(30) not null,
  tjslj_jkbh VARCHAR2(8) not null primary key,
  tjslj_wjlj VARCHAR2(200),
  tjslj_wjmc VARCHAR2(50)
);
comment on table tjslj is '接收路径表';
--comment on column tjslj.tjslj_ztbh is '账套编号';
comment on column tjslj.tjslj_jkmc is '接口名称';
comment on column tjslj.tjslj_jkbh is '接口编号';
comment on column tjslj.tjslj_wjlj is '文件路径';
comment on column tjslj.tjslj_wjmc is '文件名称';


/*创建会计科目表*/
create table tkjkm
(
  tkjkm_kmdm VARCHAR2(30) not null primary key,
  tkjkm_kmmc VARCHAR2(60) not null,
  tkjkm_jdfx VARCHAR2(2) not null
);
comment on table tkjkm is '会计科目表';
comment on column tkjkm.tkjkm_kmdm is '科目代码';
comment on column tkjkm.tkjkm_kmmc is '科目名称';
comment on column tkjkm.tkjkm_jdfx is '借贷方向';


/*创建凭证模板表*/
create table tpzmb
(
  tpzmb_pzbh Varchar(10) not null ,
  tpzmb_kmdm VARCHAR2(30) not null,
  tpzmb_kmmc VARCHAR2(60) not null,
  tpzmb_ywzy VARCHAR2(90) not null,
  primary key(tpzmb_pzbh,tpzmb_kmdm)
);
comment on table tpzmb is '凭证模板表';
comment on column tpzmb.tpzmb_pzbh is '凭证编号';
comment on column tpzmb.tpzmb_kmdm is '科目代码';
comment on column tpzmb.tpzmb_kmmc is '科目名称';
comment on column tpzmb.tpzmb_ywzy is '业务摘要';



/*创建会计科目余额表*/
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
comment on table tkjkmye is '会计科目余额表';
comment on column tkjkmye.tkjkmye_ywrq is '业务日期';
comment on column tkjkmye.tkjkmye_kmdm is '科目代码';
comment on column tkjkmye.tkjkmye_kmmc is '科目名称';
comment on column tkjkmye.tkjkmye_jdfx is '借贷方向';
comment on column tkjkmye.tkjkmye_jffsje is '借方发生金额';
comment on column tkjkmye.tkjkmye_dffsje is '贷方发生金额';
comment on column tkjkmye.tkjkmye_ye is '余额';


/*创建行情表*/
create table thq                        
(
  thq_hqrq DATE not null,
  thq_zqdm VARCHAR2(10) not null,
  thq_jrspj number(16,4) ,
  thq_zqmc VARCHAR2(30) not null,
   primary key(thq_hqrq,thq_zqdm)
);
comment on table thq is '行情表';
comment on column thq.thq_hqrq is '行情日期';
comment on column thq.thq_zqdm is '证券代码';
comment on column thq.thq_jrspj is '今日收盘价';
comment on column thq.thq_zqmc is '证券名称';


/*创建股票交易表*/
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
  --primary key(tgpjy_zqdm,tgpjy_jyrq,tgpjy_jyfx)   --暂时考虑不加主键
);
comment on table tgpjy is '股票交易表';
comment on column tgpjy.tgpjy_zqdm is '证券代码';
comment on column tgpjy.tgpjy_zqmc is '证券名称';
comment on column tgpjy.tgpjy_jyrq is '交易日期';
comment on column tgpjy.tgpjy_jyfx is '交易方向';
comment on column tgpjy.tgpjy_jysc is '交易市场';
comment on column tgpjy.tgpjy_cjjg is '成交价格';
comment on column tgpjy.tgpjy_cjje is '成交金额';
comment on column tgpjy.tgpjy_cjsl is '成交数量';
comment on column tgpjy.tgpjy_jsf is '经手费';
comment on column tgpjy.tgpjy_yhs is '印花税';
comment on column tgpjy.tgpjy_ghf is '过户费';
comment on column tgpjy.tgpjy_zgf is '征管费';
comment on column tgpjy.tgpjy_yongjin is '佣金';


/*创建债券交易表*/
create table tzqjy                        
(
  tzqjy_zqdm VARCHAR2(10) not null,
  tzqjy_zqmc VARCHAR2(30) not null,        
  tzqjy_jyrq DATE not null,
  tzqjy_jyfx VARCHAR2(4) not null,
  tzqjy_jysc VARCHAR2(10) not null,
  tzqjy_cjjg number(16,4) not null, -- 兑息不需要字段，可为空
  tzqjy_cjje number(16,2) not null, -- 兑息不需要字段，可为空
  tzqjy_cjsl number(12) not null,   -- 兑息不需要字段，可为空
  tzqjy_jsf number(12,2) ,
  tzqjy_yhs number(12,2) ,
  tzqjy_ghf number(12,2) ,
  tzqjy_zgf number(12,2) ,
  tzqjy_yongjin number(12,2),
  tzqjy_sqlx number(12,6) ,     -- 存储 兑息金额
  tzqjy_shlx number(12,6),
  tzqjy_lxs number(12,6)
  --primary key(tzqjy_zqdm,tzqjy_jyrq,tzqjy_jyfx)      --暂时考虑不加主键
);
comment on table tzqjy is '债券交易表';
comment on column tzqjy.tzqjy_zqdm is '证券代码';
comment on column tzqjy.tzqjy_zqmc is '债券名称';      --新添加字段
comment on column tzqjy.tzqjy_jyrq is '交易日期';
comment on column tzqjy.tzqjy_jyfx is '交易方向';
comment on column tzqjy.tzqjy_jysc is '交易市场';
comment on column tzqjy.tzqjy_cjjg is '成交价格';
comment on column tzqjy.tzqjy_cjje is '成交金额';
comment on column tzqjy.tzqjy_cjsl is '成交数量';
comment on column tzqjy.tzqjy_jsf is '经手费';
comment on column tzqjy.tzqjy_yhs is '印花税';
comment on column tzqjy.tzqjy_ghf is '过户费';
comment on column tzqjy.tzqjy_zgf is '证管费';
comment on column tzqjy.tzqjy_yongjin is '佣金';
comment on column tzqjy.tzqjy_sqlx is '税前利息';
comment on column tzqjy.tzqjy_shlx is '税后利息';
comment on column tzqjy.tzqjy_lxs is '利息税';


/*创建回购交易表*/
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
comment on table thgjy is '回购交易表';
comment on column thgjy.thgjy_zqdm is '证券代码';
comment on column thgjy.thgjy_hgmc is '回购名称';
comment on column thgjy.thgjy_hgts is '回购天数';
comment on column thgjy.thgjy_cjrq is '成交日期';
comment on column thgjy.thgjy_dqrq is '到期日期';
comment on column thgjy.thgjy_hgfx is '回购方向';
comment on column thgjy.thgjy_jysc is '交易市场';
comment on column thgjy.thgjy_cjje is '成交金额';
comment on column thgjy.thgjy_fkje is '返款金额';
--comment on column thgjy.thgjy_qssd is '清算速度';


/*创建凭证明细表*/
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
comment on table tpzmx is '凭证明细表';
comment on column tpzmx.tpzmx_pzrq is '凭证日期';
comment on column tpzmx.tpzmx_pzbh is '凭证编号';
comment on column tpzmx.tpzmx_kmdm is '科目代码';
comment on column tpzmx.tpzmx_kmmc is '科目名称';
comment on column tpzmx.tpzmx_ywzy is '业务摘要';
comment on column tpzmx.tpzmx_jdfx is '借贷方向';
comment on column tpzmx.tpzmx_je is '金额';
comment on column tpzmx.tpzmx_sl is '数量';
comment on column tpzmx.tpzmx_zdr is '制单人';


/*创建估值表*/
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
comment on table tgz is '估值表';
comment on column tgz.tgz_ywrq is '业务日期';
comment on column tgz.tgz_kmdm is '科目代码';
comment on column tgz.tgz_kmmc is '科目名称';
comment on column tgz.tgz_sl is '数量';
comment on column tgz.tgz_dwcb is '单位成本';
comment on column tgz.tgz_zcb is '总成本';
comment on column tgz.tgz_cbzjz is '成本占净值';
comment on column tgz.tgz_sj is '市价';
comment on column tgz.tgz_zsz is '总市值';
comment on column tgz.tgz_szzjz is '市值占净值';
comment on column tgz.tgz_gzzz is '估值增值';


/*创建证券结存表*/
create table tzqjc                        
(
  tzqjc_jyrq DATE not null ,
  tzqjc_zqdm Varchar2(10) not null,
  tzqjc_zqmc Varchar2(30),               --新添加字段
  tzqjc_ljsl Number(12) ,
  tzqjc_ljcb Number(16,8) ,
  tzqjc_ljgz Number(16,8) ,
  tzqjc_ljlx Number(16,8) ,
  tzqjc_ywlb Varchar2(6),                --新添加字段
  tzqjc_jysc Varchar2(6),                --新添加字段
  primary key(tzqjc_jyrq,tzqjc_zqdm) 
);
comment on table tzqjc is '证券结存表';
comment on column tzqjc.tzqjc_jyrq is '交易日期';
comment on column tzqjc.tzqjc_zqdm is '证券代码';
comment on column tzqjc.tzqjc_zqmc is '证券名称';
comment on column tzqjc.tzqjc_ljsl is '累计数量';
comment on column tzqjc.tzqjc_ljcb is '累计成本';
comment on column tzqjc.tzqjc_ljgz is '累计估增';
comment on column tzqjc.tzqjc_ljlx is '累计利息';
comment on column tzqjc.tzqjc_ywlb is '业务类别';
comment on column tzqjc.tzqjc_jysc is '交易市场';

/*创建新股表*/
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
comment on table txg is '汇总新股表';
comment on column txg.txg_zqdm is '证券代码';--
comment on column txg.txg_jysc is '交易市场';
comment on column txg.txg_ywlb is '业务类别'; -- 四个，新股中签，新股缴款，新股交收，新股流通
comment on column txg.txg_cjjg is '成交价格';
comment on column txg.txg_cjje is '成交金额';
comment on column txg.txg_cjsl is '成交数量';
comment on column txg.txg_ywrq is '业务日期';
comment on column txg.txg_zqmc is '证券名称';


/*创建红利表*/
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
comment on table thl is '汇总红利表';
comment on column thl.thl_ywrq is '业务日期';
comment on column thl.thl_dzrq is '到账日期';
comment on column thl.thl_ywlb is '业务类别'; --三类，分红公告 红利到账 红利除权         
comment on column thl.thl_jysc is '交易市场';      
comment on column thl.thl_zqdm is '证券代码';
comment on column thl.thl_zqmc is '证券名称';
comment on column thl.thl_djsl is '登记数量';
comment on column thl.thl_fhje is '分红金额';   -- 存储分红金额
comment on column thl.thl_qybl is '权益比例';


/*原始接口表 统一加上d_ywrq字段

基本面信息
tjk_cpxx：上海证券信息接口表        --cpxx.txt
tjk_security：深圳证券信息接口表        --security
行情信息
tjk_mktdt00：上海行情接口表              --mktdt00
tjk_ cashsecurityclosed：深圳行情接口表     --cashsecurityclosed
交易信息
tjk_gh：上海交易接口表
tjk_sjsmx1：深圳交易接口表
红利信息
tjk_jsmx：上海结算明细表         --包含上海新股中签和中签交收、红利到账
tjk_zqbd：上海证券表             --包含新股流通、上海股票分红
tjk_sjsfx：深圳深交所发行表       --深圳新股中签和中签交收
tjk_sjsjg：深交所结果表           --包含新股流通、深圳分红、红利到账

*/

/*上海证券基本面信息原始接口表cpxx*/
create table tjk_shzqxx
(
  tjk_shzqxx_zqdm Varchar2(10) not null,
  tjk_shzqxx_zqlb Varchar2(6) not null,
  tjk_shzqxx_zqmc Varchar2(30) not null,
  tjk_shzqxx_zgb number(16) not null,
  tjk_shzqxx_mgmz number(12，8) not null,
  tjk_shzqxx_fxrq DATE not null,
  d_ywrq DATE not null
);
comment on table tjk_shzqxx is 'cpxx原始接口表';
comment on column tjk_shzqxx.tjk_shzqxx_zqdm is '证券代码'; -- 第一行
comment on column tjk_shzqxx.tjk_shzqxx_zqlb is '证券类别'; -- 第八行 ES 股票 EU基金 D债券 RWS权证 FF期货
comment on column tjk_shzqxx.tjk_shzqxx_zqmc is '证券名称'; -- 第四行
comment on column tjk_shzqxx.tjk_shzqxx_zgb is '总股本';    
comment on column tjk_shzqxx.tjk_shzqxx_mgmz is '每股面值'; -- 第十一行
comment on column tjk_shzqxx.tjk_shzqxx_fxrq is '发行日期'; -- 第十四行
comment on column tjk_shzqxx.d_ywrq is '业务日期';

/*深圳证券基本面信息原始接口表securities*/
create table tjk_szzqxx
(
  tjk_szzqxx_zqdm Varchar2(10) not null,
  --TODO 6 -> 20
  tjk_szzqxx_zqlb Varchar2(6) not null,
  tjk_szzqxx_zqmc Varchar2(30) not null,
  tjk_szzqxx_zgb number(16) not null,
  tjk_szzqxx_mgmz number(12，8) not null,
  tjk_szzqxx_fxrq DATE not null,
  d_ywrq DATE not null
);
comment on table tjk_szzqxx is 'securities原始接口表';
comment on column tjk_szzqxx.tjk_szzqxx_zqdm is '证券代码'; --SecurityID
comment on column tjk_szzqxx.tjk_szzqxx_zqlb is '证券类别'; --SecurityType
{1,2,3,4 股票； 5,6,7,8,9,10,11 债券；14,15,16,17,19,20,23,24,25,26 基金；28 权证； 12 质押式回购；}
comment on column tjk_szzqxx.tjk_szzqxx_zqmc is '证券名称';--symbol
comment on column tjk_szzqxx.tjk_szzqxx_zgb is '总股本';
comment on column tjk_szzqxx.tjk_szzqxx_mgmz is '每股面值';--ParValue
comment on column tjk_szzqxx.tjk_szzqxx_fxrq is '发行日期';--ListDate
comment on column tjk_szzqxx.d_ywrq is '业务日期';


/*深交所原始接口表sjsmx1*/--4，12, 14, 33,34,根据成交金额政府判断，插入当前日期
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
comment on table tjk_sjsmx1 is 'sjsmx1原始接口表';
comment on column tjk_sjsmx1.tjk_sjsmx1_ZQDM is '证券代码';
comment on column tjk_sjsmx1.tjk_sjsmx1_CJSL is '成交数量';
comment on column tjk_sjsmx1.tjk_sjsmx1_CJJG is '成交价格';
comment on column tjk_sjsmx1.tjk_sjsmx1_CJJE is '成交金额';
--comment on column tjk_sjsmx1.MXYHS is '印花税';
--comment on column tjk_sjsmx1.MXJYJSF is '经手费';
--comment on column tjk_sjsmx1.MXJGGF is '证管费';
--comment on column tjk_sjsmx1.MXGHF is '过户费';
--comment on column tjk_sjsmx1.MXSFJE is '实付金额';
comment on column tjk_sjsmx1.tjk_sjsmx1_CJRQ is '成交日期';
--comment on column tjk_sjsmx1.tjk_sjsmx1_QSRQ is '清算日期';
comment on column tjk_sjsmx1.tjk_sjsmx1_JYFX is '交易方向';
comment on column tjk_sjsmx1.d_ywrq is '业务日期';


/*上交所原始接口表gh*/
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
comment on table tjk_gh is 'GH原始接口表';
comment on column tjk_gh.tjk_gh_zqdm is '证券代码'; -- H 8
comment on column tjk_gh.tjk_gh_cjsl is '成交数量'; -- F 6
comment on column tjk_gh.tjk_gh_cjjg is '成交价格'; -- K 11
comment on column tjk_gh.tjk_gh_cjje is '成交金额'; -- L 12
comment on column tjk_gh.tjk_gh_jyfx is '交易方向'; -- N 14
comment on column tjk_gh.tjk_gh_cjrq is '成交日期'; -- C 3
comment on column tjk_gh.d_ywrq is '业务日期';


/*上交所行情文件原始接口表mktdt00*/
create table tjk_mktdt00
(
  tjk_mktdt00_ZQDM Varchar2(10) not null,
  --tjk_mktdt00_ZQMC Varchar2(30) not null,         --第三列
  tjk_mktdt00_CLOSEPX number(16,4) not null,
  d_ywrq DATE not null
);
comment on table tjk_mktdt00 is 'MKTDT00原始接口表';
comment on column tjk_mktdt00.tjk_mktdt00_ZQDM is '证券代码';
--comment on column tjk_mktdt00.tjk_mktdt00_ZQMC is '证券名称';
comment on column tjk_mktdt00.tjk_mktdt00_CLOSEPX is '今日收盘价';
comment on column tjk_mktdt00.d_ywrq is '业务日期';


/*深交所行情文件原始接口表cashsecurityclosemd*/
create table tjk_cashsecurity
(
  tjk_cashsecurity_ZQDM Varchar2(10) not null,
  --tjk_cashsecurity_ZQMC Varchar2(30) not null,          --<Symbol>
  tjk_cashsecurity_CLOSEPX number(16,4) not null,
  d_ywrq DATE not null
);
comment on table tjk_cashsecurity is 'cashsecurityclosemd原始接口表';
comment on column tjk_cashsecurity.tjk_cashsecurity_ZQDM is '证券代码';
--comment on column tjk_cashsecurity.tjk_cashsecurity_ZQMC is '证券名称';
comment on column tjk_cashsecurity.tjk_cashsecurity_CLOSEPX is '今日收盘价';
comment on column tjk_cashsecurity.d_ywrq is '业务日期';


/*上海结算明细文件原始接口表tjk_jsmx*/
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
comment on table tjk_jsmx is 'JSMX原始接口表';
comment on column tjk_jsmx.tjk_jsmx_JLLX is '记录类型'; --2  
--“001”： 清算明细记录
--“002”： 非担保交收业务的交收通知记录
--“003”： 非担保交收业务的交收结果记录
--“990” 其它
comment on column tjk_jsmx.tjk_jsmx_JYRQ is '交易日期'; --12
comment on column tjk_jsmx.tjk_jsmx_ZQDM is '证券代码'; --25
comment on column tjk_jsmx.tjk_jsmx_CJSL is '成交数量'; --32
comment on column tjk_jsmx.tjk_jsmx_CJJG is '成交价格'; --35
comment on column tjk_jsmx.tjk_jsmx_CJJE is '成交金额'; --37
comment on column tjk_jsmx.tjk_jsmx_ZQLB is '证券类别'; --26
comment on column tjk_jsmx.d_ywrq is '业务日期';


/*上海证券变动文件原始接口表tjk_zqbd*/
create table tjk_zqbd
(
  tjk_zqbd_ZQDM Varchar2(10) not null,
  tjk_zqbd_ZQLB Varchar2(4) not null,
  tjk_zqbd_BDSL number(12) not null，
  tjk_zqbd_BDLX Varchar2(6) not null,
  tjk_zqbd_BDRQ DATE not null,
  d_ywrq DATE not null
);
comment on table tjk_zqbd is 'ZQBD原始接口表';
comment on column tjk_zqbd.tjk_zqbd_ZQDM is '证券代码'; --5
comment on column tjk_zqbd.tjk_zqbd_ZQLB is '证券类别'; --6
comment on column tjk_zqbd.tjk_zqbd_BDSL is '变动数量'; --10
comment on column tjk_zqbd.tjk_zqbd_BDLX is '变动类型'; --11
comment on column tjk_zqbd.tjk_zqbd_BDRQ is '变动日期'; --12
comment on column tjk_zqbd.d_ywrq is '业务日期';


/*深交所发行表tjk_sjsfx*/
create table tjk_sjsfx
(
  tjk_sjsfx_ZQDM Varchar2(10) not null,
  tjk_sjsfx_FXYWLB Varchar2(10) not null,
  tjk_sjsfx_QRGS number(12),
  tjk_sjsfx_ZJJE number(12,4),
  tjk_sjsfx_FSRQ DATE not null,
  d_ywrq DATE not null
);
comment on table tjk_sjsfx is 'SJSFX原始接口表';
comment on column tjk_sjsfx.tjk_sjsfx_ZQDM is '证券代码'; --2
comment on column tjk_sjsfx.tjk_sjsfx_FXYWLB is '发行业务类别'; --4
comment on column tjk_sjsfx.tjk_sjsfx_QRGS is '确认股数'; --8
comment on column tjk_sjsfx.tjk_sjsfx_ZJJE is '资金金额/成交金额'; --9
comment on column tjk_sjsfx.tjk_sjsfx_FSRQ is '发送日期'; --11
comment on column tjk_sjsfx.d_ywrq is '业务日期';


/*深交所结果表tjk_sjsjg*/
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
comment on table tjk_sjsjg is 'SJSJG原始接口表';
comment on column tjk_sjsjg.tjk_sjsjg_ZQDM is '证券代码'; --5
comment on column tjk_sjsjg.tjk_sjsjg_JGYWLB is '结果业务类别'; --4
comment on column tjk_sjsjg.tjk_sjsjg_CJSL is '成交数量';  --15
comment on column tjk_sjsjg.tjk_sjsjg_CJJG is '成交价格'; --16
comment on column tjk_sjsjg.tjk_sjsjg_ZJJE is '资金金额/成交金额'; --34
comment on column tjk_sjsjg.tjk_sjsjg_CJRQ is '成交日期'; --38
comment on column tjk_sjsjg.d_ywrq is '业务日期';


/*\*股票信息接口表tjk_par_stock*\
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
comment on table tjk_par_stock is 'PAR_STOCK原始接口表';
comment on column tjk_par_stock.tjk_par_stock_ZQDM is '证券代码';
comment on column tjk_par_stock.tjk_par_stock_ZQMC is '证券名称';
comment on column tjk_par_stock.tjk_par_stock_JYSC is '交易市场';
comment on column tjk_par_stock.tjk_par_stock_ZGB is '总股本';
comment on column tjk_par_stock.tjk_par_stock_LTGB is '流通股本';
comment on column tjk_par_stock.tjk_par_stock_MGMZ is '每股面值';
comment on column tjk_par_stock.d_ywrq is '业务日期';
*/

/*\*债券信息接口表tjk_par_bond*\
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
comment on table tjk_par_bond is 'PAR_BOND原始接口表';
comment on column tjk_par_bond.tjk_par_bond_ZQDM is '证券代码';
comment on column tjk_par_bond.tjk_par_bond_ZQMC is '证券名称';
comment on column tjk_par_bond.tjk_par_bond_QXR is '起息日';
comment on column tjk_par_bond.tjk_par_bond_JZR is '截止日';
comment on column tjk_par_bond.tjk_par_bond_SQPMLV is '税前票面利率';
comment on column tjk_par_bond.tjk_par_bond_PMLV is '票面利率';
comment on column tjk_par_bond.tjk_par_bond_PMJE is '票面金额';
comment on column tjk_par_bond.tjk_par_bond_FXJG is '发行价格';
comment on column tjk_par_bond.tjk_par_bond_FXFS is '付息方式';    --0每三月付息，1半年付息，2年付息，3是一次性付息
comment on column tjk_par_bond.tjk_par_bond_ZQLB is '证券类别';    --国债等
comment on column tjk_par_bond.tjk_par_bond_JYSC is '交易市场';    --上海、上海
comment on column tjk_par_bond.tjk_par_bond_JJQJ is '净价全价';
comment on column tjk_par_bond.d_ywrq is '业务日期';


*/
