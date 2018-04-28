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


// ȷ�ϰ�ť���½��еĲ��������б༭���������ֹ���
procedure TZQXXGPForm1.ZQXXGPSureButtonClick(Sender: TObject);
begin
  with ZQXXGPADOQuerry do
  begin
    Close;
    SQL.Clear;

    // ���ݴ������ƽ��в�ͬ�Ĳ���
    if (ZQXXGPForm1.Caption='֤ȯ��Ϣ��Ʊ-�޸�') then
    begin
      // ȷ�����ڲ�Ϊ��
      if (Trim(ZQXXGPZQMCEdit.Text) = '') or (Trim(ZQXXGPZGBEdit.Text) = '')
        or (Trim(ZQXXGPMGMZEdit.Text) = '') then
      begin
        ShowMessage('��ȷ�����е���Ϣ����������');
        Exit;
      end;
      SQL.Add('update TZQXX set TZQXX_JYSC=:a,TZQXX_ZQMC=:b,'+
              'TZQXX_ZGB=:c,TZQXX_MGMZ=:d,TZQXX_FXRQ=:e'+
              ' where TZQXX_ZQDM=:f and TZQXX_ZQLB=''��Ʊ''');
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
        ShowMessage('��ȷ�����е���Ϣ����������');
        Exit;
      end;
      // �������
      // ���֤ȯ��Ϣ�Ѿ�������ô���ܲ���
      SQL.Add('select * from TZQXX where TZQXX_ZQDM=:a and TZQXX_JYSC=:b');
      Parameters.ParamByName('a').Value:=trim(ZQXXGPZQDMEdit.Text);
      Parameters.ParamByName('b').Value:=trim(ZQXXGPJYSCEdit.Text);
      Open;
      if (RecordCount <> 0) then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into TZQXX(TZQXX_ZQDM,TZQXX_JYSC,TZQXX_ZQLB,TZQXX_ZQMC,TZQXX_ZGB,TZQXX_MGMZ,TZQXX_FXRQ)'+
          'Values(:a,:b,''��Ʊ'',:c,:d,:e,:f)');
        Parameters.ParamByName('a').Value:=trim(ZQXXGPZQDMEdit.Text);
        Parameters.ParamByName('b').Value:=trim(ZQXXGPJYSCEdit.Text);
        Parameters.ParamByName('c').Value:=trim(ZQXXGPZQMCEdit.Text);
        Parameters.ParamByName('d').Value:=StrToFloat(ZQXXGPZGBEdit.Text);
        Parameters.ParamByName('e').Value:=StrToFloat(ZQXXGPMGMZEdit.Text);
        Parameters.ParamByName('f').Value:=FormatDatetime('YYYY/MM/DD', dtpZQXXGPFXRQ.DateTime);
      end
      else
      begin
        ShowMessage('��Ʊ��Ϣ�Ѿ����ڣ��벻Ҫ�ظ����룡');
        exit;
      end;
    end;
    ExecSQL;
  end;
  Close;
  MainForm.BasicZQLXComboBox.Text := '��Ʊ';
  MainForm.BasicZQLXComboBoxChange(Sender);
end;

// ������֤ȯ��Ϣʱ��֤ȯ����ComboBox �����仯ʱ�����ò�ͬ�Ĵ���
procedure TZQXXGPForm1.ZQXXGPZQLXComboBoxChange(Sender: TObject);
begin

  if (Caption='֤ȯ��Ϣ����') then
  begin
    if(ZQXXGPZQLXComboBox.Text='ծȯ') then
    begin
      ZQXXZQForm1.show;
      ZQXXZQForm1.ZQXXZQZQLXComboBox.Text:='ծȯ';
      ZQXXZQForm1.Caption:='֤ȯ��Ϣ����';

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
    else if(ZQXXGPZQLXComboBox.Text='�ع�') then
    begin
      ZQXXHGForm1.Show;
      ZQXXHGForm1.ZQXXHGZQLXComboBox.Text:='�ع�';
      ZQXXHGForm1.Caption:='֤ȯ��Ϣ����';

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
