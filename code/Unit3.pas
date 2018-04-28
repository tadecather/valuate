unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB;

type
  TUserForm = class(TForm)
    UserFormUserNameLabel: TLabel;
    UserFormUserNameEdit: TEdit;
    UserFormPasswdEdit1: TEdit;
    UserFormPasswdEdit2: TEdit;
    UserFormSureButton: TButton;
    UserFormCancleButton: TButton;
    UserFormPasswdLabel1: TLabel;
    UserFormPasswdLabel2: TLabel;
    UserOperationADOQuery: TADOQuery;
    procedure UserFormCancleButtonClick(Sender: TObject);
    procedure UserFormSureButtonClick(Sender: TObject);

     private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UserForm: TUserForm;

implementation

uses unit2;

{$R *.dfm}


procedure TUserForm.UserFormCancleButtonClick(Sender: TObject);
begin
  UserFormUserNameEdit.ReadOnly := False;
  UserFormPasswdEdit1.ReadOnly := False;
  UserFormPasswdEdit2.ReadOnly := False;
  UserForm.Close;
  MainForm.Visible:=True;
end;


procedure TUserForm.UserFormSureButtonClick(Sender: TObject);
begin
  with UserOperationADOQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select YH_MC from TYH where YH_MC=:a');
    Parameters.ParamByName('a').Value:=UserFormUserNameEdit.Text;
    Open;
    if (RecordCount>0) then
    begin
      if (UserForm.Caption = '�����û�') then
      begin
         MessageBox(handle,'�û����Ѿ����ڣ����������룡','����',MB_OK);
      end
      else if (UserForm.Caption = '�޸�����') then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select YH_MM from TYH where YH_MC=:a');
        Parameters.ParamByName('a').Value:=UserFormUserNameEdit.Text;
        Open;
        if(Fields[0].Value=UserFormPasswdEdit1.Text) then
        begin
          // ����������벻��Ϊ��
          if (trim(UserFormPasswdEdit2.Text) = '') then
          begin
            ShowMessage('���벻��Ϊ�գ����������룡');
            exit;
          end;
          Close;
          SQL.Clear;
          SQL.Add('update TYH set YH_MM=:a where YH_MC=:b');
          Parameters.ParamByName('a').Value:=trim(UserFormPasswdEdit2.Text);
          Parameters.ParamByName('b').Value:=trim(UserFormUserNameEdit.Text);
          // ������ʾ�޸�����
          if Application.MessageBox(PChar('ȷ��Ҫ�޸�'+UserFormPasswdEdit2.Text+'��������'),'��ʾ',MB_YESNO)=ID_Yes then
          begin
            ExecSQL;
          end;
          //�رյ�ǰ���ڣ�ʹ��������ʾ����ˢ������
          UserForm.close;
          MainForm.Visible:=True;
          MainForm.UserRefreshButtonClick(Sender);
        end
        else
          MessageBox(handle,'������󣬲��ܸ������룡','����',MB_OK);
      end
      else if (UserForm.Caption = 'ɾ���û�') then
      begin
        // Ĭ�� admin �û�����ɾ��
        if (trim(UserFormUserNameEdit.Text) = 'admin') or (trim(UserFormUserNameEdit.Text) = 'ADMIN')then
        begin
          ShowMessage('ADMIN �û�����ɾ����');
          exit;
        end;
        Close;
        SQL.Clear;
        SQL.Add('select YH_MM from TYH where YH_MC=:a');
        Parameters.ParamByName('a').Value:=UserFormUserNameEdit.Text;
        Open;
        if(Fields[0].Value=UserFormPasswdEdit1.Text) then
        begin
          Close;
          SQL.Clear;
          SQL.Add('delete from TYH where YH_MC=:a');
          Parameters.ParamByName('a').Value:=trim(UserFormUserNameEdit.Text);
          if Application.MessageBox(PChar('ȷ��Ҫɾ���û�'+UserFormPasswdEdit2.Text+'��'),'��ʾ',MB_YESNO)=ID_Yes then
          begin
            ExecSQL;
          end;
          //�رյ�ǰ���ڣ�ʹ��������ʾ����ˢ������
          UserForm.Close;
          MainForm.Visible:=True;
          MainForm.UserRefreshButtonClick(Sender);
        end
        else
          MessageBox(handle,'������󣬲���ɾ����','����',MB_OK);
      end;
    end
    // ����û������ڵĲ���
    else
    begin
      if (UserForm.Caption = '�����û�') then
      begin
        if (Trim(UserFormPasswdEdit1.Text) = '') then
        begin
          ShowMessage('���벻��Ϊ�գ�');
          exit;
        end;
        if (Trim(UserFormPasswdEdit2.Text) = '') then
        begin
          ShowMessage('��ȷ�����룡');
          exit;
        end;

        if(UserFormPasswdEdit1.Text=UserFormPasswdEdit2.Text) then
        begin
          Close;
          SQL.Clear;
          // ʹ��������SEQ_YJBH ��Ϊ�û����
          SQL.Add('insert into TYH values(SEQ_YHBH.NEXTVAL,:a,:b)');
          Parameters.ParamByName('a').Value:=trim(UserFormUserNameEdit.Text);
          Parameters.ParamByName('b').Value:=trim(UserFormPasswdEdit1.Text);
          ExecSQL;
          //�ر����ݿ����ӣ��رյ�ǰ���ڣ�ʹ��������ʾ����ˢ������
//          UserOperationADOQuery.Close;
          UserForm.Close;
          MainForm.Visible:=True;
          MainForm.UserRefreshButtonClick(Sender);
        end
        else MessageBox(handle,'�������벻һ�£����������룡','����',MB_OK);
      end
      else if (UserForm.Caption = '�޸�����') then
      begin
        MessageBox(handle,'�û������ڣ�','����',MB_OK)
      end
      else if (UserForm.Caption = 'ɾ���û�') then
      begin
        MessageBox(handle,'�û������ڣ�','����',MB_OK)
      end;
    end;
  end;

end;

end.
