unit JKLJForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FileCtrl, Buttons, StdCtrls, DB, ADODB;{记得要先引用这个}

type
  TJKLJForm1 = class(TForm)
    JKLJFormJKBHLabel: TLabel;
    JKLJFormJKBHEdit: TEdit;
    JKLJFormJKMCLabel: TLabel;
    JKLJFormJKMCEdit: TEdit;
    JKLJFormWJMCLabel: TLabel;
    JKLJFormWJMCEdit: TEdit;
    JKLJFormWJLJLabel: TLabel;
    JKLJFormWJLJEdit: TEdit;
    JKLJSureButton: TButton;
    JKLJCancleButton: TButton;
    JKLJFormWJLJChooseButton: TBitBtn;
    JKLJFormADOQuerry: TADOQuery;
    procedure JKLJFormWJLJChooseButtonClick(Sender: TObject);
    procedure JKLJCancleButtonClick(Sender: TObject);
    procedure JKLJSureButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  JKLJForm1: TJKLJForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TJKLJForm1.JKLJFormWJLJChooseButtonClick(Sender: TObject);
var
  Dir: string;
begin
  SelectDirectory('选择你要选择的目录', '', Dir);
  JKLJFormWJLJEdit.Text:=Dir + '\';
end;

procedure TJKLJForm1.JKLJCancleButtonClick(Sender: TObject);
begin
  close;
end;

procedure TJKLJForm1.JKLJSureButtonClick(Sender: TObject);
begin
  with JKLJFormADOQuerry do
  begin
    Close;
    SQL.Clear;
    SQL.Add('update TJSLJ set TJSLJ_WJLJ=:a where TJSLJ_JKBH=:b');
    Parameters.ParamByName('a').Value:=Trim(JKLJFormWJLJEdit.Text);
    if Trim(JKLJFormJKBHEdit.Text) = '' then
    begin
      ShowMessage('编号为空，不能修改，请联系管理员！');
      Exit;
    end
    else Parameters.ParamByName('b').Value:=Trim(JKLJFormJKBHEdit.Text);
    ExecSQL;
  end;
  Close;
  MainForm.BasicSubMenuOnClick(Sender);
end;

procedure TJKLJForm1.FormCreate(Sender: TObject);
begin
  JKLJFormJKBHEdit.Enabled := False;
end;

end.
