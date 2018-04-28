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
    procedure btnDXCancleClick(Sender: TObject);
    procedure btnDXSureClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
    else if(Caption='兑息业务-转出-新增') then
    begin
      if (Trim(edtDXZQDM.Text) = '') or (Trim(cbbDXJYSC.Text) = '') then
      begin
        ShowMessage('请确保所有数据不为空！');
        Exit;
      end;
      SQL.Add('insert into TZQJY(TZQJY_ZQDM,TZQJY_ZQMC,TZQJY_JYRQ,TZQJY_JYFX,TZQJY_JYSC,TZQJY_SQLX)'+
               ' Values(:c,:e,:a,''兑息转出'',:d,:b)');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY/MM/DD', dtpDXJYRQ.DateTime);
      Parameters.ParamByName('b').Value:=StrToFloat(edtDXZCLX.Text);
      Parameters.ParamByName('c').Value:=edtDXZQDM.Text;
      Parameters.ParamByName('d').Value:=cbbDXJYSC.Text;
      Parameters.ParamByName('e').Value:=edtDXZQMC.Text;
    end
    else if(Caption='兑息业务-到账-新增') then
    begin
      if (Trim(edtDXZQDM.Text) = '') or (Trim(cbbDXJYSC.Text) = '') then
      begin
        ShowMessage('请确保所有数据不为空！');
        Exit;
      end;
      SQL.Add('insert into TZQJY(TZQJY_ZQDM,TZQJY_ZQMC,TZQJY_JYRQ,TZQJY_JYFX,TZQJY_JYSC,TZQJY_SQLX)'+
               ' Values(:c,:e,:a,''兑息到账'',:d,:b)');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY/MM/DD', dtpDXJYRQ.DateTime);
      Parameters.ParamByName('b').Value:=StrToFloat(edtDXZCLX.Text);
      Parameters.ParamByName('c').Value:=edtDXZQDM.Text;
      Parameters.ParamByName('d').Value:=cbbDXJYSC.Text;
      Parameters.ParamByName('e').Value:=edtDXZQMC.Text;
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

end.
