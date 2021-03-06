unit ZQYWDXForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ComCtrls;

type
  TZQYWDXForm1 = class(TForm)
    lblDXZQDM: TLabel;
    lbDXJYRQ: TLabel;
    lblDXJYSC: TLabel;
    lblDXZQMC: TLabel;
    edtDXZQDM: TEdit;
    dtpDXJYRQ: TDateTimePicker;
    edtDXZQMC: TEdit;
    cbbDXJYSC: TComboBox;
    lblDXZCLX: TLabel;
    edtDXZCLX: TEdit;
    btnDXSure: TButton;
    btnDXCancle: TButton;
    qryDXYW: TADOQuery;
    cbbZQDXZQDM: TComboBox;
    procedure btnDXCancleClick(Sender: TObject);
    procedure btnDXSureClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure EditInitContent(Sender:TObject);
    procedure SelectZQXX(Sender: TObject);
    procedure AutoZQXX(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZQYWDXForm1: TZQYWDXForm1;

implementation

uses Unit2;

{$R *.dfm}





procedure TZQYWDXForm1.btnDXCancleClick(Sender: TObject);
begin
  Close;
end;

// 确定按钮作用
procedure TZQYWDXForm1.btnDXSureClick(Sender: TObject);
begin
  if  (Trim(edtDXZQMC.Text) = '')  or (Trim(edtDXZCLX.Text) = '') then
  begin
    ShowMessage('请确保所有数据不为空！');
    Exit;
  end;
  with qryDXYW do
  begin
    Close;
    SQL.Clear;
    if (Caption='红利业务-除权-修改') then
    begin
      SQL.Add('update THL set THL_YWRQ=:a,THL_FHJE=:b where THL_ZQDM=:c and THL_JYSC=:d and THL_YWLB=''红利除权''');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY/MM/DD', dtpDXJYRQ.DateTime);
      Parameters.ParamByName('b').Value:=StrToFloat(edtDXZCLX.Text);
      Parameters.ParamByName('c').Value:=edtDXZQDM.Text;
      Parameters.ParamByName('d').Value:=cbbDXJYSC.Text;
    end
    else if (Caption='红利业务-到账-修改') then
    begin
      SQL.Add('update THL set THL_YWRQ=:a,THL_FHJE=:b where THL_ZQDM=:c and THL_JYSC=:d and THL_YWLB=''红利到账''');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY/MM/DD', dtpDXJYRQ.DateTime);
      Parameters.ParamByName('b').Value:=StrToFloat(edtDXZCLX.Text);
      Parameters.ParamByName('c').Value:=edtDXZQDM.Text;
      Parameters.ParamByName('d').Value:=cbbDXJYSC.Text;
    end
    else if (Caption='红股到账-修改') then
    begin
      SQL.Add('update THL set THL_YWRQ=:a,THL_DJSL=:b where THL_ZQDM=:c and THL_JYSC=:d and THL_YWLB=''红股到账''');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY/MM/DD', dtpDXJYRQ.DateTime);
      Parameters.ParamByName('b').Value:=StrToInt(edtDXZCLX.Text);
      Parameters.ParamByName('c').Value:=edtDXZQDM.Text;
      Parameters.ParamByName('d').Value:=cbbDXJYSC.Text;
    end
    else if (Caption='兑息业务-转出-修改') then
    begin
      SQL.Add('update TZQJY set TZQJY_JYRQ=:a,TZQJY_SQLX=:b where TZQJY_ZQDM=:c and TZQJY_JYSC=:d and TZQJY_JYFX=''兑息转出''');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY/MM/DD', dtpDXJYRQ.DateTime);
      Parameters.ParamByName('b').Value:=StrToFloat(edtDXZCLX.Text);
      Parameters.ParamByName('c').Value:=edtDXZQDM.Text;
      Parameters.ParamByName('d').Value:=cbbDXJYSC.Text;
    end
    else if (Caption='兑息业务-到账-修改') then
    begin
      SQL.Add('update TZQJY set TZQJY_JYRQ=:a,TZQJY_SQLX=:b where TZQJY_ZQDM=:c and TZQJY_JYSC=:d and TZQJY_JYFX=''兑息到账''');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY/MM/DD', dtpDXJYRQ.DateTime);
      Parameters.ParamByName('b').Value:=StrToFloat(edtDXZCLX.Text);
      Parameters.ParamByName('c').Value:=edtDXZQDM.Text;
      Parameters.ParamByName('d').Value:=cbbDXJYSC.Text;
    end
    else if(Caption='红利业务-除权-新增') then
    begin
      if (Trim(edtDXZQDM.Text) = '') or (Trim(cbbDXJYSC.Text) = '') then
      begin
        ShowMessage('请确保所有数据不为空！');
        Exit;
      end;
      SQL.Add('insert into THL(THL_ZQDM,THL_ZQMC,THL_YWRQ,THL_YWLB,THL_JYSC,THL_FHJE) '+
            ' Values(:c,:e,:a,''红利除权'',:d,:b)');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY/MM/DD', dtpDXJYRQ.DateTime);
      Parameters.ParamByName('b').Value:=StrToFloat(edtDXZCLX.Text);
      Parameters.ParamByName('c').Value:=edtDXZQDM.Text;
      Parameters.ParamByName('d').Value:=cbbDXJYSC.Text;
      Parameters.ParamByName('e').Value:=edtDXZQMC.Text;
    end
    else if(Caption='红利业务-到账-新增') then
    begin
      if (Trim(edtDXZQDM.Text) = '') or (Trim(cbbDXJYSC.Text) = '') then
      begin
        ShowMessage('请确保所有数据不为空！');
        Exit;
      end;
      SQL.Add('insert into THL(THL_ZQDM,THL_ZQMC,THL_YWRQ,THL_YWLB,THL_JYSC,THL_FHJE) '+
            ' Values(:c,:e,:a,''红利到账'',:d,:b)');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY/MM/DD', dtpDXJYRQ.DateTime);
      Parameters.ParamByName('b').Value:=StrToFloat(edtDXZCLX.Text);
      Parameters.ParamByName('c').Value:=edtDXZQDM.Text;
      Parameters.ParamByName('d').Value:=cbbDXJYSC.Text;
      Parameters.ParamByName('e').Value:=edtDXZQMC.Text;
    end
    else if(Caption='红股到账-新增') then
    begin
      if (Trim(edtDXZQDM.Text) = '') or (Trim(cbbDXJYSC.Text) = '') then
      begin
        ShowMessage('请确保所有数据不为空！');
        Exit;
      end;
      SQL.Add('insert into THL(THL_ZQDM,THL_ZQMC,THL_YWRQ,THL_DZRQ,THL_YWLB,THL_JYSC,THL_DJSL) '+
            ' Values(:c,:e,:a,:f,''红股到账'',:d,:b)');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY/MM/DD', dtpDXJYRQ.DateTime);
      Parameters.ParamByName('b').Value:=StrToInt(edtDXZCLX.Text);
      Parameters.ParamByName('c').Value:=edtDXZQDM.Text;
      Parameters.ParamByName('d').Value:=cbbDXJYSC.Text;
      Parameters.ParamByName('e').Value:=edtDXZQMC.Text;
      Parameters.ParamByName('f').Value:=FormatDatetime('YYYY/MM/DD', dtpDXJYRQ.DateTime + 1);
    end
    else if(Caption='兑息业务-转出-新增') then
    begin
      if (Trim(edtDXZQDM.Text) = '') or (Trim(cbbDXJYSC.Text) = '') then
      begin
        ShowMessage('请确保所有数据不为空！');
        Exit;
      end;
      SQL.Add('insert into TZQJY(TZQJY_ZQDM,TZQJY_ZQMC,TZQJY_JYRQ,TZQJY_JYFX,'+
              'TZQJY_JYSC,TZQJY_SQLX,TZQJY_YWRQ,TZQJY_CJJG,TZQJY_CJJE,TZQJY_CJSL)'+
               ' Values(:c,:e,:a,''兑息转出'',:d,:b,:f,0,0,0)');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY/MM/DD', dtpDXJYRQ.DateTime);
      Parameters.ParamByName('b').Value:=StrToFloat(edtDXZCLX.Text);
      Parameters.ParamByName('c').Value:=edtDXZQDM.Text;
      Parameters.ParamByName('d').Value:=cbbDXJYSC.Text;
      Parameters.ParamByName('e').Value:=edtDXZQMC.Text;
      Parameters.ParamByName('f').Value:=FormatDatetime('YYYY/MM/DD', MainForm.dtpMainForm.DateTime);
    end
    else if(Caption='兑息业务-到账-新增') then
    begin
      if (Trim(edtDXZQDM.Text) = '') or (Trim(cbbDXJYSC.Text) = '') then
      begin
        ShowMessage('请确保所有数据不为空！');
        Exit;
      end;
      SQL.Add('insert into TZQJY(TZQJY_ZQDM,TZQJY_ZQMC,TZQJY_JYRQ,TZQJY_JYFX,'+
              'TZQJY_JYSC,TZQJY_SQLX,TZQJY_YWRQ,TZQJY_CJJG,TZQJY_CJJE,TZQJY_CJSL)'+
               ' Values(:c,:e,:a,''兑息到账'',:d,:b,:f,0,0,0)');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY/MM/DD', dtpDXJYRQ.DateTime);
      Parameters.ParamByName('b').Value:=StrToFloat(edtDXZCLX.Text);
      Parameters.ParamByName('c').Value:=edtDXZQDM.Text;
      Parameters.ParamByName('d').Value:=cbbDXJYSC.Text;
      Parameters.ParamByName('e').Value:=edtDXZQMC.Text;
      Parameters.ParamByName('f').Value:=FormatDatetime('YYYY/MM/DD', MainForm.dtpMainForm.DateTime);
    end;
  ExecSQL;
  end;
  Close;
  MainForm.dtpZQYWOnChange(Sender);
end;

procedure TZQYWDXForm1.FormCreate(Sender: TObject);
begin
  edtDXZCLX.OnKeyPress := MainForm.EditNumberKeyPress;

  edtDXZCLX.OnExit := MainForm.EditBumberLeave;
end;



// 填写证券代码时，显示所有符合要求证券代码
procedure TZQYWDXForm1.SelectZQXX(Sender: TObject);
Var ZQDM :string;
begin
  ZQDM := TComboBox(Sender).Text;
  TComboBox(Sender).Items.Clear;
//  showMessage(ZQDM);
  if ZQDM = '' then exit;
  with qryDXYW do
  begin
    Close;
    SQL.Clear;
    if (Caption = '兑息业务-到账-新增')  or (Caption = '兑息业务-转出-新增') then
    begin
      SQL.Add('select TZQXX_ZQDM,TZQXX_ZQMC,TZQXX_JYSC from tzqxx where '+
      'tzqxx_zqlb=''债券'' and tzqxx_zqdm like :a');
    end
    else
    begin
      SQL.Add('select TZQXX_ZQDM,TZQXX_ZQMC,TZQXX_JYSC from tzqxx where '+
      'tzqxx_zqlb=''股票'' and tzqxx_zqdm like :a');
    end;
    Parameters.ParamByName('a').Value:=ZQDM + '%';
    Open;
    while not eof do
    begin
        TComboBox(Sender).Items.Add(Fields[0].Text + '-' +
                Fields[1].Text + '-' + Fields[2].Text);
        // 使用 next 使游标指向下一列
        next;
    end;
  end;
  TComboBox(Sender).DroppedDown := True;
  SendMessage(TComboBox(Sender).Handle, WM_SETCURSOR, 0, 0);
  TComboBox(Sender).Text := ZQDM;
  TComboBox(Sender).SelStart := Length(ZQDM);
end;

// 选中一条证券代码以后，自动填充页面里面的信息
procedure TZQYWDXForm1.AutoZQXX(Sender: TObject);
Var
    txtLines : TStringList;
begin
  txtLines := TStringList.Create;
  txtLines.Delimiter := '-';

  txtLines.DelimitedText := TComboBox(Sender).Text;
  edtDXZQDM.Text := txtLines[0];
//  cbbGPJYZQDM.Text := txtLines[0];
  edtDXZQMC.Text := txtLines[1];
  cbbDXJYSC.Text := txtLines[2];
end;

// 在点击进入输入控件时，替换控件内容为''
procedure TZQYWDXForm1.EditInitContent(Sender:TObject);
begin
  TEdit(Sender).Text := '';
end;

end.
