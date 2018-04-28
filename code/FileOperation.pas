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

// 将接口文件中的数据读入到接口表中去
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
  // 设置数据库连接
  qry1ConnectString := MainForm.conMainForm.ConnectionString;
//  qry1ConnectString := 'Provider=OraOLEDB.Oracle.1;Password=bysj;Persist Security Info=True;User ID=bysj;Data Source=orcl';
  qry2ConnectString := 'Provider=Microsoft.Jet.OLEDB.4.0;Extended Properties=dBase 5.0;Persist Security Info=False;Data Source=';
  qry1 := TADOQuery.Create(MainForm);
  qry2 := TADOQuery.Create(MainForm);
  qry1.ConnectionString := qry1ConnectString;
  if(jkType = '上海证券信息接口') then
  begin
    // 删除业务日期所有的数据
    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from TJK_SHZQXX where D_YWRQ=:c');
      Parameters.ParamByName('c').Value := FormatDatetime('YYYY/MM/DD', ywrq);
      ExecSQL;
    end;

    // 关联文件
    AssignFile( txtFile, filePath + fileName);
    // 只读方式打开文件
    Reset(txtFile);
    // 设置每行的分割符号
    txtLines := TStringList.Create;
    txtLines.Delimiter := '|';
    while Not EOF(txtFile) do
    begin
      // 读取一行
      Readln(txtFile, lineStr);
      // 使用 | 进行分割
      txtLines.DelimitedText := lineStr;
      with qry1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into tjk_shzqxx Values(:a,:b,:c,'''',:d,:e,:f)');

        Parameters.ParamByName('a').Value:=txtLines[0];
        // 根据字段确定证券类别
        if ( trim(txtLines[7]) = 'ES') then
          Parameters.ParamByName('b').Value:='股票'
        else if( trim(txtLines[7]) = 'EU') then
          Parameters.ParamByName('b').Value:='基金'
        else if( trim(txtLines[7]) = 'D') then
        begin
          if(trim(txtLines[8]) = 'CRP') or  (trim(txtLines[8]) = 'BRP') or (trim(txtLines[8]) = 'ORP') then
            Parameters.ParamByName('b').Value:='回购'
          else
            Parameters.ParamByName('b').Value:='债券';
        end
        else if( trim(txtLines[7]) = 'RWS') then
          Parameters.ParamByName('b').Value:='权证'
        else if( trim(txtLines[7]) = 'FF') then
          Parameters.ParamByName('b').Value:='期货'
        else Parameters.ParamByName('b').Value:='其他';
        Parameters.ParamByName('c').Value:=txtLines[3];

        // 有的数据是没有面值的
        if (trim(txtLines[10]) = '') then
          Parameters.ParamByName('d').Value:=0
        else
          Parameters.ParamByName('d').Value:=StrToFloat(trim(txtLines[10]));
        // 切割日期然后转为 datetime 类型
        Parameters.ParamByName('e').Value:=VarToDateTime(copy(txtLines[13],1,4)+ '-'
                          + copy(txtLines[13],5,2) + '-' + copy(txtLines[13],7,2));
        Parameters.ParamByName('f').Value:= FormatDatetime('YYYY/MM/DD', ywrq);
        ExecSQL;
      end;
    end;
    CloseFile(txtFile);
    Result := True;
  end
  else if(jkType = '深圳证券信息接口') then
  begin
    // 删除业务日期所有的数据
    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from tjk_szzqxx where d_ywrq=:c');
      Parameters.ParamByName('c').Value := FormatDatetime('YYYY/MM/DD', ywrq);
      ExecSQL;
    end;

    // 解析XML 文件
    // 1. 载入文件
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
        // 进行证券类型的判断
        securityType := node.ChildNodes['SecurityType'].Text;
        if (securityType = '1') or (securityType = '2') or (securityType = '3') or (securityType = '4') then
        begin
          Parameters.ParamByName('b').Value:='股票';
          // 可以取到具体的字段
//          ShowMessage(node.ChildNodes['StockParams'].ChildNodes['IndustryClassification'].Text);
        end
        else if(securityType = '5') or (securityType = '6') or (securityType = '7') or
             (securityType = '8') or (securityType = '9') or (securityType = '10') or
              (securityType = '11') then
          Parameters.ParamByName('b').Value:='债券'
        else if(securityType = '14') or (securityType = '15') or (securityType = '16') or
             (securityType = '17') or (securityType = '19') or (securityType = '20') or
             (securityType = '23') or (securityType = '24') or (securityType = '25') or
              (securityType = '26') then
          Parameters.ParamByName('b').Value:='基金'
        else if(securityType = '12') then
          Parameters.ParamByName('b').Value:='回购'
        else if(securityType = '12') then
          Parameters.ParamByName('b').Value:='权证'
        else Parameters.ParamByName('b').Value:='其他';

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
  else if(jkType = '上海行情接口') then
  begin
    // 删除业务日期所有的数据
    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from tjk_mktdt00 where d_ywrq=:c');
      Parameters.ParamByName('c').Value := FormatDatetime('YYYY/MM/DD', ywrq);
      ExecSQL;
    end;

    // 关联文件
    AssignFile( txtFile, filePath + fileName);
    // 只读方式打开文件
    Reset(txtFile);
    // 设置每行的分割符号
    txtLines := TStringList.Create;
    txtLines.Delimiter := '|';
    while Not EOF(txtFile) do
    begin
      // 读取一行
      Readln(txtFile, lineStr);
      // 使用 | 进行分割
      txtLines.DelimitedText := lineStr;
      // 选取需要的行
      if(txtLines[0] = 'MD002')or (txtLines[0] = 'MD003') or(txtLines[0] = 'MD004')  then
      begin
        with qry1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into tjk_mktdt00 Values(:a,:b,:c)');
          // 每条记录只需要 第2 和 第 11 列的数据
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
  else if(jkType = '深圳行情接口') then
  begin
    // 删除业务日期所有的数据
    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from tjk_cashsecurity where d_ywrq=:c');
      Parameters.ParamByName('c').Value := FormatDatetime('YYYY/MM/DD', ywrq);
      ExecSQL;
    end;

    // 解析XML 文件
    // 1. 载入文件
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
        // 有的债券今日没有交易，那么就取前一日的数据进行导入
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
  else if(jkType = '上海交易接口') then
  begin
    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from tjk_gh where d_ywrq=:a');
      Parameters.ParamByName('a').Value := FormatDatetime('YYYY/MM/DD', ywrq);
      ExecSQL;
    end;
    // 设置查询数据的ADO的 ConnectString
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
            Parameters.ParamByName('e').Value := '买入'
          else if(qry2.Fields[13].Text = 'S')then
           Parameters.ParamByName('e').Value := '卖出';
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
  else if(jkType = '深圳交易接口') then
  begin
    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from tjk_sjsmx1 where d_ywrq=:a');
      Parameters.ParamByName('a').Value := FormatDatetime('YYYY/MM/DD', ywrq);
      ExecSQL;
    end;
    // 设置查询数据的ADO的 ConnectString
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
          Parameters.ParamByName('d').Value := StrToFloat(qry2.Fields[23].Text);
          rq := qry2.Fields[34].Text;
          Parameters.ParamByName('e').Value := VarToDateTime(copy(rq,1,4)+ '-' + copy(rq,5,2) + '-' + copy(rq,7,2));
          if(StrToFloat(qry2.Fields[12].Text) < 0)then
            Parameters.ParamByName('f').Value := '卖出'
          else
           Parameters.ParamByName('f').Value := '买入';
          Parameters.ParamByName('g').Value := FormatDatetime('YYYY/MM/DD', ywrq);
          ExecSQL;
        end;
        next;
      end;
    end;
    Result := True;
  end
  else if(jkType = '上海结算明细') then
  begin
    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from tjk_jsmx where d_ywrq=:a');
      Parameters.ParamByName('a').Value := FormatDatetime('YYYY/MM/DD', ywrq);
      ExecSQL;
    end;
    // 设置查询数据的ADO的 ConnectString
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
          // 有的数据没有第二个证券代码
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
  else if(jkType = '上海证券表') then
  begin
    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from tjk_zqbd where d_ywrq=:a');
      Parameters.ParamByName('a').Value := FormatDatetime('YYYY/MM/DD', ywrq);
      ExecSQL;
    end;
    // 设置查询数据的ADO的 ConnectString
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
  else if(jkType = '深交所发行表') then
  begin
    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from tjk_sjsfx where d_ywrq=:a');
      Parameters.ParamByName('a').Value := FormatDatetime('YYYY/MM/DD', ywrq);
      ExecSQL;
    end;
    // 设置查询数据的ADO的 ConnectString
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
  else if(jkType = '深交所结果表') then
  begin
    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from tjk_sjsjg where d_ywrq=:a');
      Parameters.ParamByName('a').Value := FormatDatetime('YYYY/MM/DD', ywrq);
      ExecSQL;
    end;
    // 设置查询数据的ADO的 ConnectString
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
