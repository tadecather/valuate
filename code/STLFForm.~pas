unit STLFForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ComCtrls;

type
  TSTLFForm1 = class(TForm)
    STLFFormFYLXLabel: TLabel;
    STLFFormFYLXEdit: TEdit;
    STLFFormKSRQLabel: TLabel;
    STLFFormKSRQDateTimePicker: TDateTimePicker;
    STLFFormJSRQLabel: TLabel;
    STLFFormJSRQDateTimePicker: TDateTimePicker;
    STLFFormBLJELabel: TLabel;
    STLFFormBLJEEdit: TEdit;
    STLFFormJTTSLabel: TLabel;
    STLFFormJTTSEdit: TEdit;
    STLFSureButton: TButton;
    STLFCancleButton: TButton;
    STLFADOOperation: TADOQuery;
    procedure STLFCancleButtonClick(Sender: TObject);
    procedure STLFSureButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  STLFForm1: TSTLFForm1;

implementation


uses unit2;
{$R *.dfm}

procedure TSTLFForm1.STLFCancleButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TSTLFForm1.STLFSureButtonClick(Sender: TObject);
begin
  // 防止从数据库里面出来的数据就是 空 的
  if (Trim(STLFFormBLJEEdit.Text) = '')  or (Trim(STLFFormJTTSEdit.Text) = '') then
  begin
    showMessage('请确保输入的值不为空！！！');
    Exit;
  end;
  if Trim(STLFFormFYLXEdit.Text) = '' then
  begin
    ShowMessage('费用类型为空，无法修改，请联系管理员！');
    Exit;
  end;
  with  STLFADOOperation do
  begin
    Close;
    SQL.Clear;
    if (STLFForm1.Caption='审计费修改') or (STLFForm1.Caption='信息披露费修改') then
    begin
      SQL.Add('update TSTLF set TSTLF_KSRQ=:a,TSTLF_JSRQ=:b,TSTLF_FYZE=:c,TSTLF_JTCS=:d where TSTLF_FYLX=:e');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY/MM/DD', STLFFormKSRQDateTimePicker.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY/MM/DD', STLFFormJSRQDateTimePicker.DateTime);
      Parameters.ParamByName('c').Value:=StrToInt(STLFFormBLJEEdit.Text);
      Parameters.ParamByName('d').Value:=StrToInt(STLFFormJTTSEdit.Text);
      Parameters.ParamByName('e').Value:=Trim(STLFFormFYLXEdit.Text);
    end
    else
    begin
      SQL.Add('update TSTLF set TSTLF_KSRQ=:a,TSTLF_JSRQ=:b,TSTLF_JTBL=:c where TSTLF_FYLX=:e');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY/MM/DD', STLFFormKSRQDateTimePicker.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY/MM/DD', STLFFormJSRQDateTimePicker.DateTime);
      Parameters.ParamByName('c').Value:=StrToFloat(STLFFormBLJEEdit.Text);
      Parameters.ParamByName('e').Value:=Trim(STLFFormFYLXEdit.Text);
    end;
    ExecSQL;
  end;
  Close;
  MainForm.BasicSubMenuOnClick(Sender);
end;




procedure TSTLFForm1.FormCreate(Sender: TObject);
begin
  STLFFormFYLXEdit.Enabled := False;

  // 暂时不考虑只能输入整数情况
  STLFFormBLJEEdit.OnKeyPress := MainForm.EditNumberKeyPress;
  STLFFormJTTSEdit.OnKeyPress := MainForm.EditNumberKeyPress;

  STLFFormBLJEEdit.OnExit := MainForm.EditBumberLeave;
  STLFFormJTTSEdit.OnExit := MainForm.EditBumberLeave;

end;

end.
