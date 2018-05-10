unit ZQYWXGForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB;

type
  TZQYWXGForm1 = class(TForm)
    lblXGZQDM: TLabel;
    lblXGYWRQ: TLabel;
    lblXGYWLB: TLabel;
    lblXGZQMC: TLabel;
    lblXGCJSL: TLabel;
    lblXGCJJE: TLabel;
    lblXGCJJG: TLabel;
    lblXGJYSC: TLabel;
    edtXGZQDM: TEdit;
    dtpXGYWRQ: TDateTimePicker;
    edtXGZQMC: TEdit;
    edtXGCJSL: TEdit;
    cbbXGYWLB: TComboBox;
    cbbXGJYSC: TComboBox;
    edtXGCJJG: TEdit;
    edtXGCJJE: TEdit;
    btnXGSure: TButton;
    btnXGCancle: TButton;
    qryXGYW: TADOQuery;
    cbbXGZQDM: TComboBox;
    procedure btnXGCancleClick(Sender: TObject);
    procedure btnXGSureClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure EditInitContent(Sender:TObject);
    procedure SelectZQXX(Sender: TObject);
    procedure AutoZQXX(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZQYWXGForm1: TZQYWXGForm1;

implementation

uses Unit2;

{$R *.dfm}



procedure TZQYWXGForm1.btnXGCancleClick(Sender: TObject);
begin
  Close;
end;

procedure TZQYWXGForm1.btnXGSureClick(Sender: TObject);
begin
  if (Trim(edtXGZQMC.Text) = '') or (Trim(cbbXGJYSC.Text) = '') or
    (Trim(edtXGCJSL.Text) = '') or (Trim(edtXGCJJE.Text) = '') or
    (Trim(edtXGCJJG.Text) = '') then
  begin
    ShowMessage('请确保所有数据不为空！');
    Exit
  end;
  with qryXGYW do
  begin
    Close;
    SQL.Clear;
    if(Caption='新股业务-新增') then
    begin
      // 先判断是否已经存在这个证券代码的这个业务
      SQL.Add('select * from TXG where TXG_ZQDM=:a and TXG_YWLB=:c');
      Parameters.ParamByName('a').Value:= edtXGZQDM.Text;
      Parameters.ParamByName('c').Value:= cbbXGYWLB.Text;
      Open;
      if(RecordCount > 0) then
      begin
        ShowMessage(edtXGZQDM.Text + '的' + cbbXGYWLB.Text + '业务已经存在，请勿重复操作！');
      end
      else
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into TXG Values(:a,:b,:c,:d,:e,:f,:g,:h,:i)');
        Parameters.ParamByName('a').Value:= edtXGZQDM.Text;
        Parameters.ParamByName('b').Value:= cbbXGJYSC.Text;
        Parameters.ParamByName('c').Value:= cbbXGYWLB.Text;
        Parameters.ParamByName('d').Value:= StrToFloat(edtXGCJJG.Text);
        Parameters.ParamByName('e').Value:= StrToFloat(edtXGCJJE.Text);
        Parameters.ParamByName('f').Value:= StrToInt(edtXGCJSL.Text);
        Parameters.ParamByName('g').Value:= FormatDatetime('YYYY/MM/DD', dtpXGYWRQ.DateTime);
        Parameters.ParamByName('h').Value:= edtXGZQMC.Text;
        Parameters.ParamByName('i').Value:= MainForm.dtpMainForm.DateTime;
      end;
    end
    else if(Caption='新股业务-修改') then
    begin
      if (Trim(edtXGZQDM.Text) = '') or (Trim(cbbXGYWLB.Text) = '') then
      begin
        ShowMessage('请确保所有数据不为空！');
        Exit
      end;
      SQL.Add('update TXG set TXG_JYSC=:b,TXG_CJJG=:d,TXG_CJJE=:e,TXG_CJSL=:f,TXG_YWRQ=:g,'
           + 'TXG_ZQMC=:h where TXG_ZQDM=:a and TXG_YWLB=:c');
      Parameters.ParamByName('a').Value:= edtXGZQDM.Text;
      Parameters.ParamByName('b').Value:= cbbXGJYSC.Text;
      Parameters.ParamByName('c').Value:= cbbXGYWLB.Text;
      Parameters.ParamByName('d').Value:= StrToFloat(edtXGCJJG.Text);
      Parameters.ParamByName('e').Value:= StrToFloat(edtXGCJJE.Text);
      Parameters.ParamByName('f').Value:= StrToInt(edtXGCJSL.Text);
      Parameters.ParamByName('g').Value:= FormatDatetime('YYYY/MM/DD', dtpXGYWRQ.DateTime);
      Parameters.ParamByName('h').Value:= edtXGZQMC.Text;
    end;
    ExecSQL;
  end;
  Close;
  MainForm.dtpZQYWOnChange(Sender);
end;

procedure TZQYWXGForm1.FormCreate(Sender: TObject);
begin
  edtXGCJSL.OnKeyPress := MainForm.EditNumberKeyPress;
  edtXGCJJE.OnKeyPress := MainForm.EditNumberKeyPress;
  edtXGCJJG.OnKeyPress := MainForm.EditNumberKeyPress;

  edtXGCJSL.OnExit := MainForm.EditBumberLeave;
  edtXGCJJE.OnExit := MainForm.EditBumberLeave;
  edtXGCJJG.OnExit := MainForm.EditBumberLeave;

  FormShow(Sender);

end;
procedure TZQYWXGForm1.FormShow(Sender: TObject);
begin
  if (Caption = '新股业务-查看') then
  begin
    edtXGZQDM.Enabled := False;
    dtpXGYWRQ.Enabled := False;
    edtXGZQMC.Enabled := False;
    cbbXGYWLB.Enabled := False;
    cbbXGJYSC.Enabled := False;
    edtXGCJSL.Enabled := False;
    edtXGCJJE.Enabled := False;
    edtXGCJJG.Enabled := False;

    cbbXGZQDM.Visible := False;
    edtXGZQDM.Visible := True;
  end
  else if (Caption = '新股业务-修改') then
  begin
    edtXGZQDM.Enabled := False;
    dtpXGYWRQ.Enabled := True;
    edtXGZQMC.Enabled := True;
    cbbXGYWLB.Enabled := False;
    cbbXGJYSC.Enabled := True;
    edtXGCJSL.Enabled := True;
    edtXGCJJE.Enabled := True;
    edtXGCJJG.Enabled := True;

    cbbXGZQDM.Visible := False;
    edtXGZQDM.Visible := True;
  end
  else
  begin
    edtXGZQDM.Enabled := True;
    dtpXGYWRQ.Enabled := True;
    edtXGZQMC.Enabled := False;
    cbbXGYWLB.Enabled := False;
    cbbXGJYSC.Enabled := False;
    edtXGCJSL.Enabled := True;
    edtXGCJJE.Enabled := True;
    edtXGCJJG.Enabled := True;

    cbbXGZQDM.Visible := True;
    edtXGZQDM.Visible := False;
    cbbXGZQDM.Text := '';
  end;
end;

// 填写证券代码时，显示所有符合要求证券代码
procedure TZQYWXGForm1.SelectZQXX(Sender: TObject);
Var ZQDM :string;
begin
  ZQDM := TComboBox(Sender).Text;
  TComboBox(Sender).Items.Clear;
//  showMessage(ZQDM);
  if ZQDM = '' then exit;
  with qryXGYW do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select TZQXX_ZQDM,TZQXX_ZQMC,TZQXX_JYSC from tzqxx where '+
    'tzqxx_zqlb=''股票'' and tzqxx_zqdm like :a');
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
procedure TZQYWXGForm1.AutoZQXX(Sender: TObject);
Var
    txtLines : TStringList;
begin
  txtLines := TStringList.Create;
  txtLines.Delimiter := '-';

  txtLines.DelimitedText := TComboBox(Sender).Text;
  edtXGZQDM.Text := txtLines[0];
//  cbbGPJYZQDM.Text := txtLines[0];
  edtXGZQMC.Text := txtLines[1];
  cbbXGJYSC.Text := txtLines[2];
end;

// 在点击进入输入控件时，替换控件内容为''
procedure TZQYWXGForm1.EditInitContent(Sender:TObject);
begin
  TEdit(Sender).Text := '';
end;

end.
