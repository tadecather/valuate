unit JYFLForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB;

type
  TJYFLForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    YHEdit: TEdit;
    Label4: TLabel;
    JSEdit: TEdit;
    Label5: TLabel;
    GHEdit: TEdit;
    Label6: TLabel;
    ZGEdit: TEdit;
    Label7: TLabel;
    YJEdit: TEdit;
    JYFLSureButton: TButton;
    JYFLCancleButton: TButton;
    JYSCEdit: TEdit;
    JYLXEdit: TEdit;
    JYFLADOOperation: TADOQuery;
    procedure JYFLCancleButtonClick(Sender: TObject);
    procedure JYFLSureButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
         private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  JYFLForm1: TJYFLForm1;

implementation

{$R *.dfm}

uses unit2;



procedure TJYFLForm1.JYFLCancleButtonClick(Sender: TObject);
begin
  close;
end;

procedure TJYFLForm1.JYFLSureButtonClick(Sender: TObject);
begin
  // 由于 数据库的设置 YWLB 和 JYSC 为主键，并且其他的不可为空，所以 从数据库里
  //面查出来的数据也不可能为空 ,所以不用进行数据为空的检查
  if (YHEdit.Text = '') or (JSEdit.Text = '') or (GHEdit.Text = '') or (ZGEdit.Text = '')
     or (YJEdit.Text = '') or (JYLXEdit.Text = '') or (JYSCEdit.Text = '') then
  begin
    showMessage('请确保所有数据不为空');
    exit;
  end;
  with JYFLADOOperation do
  begin
    Close;
    SQL.Clear;
    if Caption = '交易费率-新增' then
    begin
      SQL.Add('insert into tjyfl values(:g,:f,:a,:b,:c,:d,:e)');
      Parameters.ParamByName('a').Value:=StrToFloat(YHEdit.Text);
      Parameters.ParamByName('b').Value:=StrToFloat(JSEdit.Text);
      Parameters.ParamByName('c').Value:=StrToFloat(GHEdit.Text);
      Parameters.ParamByName('d').Value:=StrToFloat(ZGEdit.Text);
      Parameters.ParamByName('e').Value:=StrToFloat(YJEdit.Text);
      Parameters.ParamByName('f').Value:=JYLXEdit.Text;
      Parameters.ParamByName('g').Value:=JYSCEdit.Text;
    end
    else
    begin
      SQL.Add('update TJYFL set TJYFL_YHS=:a,TJYFL_JSF=:b,TJYFL_GHF=:c,TJYFL_ZGF=:d,TJYFL_YJ=:e where TJYFL_YWLB=:f and TJYFL_JYSC=:g');
      Parameters.ParamByName('a').Value:=StrToFloat(YHEdit.Text);
      Parameters.ParamByName('b').Value:=StrToFloat(JSEdit.Text);
      Parameters.ParamByName('c').Value:=StrToFloat(GHEdit.Text);
      Parameters.ParamByName('d').Value:=StrToFloat(ZGEdit.Text);
      Parameters.ParamByName('e').Value:=StrToFloat(YJEdit.Text);
      Parameters.ParamByName('f').Value:=JYLXEdit.Text;
      Parameters.ParamByName('g').Value:=JYSCEdit.Text;
    end;
    ExecSQL;
  end;
  Close;
  MainForm.BasicRefreshButtonClick(Sender);
end;

procedure TJYFLForm1.FormCreate(Sender: TObject);
begin

  // 设置输入限制为数字
  YHEdit.OnKeyPress := MainForm.EditNumberKeyPress;
  JSEdit.OnKeyPress := MainForm.EditNumberKeyPress;
  GHEdit.OnKeyPress := MainForm.EditNumberKeyPress;
  ZGEdit.OnKeyPress := MainForm.EditNumberKeyPress;
  YJEdit.OnKeyPress := MainForm.EditNumberKeyPress;

  // 防止用户在编辑时，删除全部，然后直接编辑另外一个控件，导致取到的值为 ''
  // 现在直接替换为 0.0
  YHEdit.OnExit := MainForm.EditBumberLeave;
  JSEdit.OnExit := MainForm.EditBumberLeave;
  GHEdit.OnExit := MainForm.EditBumberLeave;
  ZGEdit.OnExit := MainForm.EditBumberLeave;
  YJEdit.OnExit := MainForm.EditBumberLeave;

  JYLXEdit.Enabled := False;
  JYSCEdit.Enabled := False;
end;

end.
