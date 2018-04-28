unit ZQXXHGForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ComCtrls;

type
  TZQXXHGForm1 = class(TForm)
    ZQXXHGZQLXComboBox: TComboBox;
    ZQXXHGZQLXLabel: TLabel;
    ZQXXHGZQDMLabel: TLabel;
    ZQXXHGZQDMEdit: TEdit;
    ZQXXHGJYSCLabel: TLabel;
    ZQXXHGJYSCEdit: TEdit;
    ZQXXHGHGTSLabel: TLabel;
    ZQXXHGHGTSEdit: TEdit;
    ZQXXHGSureButton: TButton;
    ZQXXHGCancleButton: TButton;
    ZQXXHGADOQuerry: TADOQuery;
    ZQXXHGZQMCLabel: TLabel;
    ZQXXHGZQMCEdit: TEdit;
    lblFXRQZQXXHG: TLabel;
    dtpZQXXHGFXRQ: TDateTimePicker;
    procedure ZQXXHGCancleButtonClick(Sender: TObject);
    procedure ZQXXHGZQLXComboBoxChange(Sender: TObject);
    procedure ZQXXHGSureButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZQXXHGForm1: TZQXXHGForm1;

implementation

uses unit2,ZQXXZQForm, ZQXXGPForm;

{$R *.dfm}

procedure TZQXXHGForm1.ZQXXHGCancleButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TZQXXHGForm1.ZQXXHGZQLXComboBoxChange(Sender: TObject);
begin
   if (Caption='证券信息新增') then
   begin
    if(ZQXXHGZQLXComboBox.Text='债券') then
    begin
      ZQXXZQForm1.show;
      ZQXXZQForm1.ZQXXZQZQLXComboBox.Text:='债券';
      ZQXXZQForm1.Caption:='证券信息新增';

      ZQXXZQForm1.ZQXXZQZQDMEdit.Text:='';
      ZQXXZQForm1.ZQXXZQJYSCEdit.Text:='';
      ZQXXZQForm1.ZQXXZQZQMCEdit.Text:='';
      ZQXXZQForm1.ZQXXZQMGMZEdit.Text:='';
      ZQXXZQForm1.ZQXXZQKSRQDate.DateTime:=MainForm.dtpMainForm.DateTime;
      ZQXXZQForm1.ZQXXZQQXRDate.DateTime:=MainForm.dtpMainForm.DateTime;
      ZQXXZQForm1.ZQXXZQNLLEdit.Text:='0.0';
      ZQXXZQForm1.edtZQXXZQLXS.Text:='0.0';
      ZQXXZQForm1.ZQXXZQJXFSEdit.Text:='';

      ZQXXZQForm1.ZQXXZQZQDMEdit.Enabled := True;
      ZQXXZQForm1.ZQXXZQZQLXComboBox.Enabled := True;
      ZQXXZQForm1.ZQXXZQJYSCEdit.Enabled := True;
      ZQXXZQForm1.ZQXXZQZQMCEdit.Enabled := True;
      ZQXXZQForm1.ZQXXZQMGMZEdit.Enabled := True;
      ZQXXZQForm1.ZQXXZQKSRQDate.Enabled := True;
      ZQXXZQForm1.ZQXXZQKSRQDate.Enabled := True;
      ZQXXZQForm1.ZQXXZQQXRDate.Enabled := True;
      ZQXXZQForm1.ZQXXZQNLLEdit.Enabled := True;
      ZQXXZQForm1.edtZQXXZQLXS.Enabled := True;
      ZQXXZQForm1.ZQXXZQJXFSEdit.Enabled := True;

    end
    else if(ZQXXHGZQLXComboBox.Text='股票') then
    begin
      MainForm.BasicAddButtonClick(Sender);
      ZQXXGPForm1.ZQXXGPZQLXComboBox.Text:='股票';
    end
    else Exit;
    Close;
  end;
end;


procedure TZQXXHGForm1.ZQXXHGSureButtonClick(Sender: TObject);
begin
  with ZQXXHGADOQuerry do
  begin
    Close;
    SQL.Clear;

    if (Trim(ZQXXHGZQMCEdit.Text) = '') or (Trim(ZQXXHGHGTSEdit.Text) = '') then
    begin
      ShowMessage('请确保所有的信息完整！！！');
      Exit;
    end;


    // 根据窗口名称进行不同的操作
    if (ZQXXHGForm1.Caption='证券信息回购-修改') then
    begin
      SQL.Add('update TZQXX set TZQXX_ZQMC=:a,TZQXX_JYSC=:b,TZQXX_FXRQ=:c,TZQXX_HGTS=:d '+
              'where TZQXX_ZQDM=:e and TZQXX_ZQLB=''回购''');
      Parameters.ParamByName('a').Value:=trim(ZQXXHGZQMCEdit.Text);
      Parameters.ParamByName('b').Value:=trim(ZQXXHGJYSCEdit.Text);
      Parameters.ParamByName('c').Value:=FormatDatetime('YYYY/MM/DD', dtpZQXXHGFXRQ.DateTime);
      Parameters.ParamByName('d').Value:=StrToInt(ZQXXHGHGTSEdit.Text);
      Parameters.ParamByName('e').Value:=trim(ZQXXHGZQDMEdit.Text);
    end
    else
    begin
      if (Trim(ZQXXHGZQLXComboBox.Text) = '') or (Trim(ZQXXHGZQDMEdit.Text) = '')
        or (Trim(ZQXXHGJYSCEdit.Text) = '')  then
      begin
        ShowMessage('请确保所有的信息完整！！！');
        Exit;
      end;

      SQL.Add('select * from TZQXX where TZQXX_ZQDM=:a and TZQXX_JYSC=:b');
      Parameters.ParamByName('a').Value:=trim(ZQXXHGZQDMEdit.Text);
      Parameters.ParamByName('b').Value:=trim(ZQXXHGJYSCEdit.Text);
      Open;
      if (RecordCount <> 0) then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into TZQXX(TZQXX_ZQDM,TZQXX_JYSC,TZQXX_ZQLB,TZQXX_ZQMC,TZQXX_FXRQ,'+
              'TZQXX_HGTS) Values(:e,:b,''回购'',:a,:c,:d)');
        Parameters.ParamByName('a').Value:=trim(ZQXXHGZQMCEdit.Text);
        Parameters.ParamByName('b').Value:=trim(ZQXXHGJYSCEdit.Text);
        Parameters.ParamByName('c').Value:=FormatDatetime('YYYY/MM/DD', dtpZQXXHGFXRQ.DateTime);
        Parameters.ParamByName('d').Value:=StrToInt(ZQXXHGHGTSEdit.Text);
        Parameters.ParamByName('e').Value:=trim(ZQXXHGZQDMEdit.Text);
      end
      else
      begin
        ShowMessage('回购信息已经存在，请不要重复插入！');
        exit;
      end;
    end;
    ExecSQL;
  end;
  Close;
  MainForm.BasicZQLXComboBox.Text := '回购';
  MainForm.BasicZQLXComboBoxChange(Sender);
end;

procedure TZQXXHGForm1.FormCreate(Sender: TObject);
begin
  ZQXXHGHGTSEdit.OnKeyPress := MainForm.EditNumberKeyPress;
  ZQXXHGHGTSEdit.OnExit := MainForm.EditBumberLeave;
end;

end.
