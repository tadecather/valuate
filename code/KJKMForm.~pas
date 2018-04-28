unit KJKMForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls;

type
  TKJKMForm1 = class(TForm)
    KJKMKMDMLabel: TLabel;
    KJKMKMDMEdit: TEdit;
    KJKMKMMCLabel: TLabel;
    KJKMKMMCEdit: TEdit;
    KJKMSureButton: TButton;
    KJKMCancleButton: TButton;
    KJKMADOQuerry: TADOQuery;
    lblKJKMJDFX: TLabel;
    cbbKJKMJDFX: TComboBox;
    procedure KJKMCancleButtonClick(Sender: TObject);
    procedure KJKMSureButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KJKMForm1: TKJKMForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TKJKMForm1.KJKMCancleButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TKJKMForm1.KJKMSureButtonClick(Sender: TObject);
begin
  if (Trim(KJKMKMDMEdit.Text) = '') or (Trim(KJKMKMMCEdit.Text) = '') or
     (Trim(cbbKJKMJDFX.Text) = '') then
  begin
    ShowMessage('请保证所有内容不为空！！！');
    Exit;
  end;

  with KJKMADOQuerry do
  begin
    Close;
    SQL.Clear;
    if (Caption='会计科目-新增') then
      SQL.Add('insert into TKJKM Values(:a,:b,:c)')
    else
      SQL.Add('update TKJKM set TKJKM_KMMC=:b,TKJKM_JDFX=:c where TKJKM_KMDM=:a');
    Parameters.ParamByName('a').Value:=Trim(KJKMKMDMEdit.Text);
    Parameters.ParamByName('b').Value:=Trim(KJKMKMMCEdit.Text);
    Parameters.ParamByName('c').Value:=Trim(cbbKJKMJDFX.Text);
    ExecSQL;
  end;
  Close;
  MainForm.BasicSubMenuOnClick(Sender);
end;

end.
