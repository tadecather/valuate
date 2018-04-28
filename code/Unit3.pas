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
      if (UserForm.Caption = '增加用户') then
      begin
         MessageBox(handle,'用户名已经存在，请重新输入！','警告',MB_OK);
      end
      else if (UserForm.Caption = '修改密码') then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select YH_MM from TYH where YH_MC=:a');
        Parameters.ParamByName('a').Value:=UserFormUserNameEdit.Text;
        Open;
        if(Fields[0].Value=UserFormPasswdEdit1.Text) then
        begin
          // 输入的新密码不能为空
          if (trim(UserFormPasswdEdit2.Text) = '') then
          begin
            ShowMessage('密码不能为空，请重新输入！');
            exit;
          end;
          Close;
          SQL.Clear;
          SQL.Add('update TYH set YH_MM=:a where YH_MC=:b');
          Parameters.ParamByName('a').Value:=trim(UserFormPasswdEdit2.Text);
          Parameters.ParamByName('b').Value:=trim(UserFormUserNameEdit.Text);
          // 弹框提示修改密码
          if Application.MessageBox(PChar('确定要修改'+UserFormPasswdEdit2.Text+'的密码吗？'),'提示',MB_YESNO)=ID_Yes then
          begin
            ExecSQL;
          end;
          //关闭当前窗口，使主窗口显示，并刷新数据
          UserForm.close;
          MainForm.Visible:=True;
          MainForm.UserRefreshButtonClick(Sender);
        end
        else
          MessageBox(handle,'密码错误，不能更新密码！','错误',MB_OK);
      end
      else if (UserForm.Caption = '删除用户') then
      begin
        // 默认 admin 用户不能删除
        if (trim(UserFormUserNameEdit.Text) = 'admin') or (trim(UserFormUserNameEdit.Text) = 'ADMIN')then
        begin
          ShowMessage('ADMIN 用户不能删除！');
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
          if Application.MessageBox(PChar('确定要删除用户'+UserFormPasswdEdit2.Text+'吗？'),'提示',MB_YESNO)=ID_Yes then
          begin
            ExecSQL;
          end;
          //关闭当前窗口，使主窗口显示，并刷新数据
          UserForm.Close;
          MainForm.Visible:=True;
          MainForm.UserRefreshButtonClick(Sender);
        end
        else
          MessageBox(handle,'密码错误，不能删除！','错误',MB_OK);
      end;
    end
    // 如果用户不存在的操作
    else
    begin
      if (UserForm.Caption = '增加用户') then
      begin
        if (Trim(UserFormPasswdEdit1.Text) = '') then
        begin
          ShowMessage('密码不能为空！');
          exit;
        end;
        if (Trim(UserFormPasswdEdit2.Text) = '') then
        begin
          ShowMessage('请确认密码！');
          exit;
        end;

        if(UserFormPasswdEdit1.Text=UserFormPasswdEdit2.Text) then
        begin
          Close;
          SQL.Clear;
          // 使用自增的SEQ_YJBH 作为用户编号
          SQL.Add('insert into TYH values(SEQ_YHBH.NEXTVAL,:a,:b)');
          Parameters.ParamByName('a').Value:=trim(UserFormUserNameEdit.Text);
          Parameters.ParamByName('b').Value:=trim(UserFormPasswdEdit1.Text);
          ExecSQL;
          //关闭数据库连接，关闭当前窗口，使主窗口显示，并刷新数据
//          UserOperationADOQuery.Close;
          UserForm.Close;
          MainForm.Visible:=True;
          MainForm.UserRefreshButtonClick(Sender);
        end
        else MessageBox(handle,'两次密码不一致，请重新输入！','错误',MB_OK);
      end
      else if (UserForm.Caption = '修改密码') then
      begin
        MessageBox(handle,'用户不存在！','错误',MB_OK)
      end
      else if (UserForm.Caption = '删除用户') then
      begin
        MessageBox(handle,'用户不存在！','错误',MB_OK)
      end;
    end;
  end;

end;

end.
