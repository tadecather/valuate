unit DataManageGPForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ComCtrls;

type
  TDataManageGPForm1 = class(TForm)
    lblZQDMDataManageGP: TLabel;
    lblKSRQDataManageGP: TLabel;
    lblJSRQDataManageGP: TLabel;
    lblZQMCDataManageGP: TLabel;
    lblGHSLDataManageGP: TLabel;
    edtZQDMDataManageGP: TEdit;
    dtpKSRQDataManageGP: TDateTimePicker;
    dtpJSRQDataManageGP: TDateTimePicker;
    edtZQMCDataManageGP: TEdit;
    edtGHSLDataManageGP: TEdit;
    btnDataMGPSure: TButton;
    btnDataMGPCancle: TButton;
    qryDataManageGP: TADOQuery;
    lblQYBLDataManageGP: TLabel;
    edtQYBLDataManageGP: TEdit;
    lblDMGPJYSCLabel: TLabel;
    edtDMGPJYSCEdit: TEdit;
    procedure btnDataMGPCancleClick(Sender: TObject);
    procedure btnDataMGPSureClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataManageGPForm1: TDataManageGPForm1;

implementation

uses Unit2;

{$R *.dfm}

// 取消按钮的作用
procedure TDataManageGPForm1.btnDataMGPCancleClick(Sender: TObject);
begin
  Close;
end;


//确定按钮的作用
procedure TDataManageGPForm1.btnDataMGPSureClick(Sender: TObject);
begin
  with qryDataManageGP do
  begin
    Close;
    SQL.Clear;

    // 检查数据不为 空
    if (Trim(edtZQMCDataManageGP.Text) = '') or (Trim(edtQYBLDataManageGP.Text) = '')
    or (Trim(edtGHSLDataManageGP.Text) = '') then
    begin
      ShowMessage('请确保所有数据不为空！');
      Exit;
    end;
    if (DataManageGPForm1.Caption='股票分红公告-编辑') then
    begin

      SQL.Add('update THL set THL_YWRQ=:a, THL_DZRQ=:b, THL_DJSL=:c, THL_QYBL=:d where THL_ZQDM=:e and THL_YWLB=''红利到账''');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY/MM/DD', dtpKSRQDataManageGP.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY/MM/DD', dtpJSRQDataManageGP.DateTime);
      Parameters.ParamByName('c').Value:=StrToInt(edtGHSLDataManageGP.Text);
      Parameters.ParamByName('d').Value:=StrToFloat(edtQYBLDataManageGP.Text);
      Parameters.ParamByName('e').Value:=edtZQDMDataManageGP.Text;
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Add('update thl set thl_fhje=thl_djsl*thl_qybl where THL_JYSC=''上海'' and THL_YWLB=''红利到账''');
      ExecSQL;
    end
    else if(DataManageGPForm1.Caption='股票分红公告-新增') then
    begin
      if (Trim(edtZQDMDataManageGP.Text) = '' ) or (Trim(edtDMGPJYSCEdit.Text) = '') then
      begin
        ShowMessage('请确保所有数据不为空！');
        Exit;
      end;
      SQL.Add('insert into THL(THL_YWRQ, THL_DZRQ, THL_YWLB, THL_JYSC, THL_ZQDM,THL_ZQMC, THL_DJSL,THL_QYBL) ' +
        'Values(:a,:b,''红利到账'',''上海'', :c, :d, :e, :f)');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY/MM/DD', dtpKSRQDataManageGP.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY/MM/DD', dtpJSRQDataManageGP.DateTime);
      Parameters.ParamByName('e').Value:=StrToInt(edtGHSLDataManageGP.Text);
      Parameters.ParamByName('f').Value:=StrToFloat(edtQYBLDataManageGP.Text);
      Parameters.ParamByName('c').Value:=edtZQDMDataManageGP.Text;
      Parameters.ParamByName('d').Value:=edtZQMCDataManageGP.Text;
      ExecSQL;
    end;

  end;
  Close;
  MainForm.dtpDataManageOnChange(Sender);
end;

procedure TDataManageGPForm1.FormCreate(Sender: TObject);
begin
  edtQYBLDataManageGP.OnKeyPress := MainForm.EditNumberKeyPress;
  edtGHSLDataManageGP.OnKeyPress := MainForm.EditNumberKeyPress;

  edtQYBLDataManageGP.OnExit := MainForm.EditBumberLeave;
  edtGHSLDataManageGP.OnExit := MainForm.EditBumberLeave;
end;

end.
