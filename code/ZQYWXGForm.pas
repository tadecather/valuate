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
    ShowMessage('��ȷ���������ݲ�Ϊ�գ�');
    Exit
  end;
  with qryXGYW do
  begin
    Close;
    SQL.Clear;
    if(Caption='�¹�ҵ��-����') then
    begin
      // ���ж��Ƿ��Ѿ��������֤ȯ��������ҵ��
      SQL.Add('select * from TXG where TXG_ZQDM=:a and TXG_YWLB=:c');
      Parameters.ParamByName('a').Value:= edtXGZQDM.Text;
      Parameters.ParamByName('c').Value:= cbbXGYWLB.Text;
      Open;
      if(RecordCount > 0) then
      begin
        ShowMessage(edtXGZQDM.Text + '��' + cbbXGYWLB.Text + 'ҵ���Ѿ����ڣ������ظ�������');
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
    else if(Caption='�¹�ҵ��-�޸�') then
    begin
      if (Trim(edtXGZQDM.Text) = '') or (Trim(cbbXGYWLB.Text) = '') then
      begin
        ShowMessage('��ȷ���������ݲ�Ϊ�գ�');
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
  if (Caption = '�¹�ҵ��-�鿴') then
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
  else if (Caption = '�¹�ҵ��-�޸�') then
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

// ��д֤ȯ����ʱ����ʾ���з���Ҫ��֤ȯ����
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
    'tzqxx_zqlb=''��Ʊ'' and tzqxx_zqdm like :a');
    Parameters.ParamByName('a').Value:=ZQDM + '%';
    Open;
    while not eof do
    begin
        TComboBox(Sender).Items.Add(Fields[0].Text + '-' +
                Fields[1].Text + '-' + Fields[2].Text);
        // ʹ�� next ʹ�α�ָ����һ��
        next;
    end;
  end;
  TComboBox(Sender).DroppedDown := True;
  SendMessage(TComboBox(Sender).Handle, WM_SETCURSOR, 0, 0);
  TComboBox(Sender).Text := ZQDM;
  TComboBox(Sender).SelStart := Length(ZQDM);
end;

// ѡ��һ��֤ȯ�����Ժ��Զ����ҳ���������Ϣ
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

// �ڵ����������ؼ�ʱ���滻�ؼ�����Ϊ''
procedure TZQYWXGForm1.EditInitContent(Sender:TObject);
begin
  TEdit(Sender).Text := '';
end;

end.
