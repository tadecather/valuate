unit Unit1;
{
CreateBY:Tad
Time:2018/03/26
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, DB, ADODB, ExtCtrls, jpeg, Buttons ;

type
  TLoginForm = class(TForm)
    imgLoginBack: TImage;
    lblLoginFormPassword: TLabel;
    lblLoginFormUserName: TLabel;
    btnLogin: TSpeedButton;
    btnCancle: TSpeedButton;
    cbbLoginFormUserName: TComboBox;
    edtLoginFormPassword: TEdit;
    qryLoginForm: TADOQuery;
    procedure LoginFormSureButtonClick(Sender: TObject);
    procedure LoginFormCancleButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginForm: TLoginForm;

implementation

{$R *.dfm}

uses unit2;


// 点击 Cancle 按钮退出程序按钮
procedure TLoginForm.LoginFormCancleButtonClick(Sender: TObject);
begin
  Application.Terminate;
end;

// 点击 Login 按钮进行密码匹配
procedure TLoginForm.LoginFormSureButtonClick(Sender: TObject);
begin
  with qryLoginForm do
  begin
    Close;
    SQL.Clear;
    // 设置参数需要注意 SQL 语句中使用 =：
    SQL.Add('select YH_MM from TYH where YH_MC=:a');
    Parameters.ParamByName('a').Value:=cbbLoginFormUserName.Text;
    // select 使用 open 执行 SQL 语句，其他使用 ExecSQL 执行
    open;
    // 使用 trim 函数去除两边空格 然后使用 = 判断字符串的相等
    if(trim(edtLoginFormPassword.Text)=Fields[0].Text) then
    begin

      // 调用其他窗口的 show 函数使其显示出来
      MainForm.show;
      LoginForm.Visible := False;
      // 设置主界面中的登录的用户名
      MainForm.lblLoginUserName.Caption := LoginForm.cbbLoginFormUserName.Text;
    // if 语句没有结束，所以 end 后不使用 ；进行语句结束
    end
    else
    
      // MessageBox 弹出提示框 四个参数分别为 父句柄，提示内容，提示标题，以及出现的按钮的解释
      MessageBox(handle,'密码错误，请重新输入！','警告',MB_OK);
      edtLoginFormPassword.Text:='';
  end;

end;

// 进行窗口初始化操作
procedure TLoginForm.FormCreate(Sender: TObject);
Var User,PassWord,DataSource,lineStr,FilePath: String;
    configFile : TextFile;
    txtLines:TStringList;
var mstyle : LongInt;
begin
  // 使用文件读取连接路径
  FilePath := 'config/valuate.cfg';
  if FileExists(FilePath) then
  begin
    AssignFile(configFile, FilePath);
    // 只读方式打开文件
    Reset(configFile);
    // 设置每行的分割符号
    txtLines := TStringList.Create;
    txtLines.Delimiter := '=';
    while Not EOF(configFile) do
    begin
      // 读取一行
      Readln(configFile, lineStr);
      // 使用 = 进行分割
      txtLines.DelimitedText := lineStr;

      if(Trim(txtLines[0]) = 'USER') then User := Trim(txtLines[1]);
      if(Trim(txtLines[0]) = 'PASSWORD') then PassWord := Trim(txtLines[1]);
      if(Trim(txtLines[0]) = 'DATASOURCE') then  DataSource := Trim(txtLines[1]);

    end;
    // 关闭文件时，传入参数为 文件句柄 **不是文件路径 **
    // FileClose关闭用FileOpen或FileCreate方法打开的文件，需要提供文件句柄参数；
    // CloseFile关闭用Reset、Rewrite或Append方法打开的文件，需要提供文件变量参数，这个参数由AssignFile方法获得。
    CloseFile(configFile);

    // 设置连接
    qryLoginForm.ConnectionString := 'Provider=OraOLEDB.Oracle.1;Password='+ PassWord +
    ';Persist Security Info=True;User ID='+ User +';Data Source=' + DATASOURCE;

    //showmessage(qryLoginForm.ConnectionString);
  end
  else
  begin
    ShowMessage('请配置配置Config目录下的 Valuate.cfg 文件！');
    Application.Terminate;
  end;




  cbbLoginFormUserName.items.Clear;
  with qryLoginForm do
  begin
    close;
    SQL.Clear;
    SQL.Add('select YH_MC from TYH');
    Open;
    // 使用 not eof 进行判断游标是否为空
    while not eof do
    begin
     cbbLoginFormUserName.items.add(Fields[0].Text);
     // 使用 next 使游标指向下一列
     next;
    end;
  end;
  // 默认选中第一条
  cbbLoginFormUserName.ItemIndex:=0;
  edtLoginFormPassword.Text:='abc';

  mstyle :=  GetWindowLong(Handle, GWL_STYLE);
  SetWindowLong(Handle, GWL_STYLE, mStyle and not WS_CAPTION);
  BorderStyle:= bsNone;
end;

procedure TLoginForm.FormShow(Sender: TObject);
begin
  // 调用函数实现窗口初始化
  LoginForm.FormCreate(Sender);
end;

end.
