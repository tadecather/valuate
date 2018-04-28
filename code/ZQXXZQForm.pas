unit ZQXXZQForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ComCtrls;

type
  TZQXXZQForm1 = class(TForm)
    ZQXXZQZQLXComboBox: TComboBox;
    ZQXXZQZQLXLabel: TLabel;
    ZQXXZQZQDMLabel: TLabel;
    ZQXXZQZQDMEdit: TEdit;
    ZQXXZQJYSCLabel: TLabel;
    ZQXXZQJYSCEdit: TEdit;
    ZQXXZQMGMZLabel: TLabel;
    ZQXXZQMGMZEdit: TEdit;
    ZQXXZQSureButton: TButton;
    ZQXXZQCancleButton: TButton;
    ZQXXZQADOQuerry: TADOQuery;
    ZQXXZQKSRQLabel: TLabel;
    ZQXXZQKSRQDate: TDateTimePicker;
    ZQXXZQNLLLabel: TLabel;
    ZQXXZQNLLEdit: TEdit;
    ZQXXZQJXFSLabel: TLabel;
    ZQXXZQJXFSEdit: TEdit;
    ZQXXZQQXRLabel: TLabel;
    ZQXXZQQXRDate: TDateTimePicker;
    ZQXXZQZQMCLabel: TLabel;
    ZQXXZQZQMCEdit: TEdit;
    lblZQXXZQLXS: TLabel;
    edtZQXXZQLXS: TEdit;
    procedure ZQXXZQCancleButtonClick(Sender: TObject);
    procedure ZQXXZQZQLXComboBoxChange(Sender: TObject);
    procedure ZQXXZQSureButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
     private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZQXXZQForm1: TZQXXZQForm1;

implementation

uses ZQXXGPForm, ZQXXHGForm, Unit2;

{$R *.dfm}



procedure TZQXXZQForm1.ZQXXZQCancleButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TZQXXZQForm1.ZQXXZQZQLXComboBoxChange(Sender: TObject);
begin
 if (Caption='֤ȯ��Ϣ����') then
  begin
    if(ZQXXZQZQLXComboBox.Text='��Ʊ') then
    begin
      MainForm.BasicAddButtonClick(Sender);
      ZQXXGPForm1.ZQXXGPZQLXComboBox.Text:='��Ʊ';
    end
    else if(ZQXXZQZQLXComboBox.Text='�ع�') then
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

procedure TZQXXZQForm1.ZQXXZQSureButtonClick(Sender: TObject);
begin
  with ZQXXZQADOQuerry do
  begin
    Close;
    SQL.Clear;

    // �����Ϣ������
    if  (Trim(ZQXXZQZQMCEdit.Text) = '') or (Trim(ZQXXZQMGMZEdit.Text) = '')
       or (Trim(ZQXXZQNLLEdit.Text) = '') or (Trim(edtZQXXZQLXS.Text) = '')
       or (Trim(ZQXXZQJXFSEdit.Text) = '') then
    begin
      ShowMessage('��ȷ�����е���Ϣ����������');
      Exit;
    end;
    // ���ݴ������ƽ��в�ͬ�Ĳ���
    if (ZQXXZQForm1.Caption='֤ȯ��Ϣծȯ-�޸�') then
    begin
      SQL.Add('update TZQXX set TZQXX_JYSC=:a,TZQXX_ZQMC=:b,'+
              'TZQXX_MGMZ=:c,TZQXX_FXRQ=:d,TZQXX_QXR=:e,TZQXX_NLL=:f,'+
              'TZQXX_LXS=:g,TZQXX_FXFS=:h'+
              ' where TZQXX_ZQDM=:i and TZQXX_ZQLB=''ծȯ''');
      Parameters.ParamByName('a').Value:=trim(ZQXXZQJYSCEdit.Text);
      Parameters.ParamByName('b').Value:=trim(ZQXXZQZQMCEdit.Text);
      Parameters.ParamByName('c').Value:=StrToFloat(ZQXXZQMGMZEdit.Text);
      Parameters.ParamByName('d').Value:=FormatDatetime('YYYY/MM/DD', ZQXXZQKSRQDate.DateTime);
      Parameters.ParamByName('e').Value:=FormatDatetime('YYYY/MM/DD', ZQXXZQQXRDate.DateTime);
      Parameters.ParamByName('f').Value:=StrToFloat(ZQXXZQNLLEdit.Text);
      Parameters.ParamByName('g').Value:=StrToFloat(edtZQXXZQLXS.Text);
      Parameters.ParamByName('h').Value:=trim(ZQXXZQJXFSEdit.Text);
      Parameters.ParamByName('i').Value:=trim(ZQXXZQZQDMEdit.Text);
    end
    else
    begin
      // ��һ����� ������������Ҫ��
      if  (Trim(ZQXXZQZQLXComboBox.Text) = '') or (Trim(ZQXXZQZQDMEdit.Text) = '')
       or (Trim(ZQXXZQJYSCEdit.Text) = '')  then
      begin
        ShowMessage('��ȷ�����е���Ϣ����������');
        Exit;
      end;
      // ���֤ȯ��Ϣ�Ѿ�������ô���ܲ���
      SQL.Add('select * from TZQXX where TZQXX_ZQDM=:i and TZQXX_JYSC=:a');
      Parameters.ParamByName('i').Value:=trim(ZQXXZQZQDMEdit.Text);
      Parameters.ParamByName('a').Value:=trim(ZQXXZQJYSCEdit.Text);
      Open;
      if (RecordCount <> 0) then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into TZQXX(TZQXX_ZQDM,TZQXX_JYSC,TZQXX_ZQLB,TZQXX_ZQMC,TZQXX_MGMZ,TZQXX_FXRQ,'+
              'TZQXX_QXR,TZQXX_NLL,TZQXX_LXS,TZQXX_FXFS)'+
              ' Values(:i,:a,''ծȯ'',:b,:c,:d,:e,:f,:g,:h)');
        Parameters.ParamByName('a').Value:=ZQXXZQJYSCEdit.Text;
        Parameters.ParamByName('b').Value:=ZQXXZQZQMCEdit.Text;
        Parameters.ParamByName('c').Value:=StrToFloat(ZQXXZQMGMZEdit.Text);
        Parameters.ParamByName('d').Value:=FormatDatetime('YYYY/MM/DD', ZQXXZQKSRQDate.DateTime);
        Parameters.ParamByName('e').Value:=FormatDatetime('YYYY/MM/DD', ZQXXZQQXRDate.DateTime);
        Parameters.ParamByName('f').Value:=StrToFloat(ZQXXZQNLLEdit.Text);
        Parameters.ParamByName('g').Value:=StrToFloat(edtZQXXZQLXS.Text);
        Parameters.ParamByName('h').Value:=ZQXXZQJXFSEdit.Text;
        Parameters.ParamByName('i').Value:=ZQXXZQZQDMEdit.Text;
      end
      else
      begin
        ShowMessage('ծȯ��Ϣ�Ѿ����ڣ��벻Ҫ�ظ����룡');
        exit;
      end;
    end;
    ExecSQL;
  end;
  Close;
  MainForm.BasicZQLXComboBox.Text := 'ծȯ';
  MainForm.BasicZQLXComboBoxChange(Sender);
end;

procedure TZQXXZQForm1.FormCreate(Sender: TObject);
begin
  ZQXXZQMGMZEdit.OnKeyPress := MainForm.EditNumberKeyPress;
  ZQXXZQNLLEdit.OnKeyPress := MainForm.EditNumberKeyPress;
  edtZQXXZQLXS.OnKeyPress := MainForm.EditNumberKeyPress;

  ZQXXZQMGMZEdit.OnExit := MainForm.EditBumberLeave;
  ZQXXZQNLLEdit.OnExit := MainForm.EditBumberLeave;
  edtZQXXZQLXS.OnExit := MainForm.EditBumberLeave;
end;

end.
