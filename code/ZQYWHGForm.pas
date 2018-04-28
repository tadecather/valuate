unit ZQYWHGForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ComCtrls;

type
  TZQYWHGForm1 = class(TForm)
    lblHGZQDM: TLabel;
    lblHGJYRQ: TLabel;
    lblHGJYFX: TLabel;
    lblHGZQMC: TLabel;
    edtHGZQDM: TEdit;
    dtpHGJYRQ: TDateTimePicker;
    edtHGZQMC: TEdit;
    cbbHGJYFX: TComboBox;
    lblHGDQRQ: TLabel;
    dtpHGDQRQ: TDateTimePicker;
    lblHGJYSC: TLabel;
    cbbHGJYSC: TComboBox;
    lblHGHGTS: TLabel;
    edtHGHGTS: TEdit;
    lblHGCJJE: TLabel;
    edtHGCJJE: TEdit;
    lbl1: TLabel;
    edtHGFKJE: TEdit;
    btnHGSure: TButton;
    btnHGCancle: TButton;
    qryGPJY: TADOQuery;
    procedure btnHGSureClick(Sender: TObject);
    procedure btnHGCancleClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZQYWHGForm1: TZQYWHGForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TZQYWHGForm1.btnHGSureClick(Sender: TObject);
begin
  if (Trim(edtHGZQMC.Text) = '') or (Trim(edtHGHGTS.Text) = '') or
    (Trim(edtHGCJJE.Text) = '') or (Trim(edtHGFKJE.Text) = '') then
  begin
    ShowMessage('请确保所有数据不为空！');
    Exit;
  end;
  with qryGPJY do
  begin
    Close;
    SQL.Clear;
    if(ZQYWHGForm1.Caption='回购业务-修改') then
    begin
      SQL.Add('update Thgjy set THGJY_HGMC=:b,THGJY_HGTS=:c,THGJY_DQRQ=:e,THGJY_CJJE=:h,'+
              'THGJY_FKJE=:i where THGJY_ZQDM=:a and THGJY_CJRQ=:d and THGJY_HGFX=:f');
      Parameters.ParamByName('a').Value := edtHGZQDM.Text;
      Parameters.ParamByName('b').Value := edtHGZQMC.Text;
      Parameters.ParamByName('c').Value := StrToInt(edtHGHGTS.Text);
      Parameters.ParamByName('d').Value := FormatDatetime('YYYY/MM/DD', dtpHGJYRQ.DateTime);
      Parameters.ParamByName('e').Value := FormatDatetime('YYYY/MM/DD', dtpHGDQRQ.DateTime);
      Parameters.ParamByName('f').Value := cbbHGJYFX.Text;
//      Parameters.ParamByName('g').Value := cbbHGJYSC.Text;
      Parameters.ParamByName('h').Value := StrToFloat(edtHGCJJE.Text);
      Parameters.ParamByName('i').Value := StrToFloat(edtHGFKJE.Text);
    end
    else
    begin
      if (Trim(edtHGZQDM.Text) = '') or 
        (Trim(cbbHGJYFX.Text) = '') or (Trim(cbbHGJYSC.Text) = '') then
      begin
        ShowMessage('请确保所有数据不为空！');
        Exit;
      end;
      SQL.Add('insert into THGJY Values(:a,:b,:c,:d,:e,:f,:g,:h,:i)');
      Parameters.ParamByName('a').Value := edtHGZQDM.Text;
      Parameters.ParamByName('b').Value := edtHGZQMC.Text;
      Parameters.ParamByName('c').Value := StrToInt(edtHGHGTS.Text);
      Parameters.ParamByName('d').Value := FormatDatetime('YYYY/MM/DD', dtpHGJYRQ.DateTime);
      Parameters.ParamByName('e').Value := FormatDatetime('YYYY/MM/DD', dtpHGDQRQ.DateTime);
      Parameters.ParamByName('f').Value := cbbHGJYFX.Text;
      Parameters.ParamByName('g').Value := cbbHGJYSC.Text;
      Parameters.ParamByName('h').Value := StrToFloat(edtHGCJJE.Text);
      Parameters.ParamByName('i').Value := StrToFloat(edtHGFKJE.Text);
    end;
    ExecSQL;
  end;
  Close;
  MainForm.dtpZQYWOnChange(Sender);
end;

// 取消按钮作用
procedure TZQYWHGForm1.btnHGCancleClick(Sender: TObject);
begin
  Close;
end;

procedure TZQYWHGForm1.FormCreate(Sender: TObject);
begin
  edtHGHGTS.OnKeyPress := MainForm.EditNumberKeyPress;
  edtHGCJJE.OnKeyPress := MainForm.EditNumberKeyPress;
  edtHGFKJE.OnKeyPress := MainForm.EditNumberKeyPress;

  edtHGHGTS.OnExit := MainForm.EditBumberLeave;
  edtHGCJJE.OnExit := MainForm.EditBumberLeave;
  edtHGFKJE.OnExit := MainForm.EditBumberLeave;

  FormShow(Sender);
end;

procedure TZQYWHGForm1.FormShow(Sender: TObject);
begin
  if (Caption = '回购业务-新增') then
  begin
    edtHGZQDM.Enabled := True;
    edtHGZQMC.Enabled := True;
    dtpHGJYRQ.Enabled := True;
    dtpHGDQRQ.Enabled := True;
    cbbHGJYFX.Enabled := True;
    edtHGHGTS.Enabled := True;
    cbbHGJYSC.Enabled := True;
    edtHGCJJE.Enabled := True;
    edtHGFKJE.Enabled := True;
  end
  else if(Caption = '回购业务-查看') then
  begin
    edtHGZQDM.Enabled := False;
    edtHGZQMC.Enabled := False;
    dtpHGJYRQ.Enabled := False;
    dtpHGDQRQ.Enabled := False;
    cbbHGJYFX.Enabled := False;
    edtHGHGTS.Enabled := False;
    cbbHGJYSC.Enabled := False;
    edtHGCJJE.Enabled := False;
    edtHGFKJE.Enabled := False;
  end
  else
  begin
    edtHGZQDM.Enabled := False;
    edtHGZQMC.Enabled := True;
    dtpHGJYRQ.Enabled := False;
    dtpHGDQRQ.Enabled := False;
    cbbHGJYFX.Enabled := False;
    edtHGHGTS.Enabled := True;
    cbbHGJYSC.Enabled := True;
    edtHGCJJE.Enabled := True;
    edtHGFKJE.Enabled := True;
  end;
end;

end.
