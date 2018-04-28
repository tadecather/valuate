create or replace procedure scgzb(rq date) is
 jrspj thq.thq_jrspj%type;
 jlcount integer;
 ye tkjkmye.tkjkmye_ye%type;
 fse tkjkmye.tkjkmye_ye%type;
 ye2 tkjkmye.tkjkmye_ye%type;
 fse2 tkjkmye.tkjkmye_ye%type;
 zsz3 tkjkmye.tkjkmye_ye%type;
 zcb3 tkjkmye.tkjkmye_ye%type;
  cursor scmmgz(rq date)--��Ʊ��ֵ��ֵ
    IS select a.tzqjc_zqdm,a.tzqjc_zqmc,a.tzqjc_jysc,a.tzqjc_ljsl,a.tzqjc_ljcb,a.tzqjc_ljgz,b.thq_jrspj 
    from tzqjc a ,thq b where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='����' and b.thq_hqrq=rq and b.thq_zqdm=a.tzqjc_zqdm;
    dm1 tzqjc.tzqjc_zqdm%type;
    mc1 tzqjc.tzqjc_zqmc%type;
    sc1 tzqjc.tzqjc_jysc%type;
    ljsl1 tzqjc.tzqjc_ljsl%type;  
    ljcb1 tzqjc.tzqjc_ljcb%type;
    ljgz1 tzqjc.tzqjc_ljgz%type;
    jrspj1 thq.thq_jrspj%type;
  cursor sczqgz(rq date)--ծȯ��ֵ��ֵ
    IS select a.tzqjc_zqdm,a.tzqjc_zqmc,a.tzqjc_jysc,a.tzqjc_ljsl,a.tzqjc_ljcb,a.tzqjc_ljgz,b.thq_jrspj 
    from tzqjc a ,thq b where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='ծȯ' and b.thq_hqrq=rq and b.thq_zqdm=a.tzqjc_zqdm;
    dm2 tzqjc.tzqjc_zqdm%type;
    mc2 tzqjc.tzqjc_zqmc%type;
    sc2 tzqjc.tzqjc_jysc%type;
    ljsl2 tzqjc.tzqjc_ljsl%type;  
    ljcb2 tzqjc.tzqjc_ljcb%type;
    ljgz2 tzqjc.tzqjc_ljgz%type;
    jrspj2 thq.thq_jrspj%type;  
  cursor scgz(rq date)--���ɹ�ֵ��
    is select a.tkjkmye_kmdm,a.tkjkmye_kmmc,a.tkjkmye_ye 
       from tkjkmye a 
       where a.tkjkmye_ywrq=rq and 
       (a.tkjkmye_kmdm like '1%' or a.tkjkmye_kmdm like '2%' or a.tkjkmye_kmdm like '3%') and 
       (a.tkjkmye_kmdm not like'1102%' and a.tkjkmye_kmdm not like'1103%' and a.tkjkmye_kmdm not like'1204%');
    dm3 tkjkmye.tkjkmye_kmdm%type;
    mc3 tkjkmye.tkjkmye_kmmc%type;
    ye3 tkjkmye.tkjkmye_ye%type;
  cursor scxggz(rq date)--���ɹ�ֵ��������¹ɵ�����
    IS select a.tzqjc_zqdm,a.tzqjc_zqmc,a.tzqjc_jysc,a.tzqjc_ljsl,a.tzqjc_ljcb,a.tzqjc_ljgz,b.thq_jrspj
    from tzqjc a,thq b where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='�¹�' and b.thq_hqrq=rq and b.thq_zqdm=a.tzqjc_zqdm;
    dm4 tzqjc.tzqjc_zqdm%type;
    mc4 tzqjc.tzqjc_zqmc%type;
    sc4 tzqjc.tzqjc_jysc%type;
    ljsl4 tzqjc.tzqjc_ljsl%type;  
    ljcb4 tzqjc.tzqjc_ljcb%type;
    ljgz4 tzqjc.tzqjc_ljgz%type;
    jrspj4 thq.thq_jrspj%type;
  cursor scyslx(rq date)--Ӧ����Ϣ
    is select a.tzqjc_zqdm,a.tzqjc_zqmc,a.tzqjc_ljlx,a.tzqjc_jysc
    from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='ծȯ';
    dm5 tzqjc.tzqjc_zqdm%type;
    mc5 tzqjc.tzqjc_zqmc%type;
    ljlx5 tzqjc.tzqjc_ljlx%type;
    sc5 tzqjc.tzqjc_jysc%type;
begin
  --���ɹ�ֵ������ƱͶ�ʣ�1102��ծȯͶ�ʣ�1103��Ӧ����Ϣ��1204���漰�Ŀ�Ŀ������ȫ���ӻ�ƿ�Ŀ������ȡ
  --ɾ�����յĹ�ֵ��
  delete from tgz a where a.tgz_ywrq=rq;
  --����2���Ŀ�Ĺ�ֵ��
  open scgz(rq);
  fetch scgz into dm3,mc3,ye3;
  while scgz%found loop
    insert into tgz(tgz_ywrq,tgz_kmdm,tgz_kmmc,tgz_zcb,tgz_zsz) values(rq,dm3,mc3,ye3,ye3);
    fetch scgz into dm3,mc3,ye3;       
  end loop;
  close scgz; 
  ---------------------------------------------------------------------------------------��ƱͶ��
  --���ɹ�ֵ����1102һ����Ŀ�ļ�¼
  select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='����';
  if jlcount>0 then
    insert into tgz select rq,'1102','��ƱͶ��',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) from tzqjc a 
      where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='����';
  end if;
  
  --���ɹ�ֵ����1102�Ķ���������Ŀ�ļ�¼
  --���ɹ�Ʊ�Ķ���������Ŀ��¼
  select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='����' and a.tzqjc_jysc='�Ϻ�';
  if jlcount>0 then
    insert into tgz select rq,'110201','��ƱͶ��-�Ͻ���A��',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='����' and a.tzqjc_jysc='�Ϻ�';
    insert into tgz select rq,'11020101','��ƱͶ��-�Ͻ���A��-�Ͻ���A�ɳɱ�',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='����' and a.tzqjc_jysc='�Ϻ�';
    insert into tgz select rq,'11020199','��ƱͶ��-�Ͻ���A��-�Ͻ���A�ɹ�ֵ��ֵ','','',sum(a.tzqjc_ljgz),'','',sum(a.tzqjc_ljgz),'','' 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='����' and a.tzqjc_jysc='�Ϻ�';
  end if;
  select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='����' and a.tzqjc_jysc='����';
  if jlcount>0 then
    insert into tgz select rq,'110231','��ƱͶ��-���A��',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='����' and a.tzqjc_jysc='����';
    insert into tgz select rq,'11023101','��ƱͶ��-���A��-���A�ɳɱ�',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='����' and a.tzqjc_jysc='����';
    insert into tgz select rq,'11023199','��ƱͶ��-���A��-���A�ɹ�ֵ��ֵ','','',sum(a.tzqjc_ljgz),'','',sum(a.tzqjc_ljgz),'','' 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='����' and a.tzqjc_jysc='����';
  end if;
  --�����¹ɵĶ���������Ŀ��¼
  select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='�¹�' and a.tzqjc_jysc='�Ϻ�';
  if jlcount>0 then
    insert into tgz select rq,'110203','��ƱͶ��-�Ͻ����¹�',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb),'','' 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='�¹�' and a.tzqjc_jysc='�Ϻ�';
    insert into tgz select rq,'11020301','��ƱͶ��-�Ͻ����¹�-�Ͻ����¹ɳɱ�',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb),'',''
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='�¹�' and a.tzqjc_jysc='�Ϻ�';
  end if;
  select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='�¹�' and a.tzqjc_jysc='����';
  if jlcount>0 then
    insert into tgz select rq,'110233','��ƱͶ��-����¹�',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb),'','' 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='�¹�' and a.tzqjc_jysc='����';
    insert into tgz select rq,'11023301','��ƱͶ��-����¹�-����¹ɳɱ�',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb),'',''
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='�¹�' and a.tzqjc_jysc='����';
  end if;
  
  --���ɹ�Ʊ�ɱ��ļ���Ŀ
  open scmmgz(rq);
  fetch scmmgz into dm1,mc1,sc1,ljsl1,ljcb1,ljgz1,jrspj1;
  while scmmgz%found loop
    if sc1='�Ϻ�' then
     insert into tgz values(rq,'11020101'||dm1,'��ƱͶ��-�Ͻ���A��-�Ͻ���A�ɳɱ�-'||mc1,ljsl1,ljcb1/ljsl1,ljcb1,'',jrspj1,ljcb1+ljgz1,'',ljgz1);
    elsif sc1='����'then
     insert into tgz values(rq,'11023101'||dm1,'��ƱͶ��-���A��-���A�ɳɱ�-'||mc1,ljsl1,ljcb1/ljsl1,ljcb1,'',jrspj1,ljcb1+ljgz1,'',ljgz1);      
    end if;
    fetch scmmgz into dm1,mc1,sc1,ljsl1,ljcb1,ljgz1,jrspj1;
  end loop;
  close scmmgz; 
  --�����¹ɳɱ��ļ���Ŀ
  open scxggz(rq);
  fetch scxggz into dm4,mc4,sc4,ljsl4,ljcb4,ljgz4,jrspj4;
  while scxggz%found loop
    if sc4='�Ϻ�' then
     insert into tgz values(rq,'11020301'||dm4,'��ƱͶ��-�Ͻ����¹�-�Ͻ����¹ɳɱ�-'||mc4,ljsl4,ljcb4/ljsl4,ljcb4,'',jrspj4,ljcb4,'',ljgz4);
    elsif sc4='����'then
     insert into tgz values(rq,'11023301'||dm4,'��ƱͶ��-����¹�-����¹ɳɱ�-'||mc4,ljsl4,ljcb4/ljsl4,ljcb4,'',jrspj4,ljcb4,'',ljgz4);
    end if;
    fetch scxggz into dm4,mc4,sc4,ljsl4,ljcb4,ljgz4,jrspj4;
  end loop;
  close scxggz;
  
  ------------------------------------------------------------------------------------------ծȯͶ��
  --���ɹ�ֵ����1103ծȯͶ��һ����Ŀ�ļ�¼
  select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='ծȯ';
  if jlcount>0 then
    insert into tgz select rq,'1103','ծȯͶ��',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) 
      from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='ծȯ';
  end if;
  --���ɹ�ֵ����1103�Ķ���������Ŀ�ļ�¼
  --����ծȯͶ�ʵĶ���������Ŀ��¼
  select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='ծȯ' and a.tzqjc_jysc='�Ϻ�';
  if jlcount>0 then
    insert into tgz select rq,'110311','ծȯͶ��-�Ͻ���ծȯ',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='ծȯ' and a.tzqjc_jysc='�Ϻ�';
    insert into tgz select rq,'11031101','ծȯͶ��-�Ͻ���ծȯ-�Ͻ���ծȯ�ɱ�',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='ծȯ' and a.tzqjc_jysc='�Ϻ�';
    insert into tgz select rq,'11031199','ծȯͶ��-�Ͻ���ծȯ-�Ͻ���ծȯ��ֵ��ֵ','','',sum(a.tzqjc_ljgz),'','',sum(a.tzqjc_ljgz),'','' 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='ծȯ' and a.tzqjc_jysc='�Ϻ�';
  end if;
  select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='ծȯ' and a.tzqjc_jysc='����';
  if jlcount>0 then
    insert into tgz select rq,'110333','ծȯͶ��-���ծȯ',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='ծȯ' and a.tzqjc_jysc='����';
    insert into tgz select rq,'11033301','ծȯͶ��-���ծȯ-���ծȯ�ɱ�',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='ծȯ' and a.tzqjc_jysc='����';
    insert into tgz select rq,'11033399','ծȯͶ��-���ծȯ-���ծȯ��ֵ��ֵ','','',sum(a.tzqjc_ljgz),'','',sum(a.tzqjc_ljgz),'','' 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='ծȯ' and a.tzqjc_jysc='����';
  end if;
  --����ծȯͶ���ļ���Ŀ
  open sczqgz(rq);
  fetch sczqgz into dm2,mc2,sc2,ljsl2,ljcb2,ljgz2,jrspj2;
  while sczqgz%found loop
    if sc2='�Ϻ�' then
     insert into tgz values(rq,'11031101'||dm2,'ծȯͶ��-�Ͻ���ծȯ-�Ͻ���ծȯ�ɱ�-'||mc2,ljsl2,ljcb2/ljsl2,ljcb2,'',jrspj2,ljcb2+ljgz2,'',ljgz2);
    elsif sc2='����'then
     insert into tgz values(rq,'11033301'||dm2,'ծȯͶ��-���ծȯ-���ծȯ�ɱ�-'||mc2,ljsl2,ljcb2/ljsl2,ljcb2,'',jrspj2,ljcb2+ljgz2,'',ljgz2);      
    end if;
    fetch sczqgz into dm2,mc2,sc2,ljsl2,ljcb2,ljgz2,jrspj2;
  end loop;
  close sczqgz; 
  
  ------------------------------------------------------------------------------------------Ӧ����Ϣ
  --���ɹ�ֵ����1103ծȯͶ��һ����Ŀ�ļ�¼
  select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='ծȯ';
  if jlcount>0 then
    insert into tgz select rq,'1204','Ӧ����Ϣ','','',sum(a.tzqjc_ljlx),'','',sum(a.tzqjc_ljlx),'','' 
      from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='ծȯ';
  end if;
  --���ɹ�ֵ����1204�Ķ���������Ŀ�ļ�¼
  --����Ӧ����Ϣ�Ķ���������Ŀ��¼
  select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='ծȯ';
  if jlcount>0 then
    insert into tgz select rq,'120410','Ӧ����Ϣ-Ӧ��ծȯ��Ϣ','','',sum(a.tzqjc_ljlx),'','',sum(a.tzqjc_ljlx),'','' 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='ծȯ';
    insert into tgz select rq,'12041011','Ӧ����Ϣ-Ӧ��ծȯ��Ϣ-Ӧ���Ͻ���ծȯ��Ϣ','','',sum(a.tzqjc_ljlx),'','',sum(a.tzqjc_ljlx),'','' 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='ծȯ' and a.tzqjc_jysc='�Ϻ�';
       insert into tgz select rq,'12041033','Ӧ����Ϣ-Ӧ��ծȯ��Ϣ-Ӧ�����ծȯ��Ϣ','','',sum(a.tzqjc_ljlx),'','',sum(a.tzqjc_ljlx),'','' 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='ծȯ' and a.tzqjc_jysc='����';
  end if;
  /*select count(*) into jlcount from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='ծȯ' and a.tzqjc_jysc='����';
  if jlcount>0 then
    insert into tgz select rq,'110333','ծȯͶ��-���ծȯ',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='ծȯ' and a.tzqjc_jysc='����';
    insert into tgz select rq,'11033301','ծȯͶ��-���ծȯ-���ծȯ�ɱ�',sum(a.tzqjc_ljsl),'',sum(a.tzqjc_ljcb),'','',sum(a.tzqjc_ljcb)+sum(a.tzqjc_ljgz),'',sum(a.tzqjc_ljgz) 
       from tzqjc a where a.tzqjc_jyrq=rq and a.tzqjc_ywlb='ծȯ' and a.tzqjc_jysc='����';
  end if;*/
  --����Ӧ����Ϣ�ļ���Ŀ
  open scyslx(rq);
  fetch scyslx into dm5,mc5,ljlx5,sc5;
  while scyslx%found loop
    if sc5='�Ϻ�' then
     insert into tgz values(rq,'12041011'||dm5,'Ӧ����Ϣ-Ӧ��ծȯ��Ϣ-Ӧ���Ͻ���ծȯ��Ϣ-'||mc5,'','',ljlx5,'','',ljlx5,'','');
    elsif sc5='����'then
     insert into tgz values(rq,'12041033'||dm5,'Ӧ����Ϣ-Ӧ��ծȯ��Ϣ-Ӧ�����ծȯ��Ϣ-'||mc5,'','',ljlx5,'','',ljlx5,'','');      
    end if;
    fetch scyslx into dm5,mc5,ljlx5,sc5;
  end loop;
  close scyslx;
  -----------------------------------------------------------------------------------------
  --�����ʲ��ࡢ��ծ���ܼƣ��Լ��ʲ��ܾ�ֵ
  select sum(a.tgz_zcb),sum(a.tgz_zsz) into fse,ye 
    from tgz a where a.tgz_ywrq=rq and length(a.tgz_kmdm)=4 and a.tgz_kmdm like'1%';  
    insert into tgz(tgz_ywrq,tgz_kmmc,tgz_zcb,tgz_zsz)values(rq,'�ʲ����ܼ�',fse,ye);
    
  /*select count(*) into jlcount from tgz a where a.tgz_ywrq=rq and a.tgz_kmdm like '2%';  
    if jlcount>=0 then*/
      select sum(a.tgz_zcb),sum(a.tgz_zsz) into fse,ye 
        from tgz a where a.tgz_ywrq=rq and a.tgz_kmdm like '2%';
        insert into tgz(tgz_ywrq,tgz_kmmc,tgz_zcb,tgz_zsz)values(rq,'��ծ���ܼ�',fse,ye);
    /*else
        insert into tgz(tgz_ywrq,tgz_kmmc,tgz_zcb,tgz_zsz)values(rq,'��ծ���ܼ�',0,0);
    end if;*/
  select sum(a.tgz_zcb),sum(a.tgz_zsz) into fse,ye
    from tgz a where a.tgz_ywrq=rq and (a.tgz_kmdm='11020199' or a.tgz_kmdm='11023199' or a.tgz_kmdm='11031199');
    update tgz a set a.tgz_zcb=a.tgz_zcb+fse,a.tgz_zsz=a.tgz_zsz+ye where a.tgz_kmmc='�ʲ����ܼ�';
    
  select sum(a.tgz_zcb),sum(a.tgz_zsz) into fse,ye 
    from tgz a where a.tgz_ywrq=rq /*and length(a.tgz_kmdm)=4*/ and a.tgz_kmdm like'3%';  
      if fse>=0 then
        update tgz a set a.tgz_zcb=a.tgz_zcb+fse,a.tgz_zsz=a.tgz_zsz+ye where a.tgz_ywrq=rq and a.tgz_kmmc='�ʲ����ܼ�';
      else
        update tgz a set a.tgz_zcb=-a.tgz_zcb+fse,a.tgz_zsz=-a.tgz_zsz+ye where a.tgz_ywrq=rq and a.tgz_kmmc='��ծ���ܼ�'; 
      end if;
  select a.tgz_zcb+b.tgz_zcb,a.tgz_zsz+b.tgz_zsz into fse,ye 
    from tgz a,tgz b where a.tgz_ywrq=rq and b.tgz_ywrq=rq and a.tgz_kmmc='�ʲ����ܼ�'and b.tgz_kmmc='��ծ���ܼ�';
  
  select a.tgz_zcb,a.tgz_zsz into fse2,ye2 
    from tgz a where a.tgz_ywrq=rq-1 and a.tgz_kmmc='�ʲ��ܾ�ֵ';
    /*select sum(a.tgz_zcb),sum(a.tgz_zsz) into zcb3,zsz3
      from tgz a where a.tgz_ywrq=rq 
        and (a.tgz_kmdm='11020101' or a.tgz_kmdm='11023101' 
        or a.tgz_kmdm='11020301' or a.tgz_kmdm='11023301' 
        or a.tgz_kmdm='11031101' or a.tgz_kmdm='11033301') ;*/
    insert into tgz(tgz_ywrq,tgz_kmmc,tgz_zcb,tgz_zsz)values(rq,'�ʲ��ܾ�ֵ',fse+fse2,ye+ye2);
  /*select a.tgz_zcb,a.tgz_zsz into fse,ye 
    from tgz a where a.tgz_ywrq=rq-1 and a.tgz_kmmc='�ʲ��ܾ�ֵ';
    update tgz a set a.tgz_zcb=a.tgz_zcb+fse,a.tgz_zsz=a.tgz_zsz+ye where a.tgz_kmmc='�ʲ��ܾ�ֵ';*/
  --�ʲ��ܾ�ֵ������󣬿���������еĳɱ�ռ��ֵ����ֵռ��ֵ�İٷֱ�
  update tgz a set a.tgz_cbzjz=round(100*a.tgz_zcb/(fse+fse2),4),
                   a.tgz_szzjz=round(100*a.tgz_zsz/(ye+ye2),4) where a.tgz_ywrq=rq;
commit;
end scgzb;
/
