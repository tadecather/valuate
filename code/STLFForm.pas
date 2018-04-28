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
  // ��ֹ�����ݿ�������������ݾ��� �� ��
  if (Trim(STLFFormBLJEEdit.Text) = '')  or (Trim(STLFFormJTTSEdit.Text) = '') then
  begin
    showMessage('��ȷ�������ֵ��Ϊ�գ�����');
    Exit;
  end;
  if Trim(STLFFormFYLXEdit.Text) = '' then
  begin
    ShowMessage('��������Ϊ�գ��޷��޸ģ�����ϵ����Ա��');
    Exit;
  end;
  with  STLFADOOperation do
  begin
    Close;
    SQL.Clear;
    if (STLFForm1.Caption='��Ʒ��޸�') or (STLFForm1.Caption='��Ϣ��¶���޸�') then
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

  // ��ʱ������ֻ�������������
  STLFFormBLJEEdit.OnKeyPress := MainForm.EditNumberKeyPress;
  STLFFormJTTSEdit.OnKeyPress := MainForm.EditNumberKeyPress;

  STLFFormBLJEEdit.OnExit := MainForm.EditBumberLeave;
  STLFFormJTTSEdit.OnExit := MainForm.EditBumberLeave;

end;

end.
