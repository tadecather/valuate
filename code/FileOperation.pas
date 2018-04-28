unit FileOperation;

interface

uses  SysUtils, Variants, Classes,Windows, Messages, Dialogs, DB, ADODB,
       XMLDoc, xmldom, XMLIntf, msxmldom;
    function getStringOfDate(date : TDateTime): String;
    function getStringOfDateNoYear(date : TDateTime): String;
    function jkFileToDataBase(jkType: String; filePath,fileName: String;ywrq: TDateTime): Boolean;

implementation

uses unit2;

function getStringOfDate(date : TDateTime): String;
begin
  Result := FormatDatetime('YYYYMMDD',date);
end;
function getStringOfDateNoYear(date : TDateTime): String;
begin
  Result := FormatDatetime('MMDD',date);
end;

// ���ӿ��ļ��е����ݶ��뵽�ӿڱ���ȥ
function jkFileToDataBase(jkType: String; filePath,fileName: String; ywrq: TDateTime): Boolean;
Var qry1ConnectString, qry2ConnectString, rq, lineStr, securityType: String;
    qry1, qry2: TADOQuery;
    txtFile : TextFile;
    txtLines:TStringList;
    xmlDocument: TXMLDocument;
    node: IXMLNode;
    nodeList: IXMLNodeList;
    i, xmlNodeCount : Integer;
begin
  // �������ݿ�����
  qry1ConnectString := MainForm.conMainForm.ConnectionString;
//  qry1ConnectString := 'Provider=OraOLEDB.Oracle.1;Password=bysj;Persist Security Info=True;User ID=bysj;Data Source=orcl';
  qry2ConnectString := 'Provider=Microsoft.Jet.OLEDB.4.0;Extended Properties=dBase 5.0;Persist Security Info=False;Data Source=';
  qry1 := TADOQuery.Create(MainForm);
  qry2 := TADOQuery.Create(MainForm);
  qry1.ConnectionString := qry1ConnectString;
  if(jkType = '�Ϻ�֤ȯ��Ϣ�ӿ�') then
  begin
    // ɾ��ҵ���������е�����
    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from TJK_SHZQXX where D_YWRQ=:c');
      Parameters.ParamByName('c').Value := FormatDatetime('YYYY/MM/DD', ywrq);
      ExecSQL;
    end;

    // �����ļ�
    AssignFile( txtFile, filePath + fileName);
    // ֻ����ʽ���ļ�
    Reset(txtFile);
    // ����ÿ�еķָ����
    txtLines := TStringList.Create;
    txtLines.Delimiter := '|';
    while Not EOF(txtFile) do
    begin
      // ��ȡһ��
      Readln(txtFile, lineStr);
      // ʹ�� | ���зָ�
      txtLines.DelimitedText := lineStr;
      with qry1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into tjk_shzqxx Values(:a,:b,:c,'''',:d,:e,:f)');

        Parameters.ParamByName('a').Value:=txtLines[0];
        // �����ֶ�ȷ��֤ȯ���
        if ( trim(txtLines[7]) = 'ES') then
          Parameters.ParamByName('b').Value:='��Ʊ'
        else if( trim(txtLines[7]) = 'EU') then
          Parameters.ParamByName('b').Value:='����'
        else if( trim(txtLines[7]) = 'D') then
        begin
          if(trim(txtLines[8]) = 'CRP') or  (trim(txtLines[8]) = 'BRP') or (trim(txtLines[8]) = 'ORP') then
            Parameters.ParamByName('b').Value:='�ع�'
          else
            Parameters.ParamByName('b').Value:='ծȯ';
        end
        else if( trim(txtLines[7]) = 'RWS') then
          Parameters.ParamByName('b').Value:='Ȩ֤'
        else if( trim(txtLines[7]) = 'FF') then
          Parameters.ParamByName('b').Value:='�ڻ�'
        else Parameters.ParamByName('b').Value:='����';
        Parameters.ParamByName('c').Value:=txtLines[3];

        // �е�������û����ֵ��
        if (trim(txtLines[10]) = '') then
          Parameters.ParamByName('d').Value:=0
        else
          Parameters.ParamByName('d').Value:=StrToFloat(trim(txtLines[10]));
        // �и�����Ȼ��תΪ datetime ����
        Parameters.ParamByName('e').Value:=VarToDateTime(copy(txtLines[13],1,4)+ '-'
                          + copy(txtLines[13],5,2) + '-' + copy(txtLines[13],7,2));
        Parameters.ParamByName('f').Value:= FormatDatetime('YYYY/MM/DD', ywrq);
        ExecSQL;
      end;
    end;
    CloseFile(txtFile);
    Result := True;
  end
  else if(jkType = '����֤ȯ��Ϣ�ӿ�') then
  begin
    // ɾ��ҵ���������е�����
    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from tjk_szzqxx where d_ywrq=:c');
      Parameters.ParamByName('c').Value := FormatDatetime('YYYY/MM/DD', ywrq);
      ExecSQL;
    end;

    // ����XML �ļ�
    // 1. �����ļ�
    xmlDocument := TXMLDocument.Create(MainForm);
    xmlDocument.LoadFromFile(filePath + fileName);
    xmlNodeCount := xmlDocument.DocumentElement.ChildNodes.Count;
    nodeList := xmlDocument.DocumentElement.ChildNodes;
    with qry1 do
    begin
      for i := 0 to xmlNodeCount-1 do
      begin
        node := nodeList[i];
        Close;
        SQL.Clear;
        SQL.Add('insert into tjk_szzqxx values(:a,:b,:c,'''',:d,:e,:f)');
        Parameters.ParamByName('a').Value:=trim(node.ChildNodes['SecurityID'].Text);
        // ����֤ȯ���͵��ж�
        securityType := node.ChildNodes['SecurityType'].Text;
        if (securityType = '1') or (securityType = '2') or (securityType = '3') or (securityType = '4') then
        begin
          Parameters.ParamByName('b').Value:='��Ʊ';
          // ����ȡ��������ֶ�
//          ShowMessage(node.ChildNodes['StockParams'].ChildNodes['IndustryClassification'].Text);
        end
        else if(securityType = '5') or (securityType = '6') or (securityType = '7') or
             (securityType = '8') or (securityType = '9') or (securityType = '10') or
              (securityType = '11') then
          Parameters.ParamByName('b').Value:='ծȯ'
        else if(securityType = '14') or (securityType = '15') or (securityType = '16') or
             (securityType = '17') or (securityType = '19') or (securityType = '20') or
             (securityType = '23') or (securityType = '24') or (securityType = '25') or
              (securityType = '26') then
          Parameters.ParamByName('b').Value:='����'
        else if(securityType = '12') then
          Parameters.ParamByName('b').Value:='�ع�'
        else if(securityType = '12') then
          Parameters.ParamByName('b').Value:='Ȩ֤'
        else Parameters.ParamByName('b').Value:='����';

        Parameters.ParamByName('c').Value:=trim(node.ChildNodes['Symbol'].Text);
        Parameters.ParamByName('d').Value:=StrToFloat(node.ChildNodes['ParValue'].Text);
        rq := node.ChildNodes['ListDate'].Text;
        Parameters.ParamByName('e').Value:=VarToDateTime(copy(rq,1,4)+ '-'
                          + copy(rq,5,2) + '-' + copy(rq,7,2));
        Parameters.ParamByName('f').Value := FormatDatetime('YYYY/MM/DD', ywrq);
        ExecSQL;
      end;
    end;
    xmlDocument.Destroy;
    Result := True;
  end
  else if(jkType = '�Ϻ�����ӿ�') then
  begin
    // ɾ��ҵ���������е�����
    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from tjk_mktdt00 where d_ywrq=:c');
      Parameters.ParamByName('c').Value := FormatDatetime('YYYY/MM/DD', ywrq);
      ExecSQL;
    end;

    // �����ļ�
    AssignFile( txtFile, filePath + fileName);
    // ֻ����ʽ���ļ�
    Reset(txtFile);
    // ����ÿ�еķָ����
    txtLines := TStringList.Create;
    txtLines.Delimiter := '|';
    while Not EOF(txtFile) do
    begin
      // ��ȡһ��
      Readln(txtFile, lineStr);
      // ʹ�� | ���зָ�
      txtLines.DelimitedText := lineStr;
      // ѡȡ��Ҫ����
      if(txtLines[0] = 'MD002')or (txtLines[0] = 'MD003') or(txtLines[0] = 'MD004')  then
      begin
        with qry1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into tjk_mktdt00 Values(:a,:b,:c)');
          // ÿ����¼ֻ��Ҫ ��2 �� �� 11 �е�����
          Parameters.ParamByName('a').Value:=txtLines[1];
          Parameters.ParamByName('b').Value:=txtLines[10];
          Parameters.ParamByName('c').Value := FormatDatetime('YYYY/MM/DD', ywrq);
          ExecSQL;
        end;
      end;
    end;
    CloseFile(txtFile);
    Result := True;
  end
  else if(jkType = '��������ӿ�') then
  begin
    // ɾ��ҵ���������е�����
    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from tjk_cashsecurity where d_ywrq=:c');
      Parameters.ParamByName('c').Value := FormatDatetime('YYYY/MM/DD', ywrq);
      ExecSQL;
    end;

    // ����XML �ļ�
    // 1. �����ļ�
    xmlDocument := TXMLDocument.Create(MainForm);
    xmlDocument.LoadFromFile(filePath + fileName);
    xmlNodeCount := xmlDocument.DocumentElement.ChildNodes.Count;
    nodeList := xmlDocument.DocumentElement.ChildNodes;
    with qry1 do
    begin
      for i := 0 to xmlNodeCount-1 do
      begin
        node := nodeList[i];
        Close;
        SQL.Clear;
        SQL.Add('insert into tjk_cashsecurity values(:a,:b,:c)');
        Parameters.ParamByName('a').Value:=trim(node.ChildNodes['SecurityID'].Text);
        // �е�ծȯ����û�н��ף���ô��ȡǰһ�յ����ݽ��е���
        if( node.ChildNodes['ClosePx'].Text <> '') then
          Parameters.ParamByName('b').Value:= StrToFloat(node.ChildNodes['ClosePx'].Text)
        else
          Parameters.ParamByName('b').Value:= StrToFloat(node.ChildNodes['PrevClosePx'].Text);
        Parameters.ParamByName('c').Value := FormatDatetime('YYYY/MM/DD', ywrq);
        ExecSQL;
      end;
    end;
    xmlDocument.Destroy;
    Result := True;
  end
  else if(jkType = '�Ϻ����׽ӿ�') then
  begin
    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from tjk_gh where d_ywrq=:a');
      Parameters.ParamByName('a').Value := FormatDatetime('YYYY/MM/DD', ywrq);
      ExecSQL;
    end;
    // ���ò�ѯ���ݵ�ADO�� ConnectString
    qry2.ConnectionString := qry2ConnectString + filePath;
    with qry2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from ' + fileName);
      Open;
      while not eof do
      begin
        with qry1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into tjk_gh Values(:a,:b,:c,:d,:e,:f,:g)');
          Parameters.ParamByName('a').Value := qry2.Fields [7].Text;
          Parameters.ParamByName('b').Value := StrToInt(qry2.Fields[5].Text);
          Parameters.ParamByName('c').Value := StrToFloat(qry2.Fields[10].Text);
          Parameters.ParamByName('d').Value := StrToFloat(qry2.Fields[11].Text);
          if(qry2.Fields[13].Text = 'B')then
            Parameters.ParamByName('e').Value := '����'
          else if(qry2.Fields[13].Text = 'S')then
           Parameters.ParamByName('e').Value := '����';
          rq := qry2.Fields[2].Text;
          Parameters.ParamByName('f').Value := VarToDateTime(copy(rq,1,4)+ '-' + copy(rq,5,2) + '-' + copy(rq,7,2));
          Parameters.ParamByName('g').Value := FormatDatetime('YYYY/MM/DD', ywrq);
          ExecSQL;
        end;
        next;
      end;
    end;
    Result := True;
  end
  else if(jkType = '���ڽ��׽ӿ�') then
  begin
    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from tjk_sjsmx1 where d_ywrq=:a');
      Parameters.ParamByName('a').Value := FormatDatetime('YYYY/MM/DD', ywrq);
      ExecSQL;
    end;
    // ���ò�ѯ���ݵ�ADO�� ConnectString
    qry2.ConnectionString := qry2ConnectString + filePath;
    with qry2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from ' + fileName);
      Open;
      while not eof do
      begin
        with qry1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into tjk_sjsmx1 Values(:a,:b,:c,:d,:e,:f,:g)');
          Parameters.ParamByName('a').Value := qry2.Fields [4].Text;
          Parameters.ParamByName('b').Value := StrToInt(qry2.Fields[12].Text);
          Parameters.ParamByName('c').Value := StrToFloat(qry2.Fields[14].Text);
          Parameters.ParamByName('d').Value := Abs(StrToFloat(qry2.Fields[23].Text));
          rq := qry2.Fields[34].Text;
          Parameters.ParamByName('e').Value := VarToDateTime(copy(rq,1,4)+ '-' + copy(rq,5,2) + '-' + copy(rq,7,2));
          if(StrToFloat(qry2.Fields[23].Text) < 0)then
            Parameters.ParamByName('f').Value := '����'
          else
           Parameters.ParamByName('f').Value := '����';
          Parameters.ParamByName('g').Value := FormatDatetime('YYYY/MM/DD', ywrq);
          ExecSQL;
        end;
        next;
      end;
    end;
    Result := True;
  end
  else if(jkType = '�Ϻ�������ϸ') then
  begin
    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from tjk_jsmx where d_ywrq=:a');
      Parameters.ParamByName('a').Value := FormatDatetime('YYYY/MM/DD', ywrq);
      ExecSQL;
    end;
    // ���ò�ѯ���ݵ�ADO�� ConnectString
    qry2.ConnectionString := qry2ConnectString + filePath;
    with qry2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from ' + fileName);
      Open;
      while not eof do
      begin
        with qry1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into tjk_jsmx Values(:a,:b,:c,:d,:e,:f,:g,:h)');
          Parameters.ParamByName('a').Value := qry2.Fields[1].Text;
          rq := qry2.Fields[12].Text;
          Parameters.ParamByName('b').Value := VarToDateTime(copy(rq,1,4)+ '-' + copy(rq,5,2) + '-' + copy(rq,7,2));
          // �е�����û�еڶ���֤ȯ����
          if qry2.Fields[24].Text = '' then
            Parameters.ParamByName('c').Value := qry2.Fields[23].Text
          else
            Parameters.ParamByName('c').Value := qry2.Fields[24].Text;
          Parameters.ParamByName('d').Value := StrToInt(qry2.Fields[31].Text);
          Parameters.ParamByName('e').Value := StrToFloat(qry2.Fields[34].Text);
          Parameters.ParamByName('f').Value := StrToFloat(qry2.Fields[36].Text);
          Parameters.ParamByName('g').Value := qry2.Fields[25].Text;
          Parameters.ParamByName('h').Value := FormatDatetime('YYYY/MM/DD', ywrq);
          ExecSQL;
        end;
        next;
      end;
    end;
    Result := True;
  end
  else if(jkType = '�Ϻ�֤ȯ��') then
  begin
    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from tjk_zqbd where d_ywrq=:a');
      Parameters.ParamByName('a').Value := FormatDatetime('YYYY/MM/DD', ywrq);
      ExecSQL;
    end;
    // ���ò�ѯ���ݵ�ADO�� ConnectString
    qry2.ConnectionString := qry2ConnectString + filePath;
    with qry2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from ' + fileName);
      Open;
      while not eof do
      begin
        with qry1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into tjk_zqbd Values(:a,:b,:c,:d,:e,:f)');
          Parameters.ParamByName('a').Value := qry2.Fields[4].Text;
          Parameters.ParamByName('b').Value := qry2.Fields[5].Text;
          Parameters.ParamByName('c').Value := StrToInt(qry2.Fields[9].Text);
          Parameters.ParamByName('d').Value := qry2.Fields[7].Text;
          rq := qry2.Fields[11].Text;
          Parameters.ParamByName('e').Value := VarToDateTime(copy(rq,1,4)+ '-' + copy(rq,5,2) + '-' + copy(rq,7,2));
          Parameters.ParamByName('f').Value := FormatDatetime('YYYY/MM/DD', ywrq);
          ExecSQL;
        end;
        next;
      end;
    end;
    Result := True;
  end
  else if(jkType = '������б�') then
  begin
    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from tjk_sjsfx where d_ywrq=:a');
      Parameters.ParamByName('a').Value := FormatDatetime('YYYY/MM/DD', ywrq);
      ExecSQL;
    end;
    // ���ò�ѯ���ݵ�ADO�� ConnectString
    qry2.ConnectionString := qry2ConnectString + filePath;
    with qry2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from ' + fileName);
      Open;
      while not eof do
      begin
        with qry1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into tjk_sjsfx Values(:a,:b,:c,:d,:e,:f)');
          Parameters.ParamByName('a').Value := qry2.Fields[1].Text;
          Parameters.ParamByName('b').Value := qry2.Fields[3].Text;
          Parameters.ParamByName('c').Value := StrToInt(qry2.Fields[7].Text);
          Parameters.ParamByName('d').Value := StrToFloat(qry2.Fields[8].Text);
          rq := qry2.Fields[10].Text;
          Parameters.ParamByName('e').Value := VarToDateTime(copy(rq,1,4)+ '-' + copy(rq,5,2) + '-' + copy(rq,7,2));
          Parameters.ParamByName('f').Value := FormatDatetime('YYYY/MM/DD', ywrq);
          ExecSQL;
        end;
        next;
      end;
    end;
    Result := True;
  end
  else if(jkType = '��������') then
  begin
    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from tjk_sjsjg where d_ywrq=:a');
      Parameters.ParamByName('a').Value := FormatDatetime('YYYY/MM/DD', ywrq);
      ExecSQL;
    end;
    // ���ò�ѯ���ݵ�ADO�� ConnectString
    qry2.ConnectionString := qry2ConnectString + filePath;
    with qry2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from ' + fileName);
      Open;
      while not eof do
      begin
        with qry1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into tjk_sjsjg Values(:a,:b,:c,:d,:e,:f,:g)');
          Parameters.ParamByName('a').Value := qry2.Fields[4].Text;
          Parameters.ParamByName('b').Value := qry2.Fields[3].Text;
          Parameters.ParamByName('c').Value := StrToInt(qry2.Fields[14].Text);
          Parameters.ParamByName('d').Value := StrToFloat(qry2.Fields[15].Text);
          Parameters.ParamByName('e').Value := StrToFloat(qry2.Fields[33].Text);
          rq := qry2.Fields[37].Text;
          Parameters.ParamByName('f').Value := VarToDateTime(copy(rq,1,4)+ '-' + copy(rq,5,2) + '-' + copy(rq,7,2));
          Parameters.ParamByName('g').Value := FormatDatetime('YYYY/MM/DD', ywrq);
          ExecSQL;
        end;
        next;
      end;
    end;
    Result := True;
  end;

  qry1.Destroy;
  qry2.Destroy;



end;

end.