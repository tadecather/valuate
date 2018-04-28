unit ZQYWGPJYForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ComCtrls, Math;

type
  TZQYWGPJYForm1 = class(TForm)
    lblGPJYZQDM: TLabel;
    lblGPJYJYRQ: TLabel;
    lblGPJYJYFX: TLabel;
    lblGPJYZQMC: TLabel;
    lblGPJYCJSL: TLabel;
    lblGPJYYHS: TLabel;
    edtGPJYZQDM: TEdit;
    dtpGPJYJYRQ: TDateTimePicker;
    edtGPJYZQMC: TEdit;
    btnGPJYSure: TButton;
    btnGPJYCancle: TButton;
    edtZQYWCJSL: TEdit;
    qryGPJY: TADOQuery;
    cbbGPJYJYFX: TComboBox;
    cbbGPJYJYSC: TComboBox;
    lblGPJYJSF: TLabel;
    lblGPJYSXF: TLabel;
    edtGPJYJSF: TEdit;
    edtGPJYYHS: TEdit;
    lblGPJYZGF: TLabel;
    lblGPJYGHF: TLabel;
    edtGPJYZGF: TEdit;
    edtGPJYGHF: TEdit;
    lblGPJYYJ: TLabel;
    lblGPJYJYSC: TLabel;
    edtGPJYYJ: TEdit;
    edtGPJYSXF: TEdit;
    lblGPJYCJJG: TLabel;
    lblGPJYCJJE: TLabel;
    edtGPJYCJJG: TEdit;
    edtGPJYCJJE: TEdit;
    procedure btnGPJYSureClick(Sender: TObject);
    procedure btnGPJYCancleClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZQYWGPJYForm1: TZQYWGPJYForm1;

implementation

uses Unit2;

{$R *.dfm}

// surebutton's function
procedure TZQYWGPJYForm1.btnGPJYSureClick(Sender: TObject);
begin
  if (Trim(edtGPJYZQMC.Text) = '') or (Trim(cbbGPJYJYSC.Text) = '') or
    (Trim(edtZQYWCJSL.Text) = '') or (Trim(edtGPJYCJJG.Text) = '') or
    (Trim(edtGPJYCJJE.Text) = '') or (Trim(edtGPJYYHS.Text) = '') or
    (Trim(edtGPJYJSF.Text) = '') or (Trim(edtGPJYGHF.Text) = '') or
    (Trim(edtGPJYZGF.Text) = '') or (Trim(edtGPJYSXF.Text) = '') or
    (Trim(edtGPJYYJ.Text) = '')  then
  begin
    ShowMessage('请确保所有数据不为空！');
    Exit;
  end;
  with qryGPJY do
  begin
    Close;
    SQL.Clear;
    if(Caption='债券交易-修改') then
    begin
      SQL.Add('Update TZQJY set TZQJY_JYSC=:e,TZQJY_CJJG=:f,TZQJY_CJJE=:g,TZQJY_CJSL=:h,TZQJY_JSF=:i,'+
                ' TZQJY_YHS=:j,TZQJY_GHF=:k,TZQJY_ZGF=:l,TZQJY_SQLX=:n,TZQJY_SHLX=:o,TZQJY_LXS=:p'+
                ' where TZQJY_ZQDM=:a and TZQJY_JYRQ=:c and TZQJY_JYFX=:d');
      Parameters.ParamByName('a').Value:=ZQYWGPJYForm1.edtGPJYZQDM.Text;
//      Parameters.ParamByName('b').Value:=ZQYWGPJYForm1.edtGPJYZQMC.Text;
      Parameters.ParamByName('c').Value:=FormatDatetime('YYYY/MM/DD', dtpGPJYJYRQ.DateTime);
      Parameters.ParamByName('d').Value:=ZQYWGPJYForm1.cbbGPJYJYFX.Text;
      Parameters.ParamByName('e').Value:=ZQYWGPJYForm1.cbbGPJYJYSC.Text;
      Parameters.ParamByName('f').Value:=StrToFloat(edtGPJYCJJG.Text);
      Parameters.ParamByName('g').Value:=StrToFloat(edtGPJYCJJE.Text);
      Parameters.ParamByName('h').Value:=StrToInt(edtZQYWCJSL.Text);
      Parameters.ParamByName('i').Value:=StrToFloat(edtGPJYJSF.Text);
      Parameters.ParamByName('j').Value:=StrToFloat(edtGPJYYHS.Text);
      Parameters.ParamByName('k').Value:=StrToFloat(edtGPJYGHF.Text);
      Parameters.ParamByName('l').Value:=StrToFloat(edtGPJYZGF.Text);
//      Parameters.ParamByName('m').Value:=0;
      Parameters.ParamByName('n').Value:=StrToFloat(edtGPJYSXF.Text);
       // 计算税后利息，插入到数据库中去
      Parameters.ParamByName('o').Value:=RoundTo(StrToFloat(edtGPJYSXF.Text) * (1 - StrToFloat(edtGPJYYJ.Text)),2);
      Parameters.ParamByName('p').Value:=StrToFloat(edtGPJYYJ.Text);
    end
    else if(Caption='股票交易-修改') then
    begin
      SQL.Add('Update TGPJY set TGPJY_JYSC=:e,TGPJY_CJJG=:f,TGPJY_CJJE=:g,TGPJY_CJSL=:h,TGPJY_JSF=:i,'+
      'TGPJY_YHS=:j,TGPJY_GHF=:k,TGPJY_ZGF=:l,TGPJY_YONGJIN=:m where TGPJY_ZQDM=:a and TGPJY_JYRQ=:c and TGPJY_JYFX=:d');
      Parameters.ParamByName('a').Value:=ZQYWGPJYForm1.edtGPJYZQDM.Text;
//      Parameters.ParamByName('b').Value:=ZQYWGPJYForm1.edtGPJYZQMC.Text;
      Parameters.ParamByName('c').Value:=FormatDatetime('YYYY/MM/DD', dtpGPJYJYRQ.DateTime);
      Parameters.ParamByName('d').Value:=ZQYWGPJYForm1.cbbGPJYJYFX.Text;
      Parameters.ParamByName('e').Value:=ZQYWGPJYForm1.cbbGPJYJYSC.Text;
      Parameters.ParamByName('f').Value:=StrToFloat(edtGPJYCJJG.Text);
      Parameters.ParamByName('g').Value:=StrToFloat(edtGPJYCJJE.Text);
      Parameters.ParamByName('h').Value:=StrToInt(edtZQYWCJSL.Text);
      Parameters.ParamByName('i').Value:=StrToFloat(edtGPJYJSF.Text);
      Parameters.ParamByName('j').Value:=StrToFloat(edtGPJYYHS.Text);
      Parameters.ParamByName('k').Value:=StrToFloat(edtGPJYGHF.Text);
      Parameters.ParamByName('l').Value:=StrToFloat(edtGPJYZGF.Text);
      Parameters.ParamByName('m').Value:=StrToFloat(edtGPJYYJ.Text);
    end
    else if(Caption='债券交易-新增') then
    begin

    if (Trim(edtGPJYZQDM.Text) = '') or (Trim(cbbGPJYJYFX.Text) = '') then
    begin
      ShowMessage('请确保所有数据不为空！');
      Exit;
    end;
      SQL.Add('insert into TZQJY Values(:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p)');
      Parameters.ParamByName('a').Value:=ZQYWGPJYForm1.edtGPJYZQDM.Text;
      Parameters.ParamByName('b').Value:=ZQYWGPJYForm1.edtGPJYZQMC.Text;
      Parameters.ParamByName('c').Value:=FormatDatetime('YYYY/MM/DD', dtpGPJYJYRQ.DateTime);
      Parameters.ParamByName('d').Value:=ZQYWGPJYForm1.cbbGPJYJYFX.Text;
      Parameters.ParamByName('e').Value:=ZQYWGPJYForm1.cbbGPJYJYSC.Text;
      Parameters.ParamByName('f').Value:=StrToFloat(edtGPJYCJJG.Text);
      Parameters.ParamByName('g').Value:=StrToFloat(edtGPJYCJJE.Text);
      Parameters.ParamByName('h').Value:=StrToInt(edtZQYWCJSL.Text);
      Parameters.ParamByName('i').Value:=StrToFloat(edtGPJYJSF.Text);
      Parameters.ParamByName('j').Value:=StrToFloat(edtGPJYYHS.Text);
      Parameters.ParamByName('k').Value:=StrToFloat(edtGPJYGHF.Text);
      Parameters.ParamByName('l').Value:=StrToFloat(edtGPJYZGF.Text);
      Parameters.ParamByName('m').Value:=0;
      Parameters.ParamByName('n').Value:=StrToFloat(edtGPJYSXF.Text);
      // 计算税后利息，插入到数据库中去 ，引入 Math 模块，保留两位小数
      Parameters.ParamByName('o').Value:=RoundTo(StrToFloat(edtGPJYSXF.Text) * (1 - StrToFloat(edtGPJYYJ.Text)),2);
      Parameters.ParamByName('p').Value:=StrToFloat(edtGPJYYJ.Text);
    end
    else if ( ZQYWGPJYForm1.Caption='股票交易-新增') then
    begin
      SQL.Add('insert into TGPJY Values(:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m)');
      Parameters.ParamByName('a').Value:=ZQYWGPJYForm1.edtGPJYZQDM.Text;
      Parameters.ParamByName('b').Value:=ZQYWGPJYForm1.edtGPJYZQMC.Text;
      Parameters.ParamByName('c').Value:=FormatDatetime('YYYY/MM/DD', dtpGPJYJYRQ.DateTime);
      Parameters.ParamByName('d').Value:=ZQYWGPJYForm1.cbbGPJYJYFX.Text;
      Parameters.ParamByName('e').Value:=ZQYWGPJYForm1.cbbGPJYJYSC.Text;
      Parameters.ParamByName('f').Value:=StrToFloat(edtGPJYCJJG.Text);
      Parameters.ParamByName('g').Value:=StrToFloat(edtGPJYCJJE.Text);
      Parameters.ParamByName('h').Value:=StrToInt(edtZQYWCJSL.Text);
      Parameters.ParamByName('i').Value:=StrToFloat(edtGPJYJSF.Text);
      Parameters.ParamByName('j').Value:=StrToFloat(edtGPJYYHS.Text);
      Parameters.ParamByName('k').Value:=StrToFloat(edtGPJYGHF.Text);
      Parameters.ParamByName('l').Value:=StrToFloat(edtGPJYZGF.Text);
      Parameters.ParamByName('m').Value:=StrToFloat(edtGPJYYJ.Text);
    end;
    ExecSQL;
    end;
    Close;
    MainForm.dtpZQYWOnChange(Sender);
end;

// CancleButton's function
procedure TZQYWGPJYForm1.btnGPJYCancleClick(Sender: TObject);
begin
  Close;
end;

procedure TZQYWGPJYForm1.FormCreate(Sender: TObject);
begin
  edtZQYWCJSL.OnKeyPress := MainForm.EditNumberKeyPress;
  edtGPJYCJJG.OnKeyPress := MainForm.EditNumberKeyPress;
  edtGPJYCJJE.OnKeyPress := MainForm.EditNumberKeyPress;
  edtGPJYYHS.OnKeyPress := MainForm.EditNumberKeyPress;
  edtGPJYJSF.OnKeyPress := MainForm.EditNumberKeyPress;
  edtGPJYGHF.OnKeyPress := MainForm.EditNumberKeyPress;
  edtGPJYZGF.OnKeyPress := MainForm.EditNumberKeyPress;
  edtGPJYSXF.OnKeyPress := MainForm.EditNumberKeyPress;
  edtGPJYYJ.OnKeyPress := MainForm.EditNumberKeyPress;

  edtZQYWCJSL.OnExit := MainForm.EditBumberLeave;
  edtGPJYCJJG.OnExit := MainForm.EditBumberLeave;
  edtGPJYCJJE.OnExit := MainForm.EditBumberLeave;
  edtGPJYYHS.OnExit := MainForm.EditBumberLeave;
  edtGPJYJSF.OnExit := MainForm.EditBumberLeave;
  edtGPJYGHF.OnExit := MainForm.EditBumberLeave;
  edtGPJYZGF.OnExit := MainForm.EditBumberLeave;
  edtGPJYSXF.OnExit := MainForm.EditBumberLeave;
  edtGPJYYJ.OnExit := MainForm.EditBumberLeave;

  FormShow(Sender);
end;

procedure TZQYWGPJYForm1.FormShow(Sender: TObject);
begin
//
  if (Caption = '股票交易-查看') or (Caption = '债券交易-查看') then
  begin
    edtGPJYZQDM.Enabled := False;
    dtpGPJYJYRQ.Enabled := False;
    edtGPJYZQMC.Enabled := False;
    cbbGPJYJYFX.Enabled := False;
    cbbGPJYJYSC.Enabled := False;
    edtZQYWCJSL.Enabled := False;
    edtGPJYCJJG.Enabled := False;
    edtGPJYCJJE.Enabled := False;
    edtGPJYYHS.Enabled := False;
    edtGPJYJSF.Enabled := False;
    edtGPJYGHF.Enabled := False;
    edtGPJYZGF.Enabled := False;
    edtGPJYSXF.Enabled := False;
    edtGPJYYJ.Enabled := False;
  end
  else if (Caption = '股票交易-修改') or (Caption = '债券交易-修改') then
  begin
    edtGPJYZQDM.Enabled := False;
    dtpGPJYJYRQ.Enabled := False;
    edtGPJYZQMC.Enabled := True;
    cbbGPJYJYFX.Enabled := False;
    cbbGPJYJYSC.Enabled := True;
    edtZQYWCJSL.Enabled := True;
    edtGPJYCJJG.Enabled := True;
    edtGPJYCJJE.Enabled := True;
    edtGPJYYHS.Enabled := True;
    edtGPJYJSF.Enabled := True;
    edtGPJYGHF.Enabled := True;
    edtGPJYZGF.Enabled := True;
    edtGPJYSXF.Enabled := True;
    edtGPJYYJ.Enabled := True;
  end
  else
  begin
    edtGPJYZQDM.Enabled := True;
    dtpGPJYJYRQ.Enabled := True;
    edtGPJYZQMC.Enabled := True;
    cbbGPJYJYFX.Enabled := True;
    cbbGPJYJYSC.Enabled := True;
    edtZQYWCJSL.Enabled := True;
    edtGPJYCJJG.Enabled := True;
    edtGPJYCJJE.Enabled := True;
    edtGPJYYHS.Enabled := True;
    edtGPJYJSF.Enabled := True;
    edtGPJYGHF.Enabled := True;
    edtGPJYZGF.Enabled := True;
    edtGPJYSXF.Enabled := True;
    edtGPJYYJ.Enabled := True;
  end;

end;

end.
