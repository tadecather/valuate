unit ZQXXGPForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ComCtrls;

type
  TZQXXGPForm1 = class(TForm)
    ZQXXGPZQLXComboBox: TComboBox;
    ZQXXGPZQLXLabel: TLabel;
    ZQXXGPZQDMLabel: TLabel;
    ZQXXGPZQDMEdit: TEdit;
    ZQXXGPJYSCLabel: TLabel;
    ZQXXGPJYSCEdit: TEdit;
    ZQXXGPZGBLabel: TLabel;
    ZQXXGPZGBEdit: TEdit;
    ZQXXGPMGMZLabel: TLabel;
    ZQXXGPMGMZEdit: TEdit;
    ZQXXGPSureButton: TButton;
    ZQXXGPCancleButton: TButton;
    ZQXXGPADOQuerry: TADOQuery;
    ZQXXGPZQMCLabel: TLabel;
    ZQXXGPZQMCEdit: TEdit;
    lblFXRQZQXXGP: TLabel;
    dtpZQXXGPFXRQ: TDateTimePicker;
    procedure ZQXXGPCancleButtonClick(Sender: TObject);
    procedure ZQXXGPSureButtonClick(Sender: TObject);
    procedure ZQXXGPZQLXComboBoxChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZQXXGPForm1: TZQXXGPForm1;

implementation

uses Unit2,ZQXXHGForm,ZQXXZQForm;

{$R *.dfm}

procedure TZQXXGPForm1.ZQXXGPCancleButtonClick(Sender: TObject);
begin
  Close;
end;


// 确认按钮按下进行的操作，会有编辑和增加两种功能
procedure TZQXXGPForm1.ZQXXGPSureButtonClick(Sender: TObject);
begin
  with ZQXXGPADOQuerry do
  begin
    Close;
    SQL.Clear;

    // 根据窗口名称进行不同的操作
    if (ZQXXGPForm1.Caption='证券信息股票-修改') then
    begin
      // 确保存在不为空
      if (Trim(ZQXXGPZQMCEdit.Text) = '') or (Trim(ZQXXGPZGBEdit.Text) = '')
        or (Trim(ZQXXGPMGMZEdit.Text) = '') then
      begin
        ShowMessage('请确保所有的信息完整！！！');
        Exit;
      end;
      SQL.Add('update TZQXX set TZQXX_JYSC=:a,TZQXX_ZQMC=:b,'+
              'TZQXX_ZGB=:c,TZQXX_MGMZ=:d,TZQXX_FXRQ=:e'+
              ' where TZQXX_ZQDM=:f and TZQXX_ZQLB=''股票''');
      Parameters.ParamByName('a').Value:=trim(ZQXXGPJYSCEdit.Text);
      Parameters.ParamByName('b').Value:=trim(ZQXXGPZQMCEdit.Text);
      Parameters.ParamByName('c').Value:=StrToInt(ZQXXGPZGBEdit.Text);
      Parameters.ParamByName('d').Value:=StrToFloat(ZQXXGPMGMZEdit.Text);
      Parameters.ParamByName('e').Value:=FormatDatetime('YYYY/MM/DD', dtpZQXXGPFXRQ.DateTime);
      Parameters.ParamByName('f').Value:=trim(ZQXXGPZQDMEdit.Text);

    end
    else
    begin
      if (Trim(ZQXXGPZQMCEdit.Text) = '') or (Trim(ZQXXGPZGBEdit.Text) = '')
        or(Trim(ZQXXGPMGMZEdit.Text) = '') or  (trim(ZQXXGPZQDMEdit.Text) = '')
        or (Trim(ZQXXGPJYSCEdit.Text) = '')  then
      begin
        ShowMessage('请确保所有的信息完整！！！');
        Exit;
      end;
      // 插入操作
      // 如果证券信息已经存在那么不能插入
      SQL.Add('select * from TZQXX where TZQXX_ZQDM=:a and TZQXX_JYSC=:b');
      Parameters.ParamByName('a').Value:=trim(ZQXXGPZQDMEdit.Text);
      Parameters.ParamByName('b').Value:=trim(ZQXXGPJYSCEdit.Text);
      Open;
      if (RecordCount <> 0) then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into TZQXX(TZQXX_ZQDM,TZQXX_JYSC,TZQXX_ZQLB,TZQXX_ZQMC,TZQXX_ZGB,TZQXX_MGMZ,TZQXX_FXRQ)'+
          'Values(:a,:b,''股票'',:c,:d,:e,:f)');
        Parameters.ParamByName('a').Value:=trim(ZQXXGPZQDMEdit.Text);
        Parameters.ParamByName('b').Value:=trim(ZQXXGPJYSCEdit.Text);
        Parameters.ParamByName('c').Value:=trim(ZQXXGPZQMCEdit.Text);
        Parameters.ParamByName('d').Value:=StrToFloat(ZQXXGPZGBEdit.Text);
        Parameters.ParamByName('e').Value:=StrToFloat(ZQXXGPMGMZEdit.Text);
        Parameters.ParamByName('f').Value:=FormatDatetime('YYYY/MM/DD', dtpZQXXGPFXRQ.DateTime);
      end
      else
      begin
        ShowMessage('股票信息已经存在，请不要重复插入！');
        exit;
      end;
    end;
    ExecSQL;
  end;
  Close;
  MainForm.BasicZQLXComboBox.Text := '股票';
  MainForm.BasicZQLXComboBoxChange(Sender);
end;

// 当新增证券信息时，证券类型ComboBox 发生变化时，调用不同的窗口
procedure TZQXXGPForm1.ZQXXGPZQLXComboBoxChange(Sender: TObject);
begin

  if (Caption='证券信息新增') then
  begin
    if(ZQXXGPZQLXComboBox.Text='债券') then
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
    else if(ZQXXGPZQLXComboBox.Text='回购') then
    begin
      ZQXXHGForm1.Show;
      ZQXXHGForm1.ZQXXHGZQLXComboBox.Text:='回购';
      ZQXXHGForm1.Caption:='证券信息新增';

      ZQXXHGForm1.ZQXXHGZQDMEdit.Text:='';
      ZQXXHGForm1.ZQXXHGJYSCEdit.Text:='';
      ZQXXHGForm1.ZQXXHGZQMCEdit.Text:='';
      ZQXXHGForm1.dtpZQXXHGFXRQ.DateTime:=MainForm.dtpMainForm.DateTime;
      ZQXXHGForm1.ZQXXHGHGTSEdit.Text:='0';

      ZQXXHGForm1.ZQXXHGZQLXComboBox.Enabled := True;
      ZQXXHGForm1.ZQXXHGZQDMEdit.Enabled := True;
      ZQXXHGForm1.ZQXXHGJYSCEdit.Enabled := True;
      ZQXXHGForm1.ZQXXHGZQMCEdit.Enabled := True;
      ZQXXHGForm1.dtpZQXXHGFXRQ.Enabled := True;
      ZQXXHGForm1.ZQXXHGHGTSEdit.Enabled := True;
    end
    else Exit;
    Close;
  end;
end;

procedure TZQXXGPForm1.FormCreate(Sender: TObject);
begin
  ZQXXGPZGBEdit.OnKeyPress := MainForm.EditNumberKeyPress;
  ZQXXGPMGMZEdit.OnKeyPress := MainForm.EditNumberKeyPress;
  
  ZQXXGPZGBEdit.OnExit := MainForm.EditBumberLeave;
  ZQXXGPMGMZEdit.OnExit := MainForm.EditBumberLeave;

end;

end.
