unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Menus, Buttons, DB, ADODB, Grids, DBGrids,
  CheckLst, FileOperation;

type
  TMainForm = class(TForm)
    PageControl1: TPageControl;
    SysManageTab: TTabSheet;
    BasicSettigTab: TTabSheet;
    dtpMainForm: TDateTimePicker;
    SubMenuSysM: TTreeView;
    BasicSubMenuTreeView: TTreeView;
    tsDataManage: TTabSheet;
    tsZQYW: TTabSheet;
    tsRCCZ: TTabSheet;
    tsBBCK: TTabSheet;
    tvZQYW: TTreeView;
    tvBBCKMenu: TTreeView;
    UserDBGrid: TDBGrid;
    UserSearchEdit: TEdit;
    UerSearchButton: TBitBtn;
    UserADOQuery: TADOQuery;
    UserDataSource: TDataSource;
    UserDBGPopMenu: TPopupMenu;
    UserDBGDel: TMenuItem;
    UserDBGChangePasswd: TMenuItem;
    UserRefreshButton: TButton;
    UserScanButton: TButton;
    UserAddButton: TButton;
    BasicScanButton: TButton;
    BasicRefreshButton: TButton;
    BasicSearchEdit: TEdit;
    BasicSearchButton: TBitBtn;
    BasicSettingDBGrid: TDBGrid;
    BasicEditButton: TButton;
    BasicAddButton: TButton;
    BasicZQLXComboBox: TComboBox;
    BasicDBGPopMenu: TPopupMenu;
    BasicDBGScanButton: TMenuItem;
    BasicDBGEditButton: TMenuItem;
    BasicDBGDeleteButton: TMenuItem;
    dbgrdDataManage: TDBGrid;
    tvDataManage: TTreeView;
    btnScanDataManage: TButton;
    btnEditDataManage: TButton;
    btnAddDataManage: TButton;
    btnFreshDataManage: TButton;
    edtSearchDataManage: TEdit;
    btnSearchDataManage: TBitBtn;
    lblKSRQDataMaage: TLabel;
    lblJSRQDataManage: TLabel;
    dtpKSRQDataManage: TDateTimePicker;
    dtpJSRQDataManage: TDateTimePicker;
    dbgrdZQYW: TDBGrid;
    btnZQYWScan: TButton;
    btnZQYWEdit: TButton;
    btnZQYWAdd: TButton;
    btnZQYWFresh: TButton;
    lblZQYWYWRQ: TLabel;
    dtpZQYWKSRQ: TDateTimePicker;
    lbRQCenter: TLabel;
    dtpZQYWJSRQ: TDateTimePicker;
    edtZQYWSearch: TEdit;
    btnZQYWSearch: TBitBtn;
    conMainForm: TADOConnection;
    lvRCCZ: TListView;
    dtpRCCZYWRQ: TDateTimePicker;
    lblRCCZYWRQ: TLabel;
    pbRCCZ: TProgressBar;
    btnRZQS: TButton;
    btnRCCZSCPZ: TButton;
    lblRCCZCLJD: TLabel;
    btnRCCZRecover: TButton;
    btnPZLL: TButton;
    dbgrdBBCK: TDBGrid;
    lblBCKTitle: TLabel;
    dtpBBCKYWRQ: TDateTimePicker;
    lblBBCKYWRQ: TLabel;
    lblLoginUserName: TLabel;
    pmDM: TPopupMenu;
    pmDMN1: TMenuItem;
    pmDMN2: TMenuItem;
    pmDMN4: TMenuItem;
    pmZQYW: TPopupMenu;
    mni1: TMenuItem;
    mni2: TMenuItem;
    mni3: TMenuItem;
    N1: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    qryUserPasswd: TADOQuery;

    procedure UserRefreshButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SubMenuSysMCustomDrawItem(Sender: TCustomTreeView;
              Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure SubMenuSysMOnChange(Sender: TObject);
    procedure UerSearchButtonClick(Sender: TObject);
    procedure UserDBGDelClick(Sender: TObject);
    procedure UserDBGChangePasswdClick(Sender: TObject);
    procedure UserScanButtonClick(Sender: TObject);
    procedure UserAddButtonClick(Sender: TObject);

    procedure BasicSettingTabShow(Sender: TObject);
    procedure BasicRefreshButtonClick(Sender: TObject);
    procedure BasicEditButtonClick(Sender: TObject);
    procedure BasicScanButtonClick(Sender: TObject);
    procedure BasicSearchButtonClick(Sender: TObject);
    procedure BasicSubMenuOnClick(Sender: TObject);
    procedure SelectAllBasicSetting(Sender: TObject; Szkm: String);
    procedure BasicAddButtonClick(Sender: TObject);
    procedure BasicZQLXComboBoxChange(Sender: TObject);
    procedure BasicDBGScanButtonClick(Sender: TObject);
    procedure BasicDBGEditButtonClick(Sender: TObject);
    procedure BasicDBGDeleteButtonClick(Sender: TObject);
    procedure ChangedbgrXTSZTitle(Sender:Tobject);
    
    procedure tsDataManageShow(Sender: TObject);
    procedure dtpDataManageOnChange(Sender: TObject);
    procedure btnSearchDataManageClick(Sender: TObject);
    procedure btnFreshDataManageClick(Sender: TObject);
    procedure btnScanDataManageClick(Sender: TObject);
    procedure btnEditDataManageClick(Sender: TObject);
    procedure btnAddDataManageClick(Sender: TObject);
    procedure changeDbgrdDataTitle(Sender:TObject);
    procedure pmDMN1Click(Sender: TObject);
    procedure pmDMN2Click(Sender: TObject);
    procedure pmDMN4Click(Sender: TObject);

    procedure tsZQYWShow(Sender: TObject);
    procedure dtpZQYWOnChange(Sender: TObject);
    procedure btnZQYWScanClick(Sender: TObject);
    procedure btnZQYWEditClick(Sender: TObject);
    procedure btnZQYWAddClick(Sender: TObject);
    procedure btnZQYWFreshClick(Sender: TObject);
    procedure btnZQYWSearchClick(Sender: TObject);
    procedure ChangedbgrdZQYWTitle(Sender: TObject);

    procedure tsRCCZShow(Sender: TObject);
    procedure tvRCCZOnChange(Sender: TObject);
    procedure customerDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
                               var DefaultDraw: Boolean );
    procedure btnRZQSClick(Sender: TObject);
    procedure btnRCCZRecoverClick(Sender: TObject);
    procedure btnRCCZSCPZClick(Sender: TObject);
    procedure btnPZLLClick(Sender: TObject);

    procedure tsBBCKShow(Sender: TObject);
    procedure tvBBCKOnChange(Sender: TObject);


    // 数字输入限制
    procedure EditNumberKeyPress(Sender: TObject; var Key: Char);
    procedure EditBumberLeave(Sender: TObject);

    // DBGrid 鼠标滚轮事件
    procedure OnMouseWheel(Var Msg : TMsg; Var Handled : Boolean);
    procedure mni3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);





  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  MainForm: TMainForm;

implementation

uses unit1, Unit3,JYFLForm,STLFForm,JKLJFORM,ZQXXGPForm, KJKMForm, DataManageGPForm,
ZQYWGPJYForm, ZQYWHGForm, ZQYWDXForm, ZQYWXGForm, ZQXXZQForm, ZQXXHGForm;

{$R *.dfm}


//..............................................................................User Management
// 初始化界面的时候，查询所有的用户
procedure TMainForm.UserRefreshButtonClick(Sender: TObject);
begin

  with UserADOQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select YH_BH,YH_MC from TYH order by yh_bh');
    Open;

    UserDBGrid.Columns[0].Title.caption := '用户ID';
    UserDBGrid.Columns[0].Width := 100;
    UserDBGrid.Columns[1].Title.caption := '用户名称';
    UserDBGrid.Columns[1].Width := 100;
    // 去掉滚动栏
    ShowSCrollBar(UserDBGrid.Handle, SB_VERT, False);

  end;
  UserDBGrid.Visible:=True;
end;

// 初始化界面的时候，进行的操作
procedure TMainForm.FormCreate(Sender: TObject);
Var SystemTime,ExitTime,lineStr,FilePath: String;
    configFile : TextFile;
    txtLines:TStringList;
begin
  // 设置数据库连接
  conMainForm.Close;
  conMainForm.ConnectionString := LoginForm.qryLoginForm.ConnectionString;
  conMainForm.Open;
//  SubMenuSysM.Items.Item[1].Selected := True;
  //MainForm.SubMenuSysM.FullExpand;
  MainForm.SubMenuSysM.Items.Item[0].Selected:=True;
  MainForm.UserRefreshButtonClick(Sender);
  MainForm.PageControl1.ActivePage:=SysManageTab;

  Application.OnMessage := OnMouseWheel;

  // 从配置文件中读取 上一次退出时记录的时间
  FilePath := 'config/system.cfg';
  if  FileExists(FilePath) then
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
      if(Trim(txtLines[0]) = 'SYSTEM_TIME') then SystemTime := Trim(txtLines[1]);
      if(Trim(txtLines[0]) = 'EXIT_LOCALTIME') then ExitTime := Trim(txtLines[1]);
    end;
    CloseFile(configFile);
    if (SystemTime = '') or (ExitTime = '') then
      MainForm.dtpMainForm.DateTime := Now()
    else
      dtpMainForm.DateTime := VarToDateTime(SystemTime) + (Now() - VarToDateTime(ExitTime));
  end
  else MainForm.dtpMainForm.DateTime := Now();

end;

// 关闭窗口的时候，将日期数据写入到配置文件中去
procedure TMainForm.FormClose(Sender: TObject;var Action: TCloseAction);
Var FilePath , P1: String;
    configFile : TextFile;
begin
  P1 := '# This File is used For System Time Setting';
  FilePath := 'config/system.cfg';
  AssignFile(configFile, FilePath);
  // 使用 Rewrite 直接覆盖掉文件
  ReWrite(configFile);
  WriteLn(configFile,p1);
  p1 := 'SYSTEM_TIME = ' + FormatDatetime('YYYY/MM/DD', MainForm.dtpMainForm.DateTime);
  WriteLn(configFile,p1);
  P1 := 'EXIT_LOCALTIME = ' + FormatDatetime('YYYY/MM/DD', Now());
  WriteLn(configFile,p1);
  CloseFile(configFile);
  Application.Terminate;
end;

// 改变选中的颜色
procedure TMainForm.SubMenuSysMCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
    if (cdsSelected in State) then
   begin
      with Sender.Canvas do
        Font.Color :=clRed;
   end;
end;


// 用户管理界面TreeView 的变化引起的反应
procedure TMainForm.SubMenuSysMOnChange(Sender: TObject);
begin
  if (MainForm.SubMenuSysM.Selected.Text='浏览用户') then

    MainForm.UserRefreshButtonClick(Sender)
  else if(MainForm.SubMenuSysM.Selected.Text='关闭系统') then
  begin
    if Application.MessageBox('确定退出系统？','提示',MB_YESNO)=ID_Yes then
    begin
      sendMessage(self.Handle, WM_CLOSE, 0, 0);
      Application.Terminate;
    end;
  end
  else if(MainForm.SubMenuSysM.Selected.Text='切换用户') then
  begin
    if Application.MessageBox('确定切换用户？','提示',MB_YESNO)=ID_Yes then
    begin
      sendMessage(self.Handle, WM_CLOSE, 0, 0);
      Application.Terminate;
      Winexec('project1.exe', sw_show);
    end;

  end;
end;

// 查询用户通过名字
procedure TMainForm.UerSearchButtonClick(Sender: TObject);
begin
  with UserADOQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select YH_BH,YH_MC from TYH where YH_MC=:a');
    Parameters.ParamByName('a').Value:=MainForm.UserSearchEdit.Text;
    Open;

    UserDBGrid.Columns[0].Title.caption := '用户ID';
    UserDBGrid.Columns[0].Width := 100;
    UserDBGrid.Columns[1].Title.caption := '用户名称';
    UserDBGrid.Columns[1].Width := 100;
  end;
end;

//DBGrid 右键菜单操作
// 删除
procedure TMainForm.UserDBGDelClick(Sender: TObject);
begin
  // 限制用户名和用户密码长度
  UserForm.UserFormUserNameEdit.MaxLength := 20;
  UserForm.UserFormPasswdEdit1.MaxLength := 20;
  UserForm.UserFormPasswdEdit2.MaxLength := 20;
  
  UserForm.Caption:='删除用户';
  UserForm.UserFormUserNameLabel.Caption := '用户名';
  UserForm.UserFormPasswdLabel1.Caption:='密码：';
  UserForm.UserFormUserNameEdit.Text:=UserDBGrid.Fields[1].Text;
  UserForm.UserFormPasswdEdit1.Text:='';
  UserForm.UserFormPasswdLabel2.Visible:=False;
  UserForm.UserFormPasswdEdit2.Visible:=False;
  UserForm.UserFormSureButton.Visible:=True;
  UserForm.UserFormCancleButton.Caption:='取消';
  UserForm.Show;
end;

// 右键更改密码
procedure TMainForm.UserDBGChangePasswdClick(Sender: TObject);
begin
  // 限制用户名和用户密码长度
  UserForm.UserFormUserNameEdit.MaxLength := 20;
  UserForm.UserFormPasswdEdit1.MaxLength := 20;
  UserForm.UserFormPasswdEdit2.MaxLength := 20;

  UserForm.Caption:='修改密码';
  UserForm.UserFormPasswdLabel2.Visible:=True;
  UserForm.UserFormPasswdEdit2.Visible:=True;
  UserForm.UserFormUserNameEdit.Text:=UserDBGrid.Fields[1].Text;
  UserForm.UserFormPasswdEdit1.Text:='';
  UserForm.UserFormPasswdEdit2.Text:='';
  UserForm.UserFormUserNameLabel.Caption := '用户名';
  UserForm.UserFormPasswdLabel1.Caption:='旧密码：';
  UserForm.UserFormPasswdLabel2.Caption:='新密码：';
  UserForm.UserFormSureButton.Visible:=True;
  UserForm.UserFormCancleButton.Caption:='取消';
  //MainForm.Visible:=False;
  UserForm.Show;
end;

// 查看用户信息
procedure TMainForm.UserScanButtonClick(Sender: TObject);
begin
  UserForm.Caption:='查看用户';
  UserForm.UserFormUserNameLabel.Caption := '用户编号：';
  UserForm.UserFormPasswdLabel1.Caption :='用户名：';
  UserForm.UserFormUserNameEdit.Text:=UserDBGrid.Fields[0].Text;
  UserForm.UserFormPasswdEdit1.Text:=UserDBGrid.Fields[1].Text;
  UserForm.UserFormUserNameEdit.ReadOnly := True;
  UserForm.UserFormPasswdEdit1.ReadOnly := True;

  // 如果登录是管理员，那么就可以查看用户的密码，否则不能查看
  if (lblLoginUserName.Caption = 'admin') or ( lblLoginUserName.Caption = 'ADMIN') then
  begin
    UserForm.UserFormPasswdLabel2.caption := '密码：';
    UserForm.UserFormPasswdLabel2.Visible:=True;
    UserForm.UserFormPasswdEdit2.Visible:=True;
    UserForm.UserFormPasswdEdit1.ReadOnly := True;
    with qryUserPasswd do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select yh_mm from tyh where yh_mc=:a');
      Parameters.ParamByName('a').Value := trim(UserForm.UserFormPasswdEdit1.Text);
      Open;
      UserForm.UserFormPasswdEdit2.Text := Fields[0].Text;
    end;
  end
  else
  begin
    UserForm.UserFormPasswdLabel2.Visible:=False;
    UserForm.UserFormPasswdEdit2.Visible:=False;
  end;

  UserForm.UserFormSureButton.Visible:=False;
  UserForm.UserFormCancleButton.Caption:='确定';
  UserForm.Show;
end;

// 通过浏览界面增加用户
procedure TMainForm.UserAddButtonClick(Sender: TObject);
begin
  // 限制用户名和用户密码长度
  UserForm.UserFormUserNameEdit.MaxLength := 20;
  UserForm.UserFormPasswdEdit1.MaxLength := 20;
  UserForm.UserFormPasswdEdit2.MaxLength := 20;

  UserForm.Caption:='增加用户';
  UserForm.UserFormUserNameLabel.Caption := '用户名：';
  UserForm.UserFormPasswdLabel1.Caption :='密码：';
  UserForm.UserFormPasswdLabel2.caption := '确认密码：';
  UserForm.UserFormPasswdLabel2.Visible:=True;
  UserForm.UserFormPasswdEdit2.Visible:=True;
  UserForm.UserFormUserNameEdit.Text:='';
  UserForm.UserFormPasswdEdit1.Text:='';
  UserForm.UserFormPasswdEdit2.Text:='';
  UserForm.UserFormSureButton.Visible:=True;
  UserForm.UserFormCancleButton.Caption:='取消';
  UserForm.Show;
end;


//..............................................................................基础设置
//展示这个界面的时候，刷新数据
procedure TMainForm.BasicSettingTabShow(Sender: TObject);
begin
  BasicSubMenuTreeView.Items.Item[0].Selected:=True;
  BasicAddButton.Visible := True;
  BasicDBGDeleteButton.Visible:=True;
  SelectAllBasicSetting(Sender, '交易费率设置');
  BasicSettingDBGrid.Visible:= True;
end;

// 查询按钮的时候，刷新数据
procedure TMainForm.BasicRefreshButtonClick(Sender: TObject);
begin
  BasicSubMenuOnClick(Sender);
end;

// 点击编辑按钮，弹出界面，进行费率的编辑
procedure TMainForm.BasicEditButtonClick(Sender: TObject);
begin
  if (BasicSettingDBGrid.Fields[0].Value = NULL) or (BasicSettingDBGrid.Fields[0].Value = '') then
    exit;
// 刚开始没有点击选择分支的时候，默认选择第一个
  if (BasicSubMenuTreeView.SelectionCount=0) then
    BasicSubMenuTreeView.Items.Item[0].Selected:=True;
  if (BasicSubMenuTreeView.Selected.Text='交易费率设置') then
  begin
    JYFLForm1.show;
    JYFLForm1.Caption:='交易费率更改';
    JYFLForm1.JYSCEdit.Text:=BasicSettingDBGrid.Fields[0].Value;
    JYFLForm1.JYLXEdit.Text:=BasicSettingDBGrid.Fields[1].Value;
    JYFLForm1.YHEdit.Text:=BasicSettingDBGrid.Fields[2].Text;
    JYFLForm1.JSEdit.Text:=BasicSettingDBGrid.Fields[3].Text;
    JYFLForm1.GHEdit.Text:=BasicSettingDBGrid.Fields[4].Text;
    JYFLForm1.ZGEdit.Text:=BasicSettingDBGrid.Fields[5].Text;
    JYFLForm1.YJEdit.Text:=BasicSettingDBGrid.Fields[6].Text;
    JYFLForm1.JYFLSureButton.Visible:=True;
    JYFLForm1.JYFLCancleButton.Caption:='取消';

    JYFLForm1.YHEdit.Enabled := True;
    JYFLForm1.JSEdit.Enabled := True;
    JYFLForm1.GHEdit.Enabled := True;
    JYFLForm1.ZGEdit.Enabled := True;
    JYFLForm1.YJEdit.Enabled := True;

  end
  else if(BasicSubMenuTreeView.Selected.Text='三提两费设置')
       and (BasicSettingDBGrid.Fields[0].Text <> NULL)  then
  begin
    STLFForm1.show;
    STLFForm1.STLFFormKSRQDateTimePicker.Enabled := True;
    STLFForm1.STLFFormJSRQDateTimePicker.Enabled := True;
    STLFForm1.STLFFormBLJEEdit.Enabled := True;
    STLFForm1.STLFFormJTTSEdit.Enabled := True;
    //费用不同，显示,操作不同
    if (BasicSettingDBGrid.Fields[0].Text='审计费') or (BasicSettingDBGrid.Fields[0].Text='信息披露费') then
    begin
      STLFForm1.Caption:=Concat(BasicSettingDBGrid.Fields[0].Text, '修改');

      STLFForm1.STLFFormFYLXEdit.Text:=BasicSettingDBGrid.Fields[0].Text;
      STLFForm1.STLFFormKSRQDateTimePicker.DateTime:=BasicSettingDBGrid.Fields[1].AsDateTime;
      STLFForm1.STLFFormJSRQDateTimePicker.DateTime:=BasicSettingDBGrid.Fields[2].AsDateTime;
      STLFForm1.STLFFormBLJEEdit.Text:=BasicSettingDBGrid.Fields[4].Text;
      STLFForm1.STLFFormJTTSEdit.Text:=BasicSettingDBGrid.Fields[5].Text;

      // 恢复查看所做的修改
      STLFForm1.STLFFormBLJELabel.Caption:='总金额';
      STLFForm1.STLFFormJTTSLabel.Visible:=True;
      STLFForm1.STLFFormJTTSEdit.Visible:=True;
      STLFForm1.STLFSureButton.Visible:=True;
      STLFForm1.STLFSureButton.Caption:='确定';
      STLFForm1.STLFCancleButton.Caption:='取消';
    end
    else
    begin
      STLFForm1.Caption:=Concat(BasicSettingDBGrid.Fields[0].Text, '修改');

      STLFForm1.STLFFormFYLXEdit.Text:=BasicSettingDBGrid.Fields[0].Text;
      STLFForm1.STLFFormKSRQDateTimePicker.DateTime:=BasicSettingDBGrid.Fields[1].AsDateTime;
      STLFForm1.STLFFormJSRQDateTimePicker.DateTime:=BasicSettingDBGrid.Fields[2].AsDateTime;
      STLFForm1.STLFFormBLJEEdit.Text:=BasicSettingDBGrid.Fields[3].Text;

      // 恢复查看所做的修改
      STLFForm1.STLFFormBLJELabel.Caption:='计提比例';
      STLFForm1.STLFFormJTTSLabel.Visible:=False;
      STLFForm1.STLFFormJTTSEdit.Visible:=False;
      STLFForm1.STLFSureButton.Visible:=True;
      STLFForm1.STLFCancleButton.Caption:='取消';
    end;
  end
  else if(BasicSubMenuTreeView.Selected.Text='接收路径设置') then
  begin
    JKLJForm1.show;
    JKLJForm1.Caption:='修改接收路径';
    JKLJForm1.JKLJFormJKBHEdit.Text:=BasicSettingDBGrid.Fields[1].Value;
    JKLJForm1.JKLJFormJKMCEdit.Text:=BasicSettingDBGrid.Fields[0].Value;
    JKLJForm1.JKLJFormWJMCEdit.Text:=BasicSettingDBGrid.Fields[3].Value;
    if (BasicSettingDBGrid.Fields[2].Value <> Null) then
      JKLJForm1.JKLJFormWJLJEdit.Text:=BasicSettingDBGrid.Fields[2].Value;

    // 恢复，查看时更改取消按钮的 caption 为确定，隐藏确定按钮
    JKLJForm1.JKLJFormWJLJChooseButton.Visible:=True;
    JKLJForm1.JKLJSureButton.Visible:=True;
    JKLJForm1.JKLJCancleButton.Caption:='取消';

    JKLJForm1.JKLJFormJKMCEdit.Enabled := True;
    JKLJForm1.JKLJFormWJMCEdit.Enabled := True;
    JKLJForm1.JKLJFormWJLJEdit.Enabled := True;
  end
  else if(BasicSubMenuTreeView.Selected.Text='证券信息设置') then
  begin
    if (BasicSettingDBGrid.Fields[2].Value='股票') then
    begin
      ZQXXGPForm1.Show;
      ZQXXGPForm1.Caption:='证券信息股票-修改';
      ZQXXGPForm1.ZQXXGPZQDMEdit.Text:=BasicSettingDBGrid.Fields[0].Value;
      ZQXXGPForm1.ZQXXGPJYSCEdit.Text:=BasicSettingDBGrid.Fields[1].Value;
      ZQXXGPForm1.ZQXXGPZQMCEdit.Text:=BasicSettingDBGrid.Fields[3].Value;
      ZQXXGPForm1.dtpZQXXGPFXRQ.DateTime:=BasicSettingDBGrid.Fields[6].AsDateTime;
      ZQXXGPForm1.ZQXXGPZGBEdit.Text:=BasicSettingDBGrid.Fields[4].Text;
      ZQXXGPForm1.ZQXXGPMGMZEdit.Text:=BasicSettingDBGrid.Fields[5].Text;

      //修改被改变的属性
      ZQXXGPForm1.ZQXXGPSureButton.Visible:=True;
      ZQXXGPForm1.ZQXXGPCancleButton.Caption:='取消';

      // 设置不可更改
      ZQXXGPForm1.ZQXXGPZQLXComboBox.Enabled := False;
      ZQXXGPForm1.ZQXXGPZQDMEdit.Enabled := False;
      ZQXXGPForm1.ZQXXGPJYSCEdit.Enabled := False;
      ZQXXGPForm1.ZQXXGPZQMCEdit.Enabled := True;
      ZQXXGPForm1.dtpZQXXGPFXRQ.Enabled := True;
      ZQXXGPForm1.ZQXXGPZGBEdit.Enabled := True;
      ZQXXGPForm1.ZQXXGPMGMZEdit.Enabled := True;
    end
    // TODO 证券信息的不同弹出不同的窗口
    else if (BasicSettingDBGrid.Fields[2].Value='债券') then
    begin
      ZQXXZQForm1.Show;
      ZQXXZQForm1.Caption:='证券信息债券-修改';
      ZQXXZQForm1.ZQXXZQZQDMEdit.Text:=BasicSettingDBGrid.Fields[0].Value;
      ZQXXZQForm1.ZQXXZQJYSCEdit.Text:=BasicSettingDBGrid.Fields[1].Value;
      ZQXXZQForm1.ZQXXZQZQMCEdit.Text:=BasicSettingDBGrid.Fields[3].Value;
      ZQXXZQForm1.ZQXXZQMGMZEdit.Text:=BasicSettingDBGrid.Fields[5].Value;
      ZQXXZQForm1.ZQXXZQKSRQDate.DateTime:=BasicSettingDBGrid.Fields[6].AsDateTime;
      if (BasicSettingDBGrid.Fields[7].Text = '') then
        ZQXXZQForm1.ZQXXZQQXRDate.DateTime:=BasicSettingDBGrid.Fields[6].AsDateTime
      else
        ZQXXZQForm1.ZQXXZQQXRDate.DateTime:=BasicSettingDBGrid.Fields[7].AsDateTime;

      if (BasicSettingDBGrid.Fields[8].Value = NULL) then
        ZQXXZQForm1.ZQXXZQNLLEdit.Text:='0.0'
      else
        ZQXXZQForm1.ZQXXZQNLLEdit.Text:= BasicSettingDBGrid.Fields[8].Value;

      if (BasicSettingDBGrid.Fields[9].Value = NULL) then
        ZQXXZQForm1.edtZQXXZQLXS.Text:='0.0'
      else
        ZQXXZQForm1.edtZQXXZQLXS.Text:=BasicSettingDBGrid.Fields[9].Value;

      if (BasicSettingDBGrid.Fields[10].Value = NULL) then
        ZQXXZQForm1.ZQXXZQJXFSEdit.Text:=''
      else
        ZQXXZQForm1.ZQXXZQJXFSEdit.Text:=BasicSettingDBGrid.Fields[10].Value;

      //修改被改变的属性
      ZQXXZQForm1.ZQXXZQSureButton.Visible:=True;
      ZQXXZQForm1.ZQXXZQCancleButton.Caption:='取消';

      ZQXXZQForm1.ZQXXZQZQDMEdit.Enabled := False;
      ZQXXZQForm1.ZQXXZQZQLXComboBox.Enabled := False;
      ZQXXZQForm1.ZQXXZQJYSCEdit.Enabled := False;
      ZQXXZQForm1.ZQXXZQZQMCEdit.Enabled := True;
      ZQXXZQForm1.ZQXXZQMGMZEdit.Enabled := True;
      ZQXXZQForm1.ZQXXZQKSRQDate.Enabled := True;
      ZQXXZQForm1.ZQXXZQKSRQDate.Enabled := True;
      ZQXXZQForm1.ZQXXZQQXRDate.Enabled := True;
      ZQXXZQForm1.ZQXXZQNLLEdit.Enabled := True;
      ZQXXZQForm1.edtZQXXZQLXS.Enabled := True;
      ZQXXZQForm1.ZQXXZQJXFSEdit.Enabled := True;
    end
    else if (BasicSettingDBGrid.Fields[2].Value='回购') then
    begin
      ZQXXHGForm1.Show;
      ZQXXHGForm1.Caption:='证券信息回购-修改';
      ZQXXHGForm1.ZQXXHGZQDMEdit.Text:=BasicSettingDBGrid.Fields[0].Value;
      ZQXXHGForm1.ZQXXHGJYSCEdit.Text:=BasicSettingDBGrid.Fields[1].Value;
      ZQXXHGForm1.ZQXXHGZQMCEdit.Text:=BasicSettingDBGrid.Fields[3].Value;
      ZQXXHGForm1.dtpZQXXHGFXRQ.DateTime:=BasicSettingDBGrid.Fields[6].AsDateTime;
      if (BasicSettingDBGrid.Fields[11].Value <> NULL) then
        ZQXXHGForm1.ZQXXHGHGTSEdit.Text:=BasicSettingDBGrid.Fields[11].Value;

      //修改被改变的属性
      ZQXXHGForm1.ZQXXHGSureButton.Visible:=True;
      ZQXXHGForm1.ZQXXHGCancleButton.Caption:='取消';

      ZQXXHGForm1.ZQXXHGZQLXComboBox.Enabled := False;
      ZQXXHGForm1.ZQXXHGZQDMEdit.Enabled := False;
      ZQXXHGForm1.ZQXXHGJYSCEdit.Enabled := False;
      ZQXXHGForm1.ZQXXHGZQMCEdit.Enabled := False;
      ZQXXHGForm1.dtpZQXXHGFXRQ.Enabled := False;
      ZQXXHGForm1.ZQXXHGHGTSEdit.Enabled := False;
    end
    else
      showMessage('暂时不可以修改！');
  end
  else if(BasicSubMenuTreeView.Selected.Text='会计科目设置') then
  begin
    if (BasicSettingDBGrid.Fields[0].Value <> NULL) then
    begin
      KJKMForm1.show;
      KJKMForm1.Caption:='会计科目-编辑';

      KJKMForm1.KJKMKMDMEdit.Text:=BasicSettingDBGrid.Fields[0].Value;
      KJKMForm1.KJKMKMMCEdit.Text:=BasicSettingDBGrid.Fields[1].Value;
      KJKMForm1.cbbKJKMJDFX.Text:=BasicSettingDBGrid.Fields[2].Value;

      KJKMForm1.KJKMSureButton.Visible:=True;
      KJKMForm1.KJKMCancleButton.Caption:='取消';

      KJKMForm1.KJKMKMDMEdit.Enabled := False;
      KJKMForm1.KJKMKMMCEdit.Enabled := True;
      KJKMForm1.cbbKJKMJDFX.Enabled := True;
    end;

  end;
end;


// 选择的 TreeView 不同时，进行的操作不同
procedure TMainForm.BasicScanButtonClick(Sender: TObject);
begin
  if (BasicSettingDBGrid.Fields[0].Value = NULL) or (BasicSettingDBGrid.Fields[0].Value = '') then
    exit;
  // 刚开始没有点击选择分支的时候，默认选择第一个
  if (BasicSubMenuTreeView.SelectionCount=0) then
    BasicSubMenuTreeView.Items.Item[0].Selected:=True;
  if (BasicSubMenuTreeView.Selected.Text='交易费率设置') then
  begin
    JYFLForm1.show;
    JYFLForm1.Caption:='交易费率查看';

    JYFLForm1.JYSCEdit.Text:=BasicSettingDBGrid.Fields[0].Value;
    JYFLForm1.JYLXEdit.Text:=BasicSettingDBGrid.Fields[1].Value;
    JYFLForm1.YHEdit.Text:=BasicSettingDBGrid.Fields[2].Text;
    JYFLForm1.JSEdit.Text:=BasicSettingDBGrid.Fields[3].Text;
    JYFLForm1.GHEdit.Text:=BasicSettingDBGrid.Fields[4].Text;
    JYFLForm1.ZGEdit.Text:=BasicSettingDBGrid.Fields[5].Text;
    JYFLForm1.YJEdit.Text:=BasicSettingDBGrid.Fields[6].Text;

    JYFLForm1.JYFLSureButton.Visible:=False;
    JYFLForm1.JYFLCancleButton.Caption:='确定';

    JYFLForm1.YHEdit.Enabled := False;
    JYFLForm1.JSEdit.Enabled := False;
    JYFLForm1.GHEdit.Enabled := False;
    JYFLForm1.ZGEdit.Enabled := False;
    JYFLForm1.YJEdit.Enabled := False;
  end
  else if(BasicSubMenuTreeView.Selected.Text='三提两费设置')
          and (BasicSettingDBGrid.Fields[0].Text <> NULL) then
  begin
    STLFForm1.show;
    STLFForm1.STLFFormKSRQDateTimePicker.Enabled := False;
    STLFForm1.STLFFormJSRQDateTimePicker.Enabled := False;
    STLFForm1.STLFFormBLJEEdit.Enabled := False;
    STLFForm1.STLFFormJTTSEdit.Enabled := False;
    if (BasicSettingDBGrid.Fields[0].Text='审计费') or (BasicSettingDBGrid.Fields[0].Text='信息披露费') then
    begin
      STLFForm1.Caption:=Concat(BasicSettingDBGrid.Fields[0].Text, '查看');
      STLFForm1.STLFFormBLJELabel.Caption:='总金额';
      STLFForm1.STLFFormFYLXEdit.Text:=BasicSettingDBGrid.Fields[0].Text;
      STLFForm1.STLFFormKSRQDateTimePicker.DateTime:=BasicSettingDBGrid.Fields[1].AsDateTime;
      STLFForm1.STLFFormJSRQDateTimePicker.DateTime:=BasicSettingDBGrid.Fields[2].AsDateTime;
      STLFForm1.STLFFormBLJEEdit.Text:=BasicSettingDBGrid.Fields[4].Text;
      STLFForm1.STLFFormJTTSEdit.Text:=BasicSettingDBGrid.Fields[5].Text;
      //恢复查看所做的修改
      STLFForm1.STLFFormJTTSLabel.Visible:=True;
      STLFForm1.STLFFormJTTSEdit.Visible:=True;
      STLFForm1.STLFSureButton.Visible:=False;
      STLFForm1.STLFCancleButton.Caption:='确定';
    end
    else
    begin
      STLFForm1.Caption:=Concat(BasicSettingDBGrid.Fields[0].Text, '查看');
      STLFForm1.STLFFormBLJELabel.Caption:='计提比例';
      STLFForm1.STLFFormFYLXEdit.Text:=BasicSettingDBGrid.Fields[0].Text;
      STLFForm1.STLFFormKSRQDateTimePicker.DateTime:=BasicSettingDBGrid.Fields[1].AsDateTime;
      STLFForm1.STLFFormJSRQDateTimePicker.DateTime:=BasicSettingDBGrid.Fields[2].AsDateTime;
      STLFForm1.STLFFormBLJEEdit.Text:=BasicSettingDBGrid.Fields[3].Text;
      //恢复查看所做的修改
      STLFForm1.STLFFormJTTSLabel.Visible:=False;
      STLFForm1.STLFFormJTTSEdit.Visible:=False;
      STLFForm1.STLFSureButton.Visible:=False;
      STLFForm1.STLFCancleButton.Caption:='确定';
    end;
  end
  else if(BasicSubMenuTreeView.Selected.Text='接收路径设置') then
  begin
    JKLJForm1.show;
    JKLJForm1.Caption:='查看接收路径';
    JKLJForm1.JKLJFormJKBHEdit.Text:=BasicSettingDBGrid.Fields[1].Value;
    JKLJForm1.JKLJFormJKMCEdit.Text:=BasicSettingDBGrid.Fields[0].Value;
    JKLJForm1.JKLJFormWJMCEdit.Text:=BasicSettingDBGrid.Fields[3].Value;
    if (BasicSettingDBGrid.Fields[2].Value<>Null) then
      JKLJForm1.JKLJFormWJLJEdit.Text:=BasicSettingDBGrid.Fields[2].Value;

    // 查看时做的界面修改
    JKLJForm1.JKLJFormWJLJChooseButton.Visible:=False;
    JKLJForm1.JKLJSureButton.Visible:=False;
    JKLJForm1.JKLJCancleButton.Caption:='确定';

    JKLJForm1.JKLJFormJKMCEdit.Enabled := False;
    JKLJForm1.JKLJFormWJMCEdit.Enabled := False;
    JKLJForm1.JKLJFormWJLJEdit.Enabled := False;
  end
  else if(BasicSubMenuTreeView.Selected.Text='证券信息设置') then
  begin
    if (BasicSettingDBGrid.Fields[2].Value='股票') then
    begin
      ZQXXGPForm1.Show;
      ZQXXGPForm1.Caption:='证券信息股票-查看';
      ZQXXGPForm1.ZQXXGPZQDMEdit.Text:=BasicSettingDBGrid.Fields[0].Value;
      ZQXXGPForm1.ZQXXGPJYSCEdit.Text:=BasicSettingDBGrid.Fields[1].Value;
      ZQXXGPForm1.ZQXXGPZQMCEdit.Text:=BasicSettingDBGrid.Fields[3].Value;
      ZQXXGPForm1.dtpZQXXGPFXRQ.DateTime:=BasicSettingDBGrid.Fields[6].AsDateTime;
      ZQXXGPForm1.ZQXXGPZGBEdit.Text:=BasicSettingDBGrid.Fields[4].Text;
      ZQXXGPForm1.ZQXXGPMGMZEdit.Text:=BasicSettingDBGrid.Fields[5].Text;

      //修改被改变的属性
      ZQXXGPForm1.ZQXXGPSureButton.Visible:=False;
      ZQXXGPForm1.ZQXXGPCancleButton.Caption:='确定';

      // 设置 不可修改
      ZQXXGPForm1.ZQXXGPZQLXComboBox.Enabled := False;
      ZQXXGPForm1.ZQXXGPZQDMEdit.Enabled := False;
      ZQXXGPForm1.ZQXXGPJYSCEdit.Enabled := False;
      ZQXXGPForm1.ZQXXGPZQMCEdit.Enabled := False;
      ZQXXGPForm1.dtpZQXXGPFXRQ.Enabled := False;
      ZQXXGPForm1.ZQXXGPZGBEdit.Enabled := False;
      ZQXXGPForm1.ZQXXGPMGMZEdit.Enabled := False;

    end
    // TODO 鞥局证券信息的不同弹出不同的窗口
    else if (BasicSettingDBGrid.Fields[2].Value='债券') then
    begin
      ZQXXZQForm1.Show;
      ZQXXZQForm1.Caption:='证券信息债券-查看';
      ZQXXZQForm1.ZQXXZQZQDMEdit.Text:=BasicSettingDBGrid.Fields[0].Value;
      ZQXXZQForm1.ZQXXZQJYSCEdit.Text:=BasicSettingDBGrid.Fields[1].Value;
      ZQXXZQForm1.ZQXXZQZQMCEdit.Text:=BasicSettingDBGrid.Fields[3].Value;
      ZQXXZQForm1.ZQXXZQMGMZEdit.Text:=BasicSettingDBGrid.Fields[5].Value;
      ZQXXZQForm1.ZQXXZQKSRQDate.DateTime:=BasicSettingDBGrid.Fields[6].AsDateTime;
      // 两个日期，优先选用第二个，第二个不存在则选择第一个
      if (BasicSettingDBGrid.Fields[7].Text = '') then
        ZQXXZQForm1.ZQXXZQQXRDate.DateTime:=BasicSettingDBGrid.Fields[6].AsDateTime
      else
        ZQXXZQForm1.ZQXXZQQXRDate.DateTime:=BasicSettingDBGrid.Fields[7].AsDateTime;

      if (BasicSettingDBGrid.Fields[8].Value = NULL) then
        ZQXXZQForm1.ZQXXZQNLLEdit.Text:='0.0'
      else
        ZQXXZQForm1.ZQXXZQNLLEdit.Text:= BasicSettingDBGrid.Fields[8].Value;

      if (BasicSettingDBGrid.Fields[9].Value = NULL) then
        ZQXXZQForm1.edtZQXXZQLXS.Text:='0.0'
      else
        ZQXXZQForm1.edtZQXXZQLXS.Text:=BasicSettingDBGrid.Fields[9].Value;

      if (BasicSettingDBGrid.Fields[10].Value = NULL) then
        ZQXXZQForm1.ZQXXZQJXFSEdit.Text:=''
      else
        ZQXXZQForm1.ZQXXZQJXFSEdit.Text:=BasicSettingDBGrid.Fields[10].Value;


      //修改被改变的属性
      ZQXXZQForm1.ZQXXZQSureButton.Visible:=False;
      ZQXXZQForm1.ZQXXZQCancleButton.Caption:='确定';

      ZQXXZQForm1.ZQXXZQZQDMEdit.Enabled := False;
      ZQXXZQForm1.ZQXXZQZQLXComboBox.Enabled := False;
      ZQXXZQForm1.ZQXXZQJYSCEdit.Enabled := False;
      ZQXXZQForm1.ZQXXZQZQMCEdit.Enabled := False;
      ZQXXZQForm1.ZQXXZQMGMZEdit.Enabled := False;
      ZQXXZQForm1.ZQXXZQKSRQDate.Enabled := False;
      ZQXXZQForm1.ZQXXZQKSRQDate.Enabled := False;
      ZQXXZQForm1.ZQXXZQQXRDate.Enabled := False;
      ZQXXZQForm1.ZQXXZQNLLEdit.Enabled := False;
      ZQXXZQForm1.edtZQXXZQLXS.Enabled := False;
      ZQXXZQForm1.ZQXXZQJXFSEdit.Enabled := False;


    end
    else if (BasicSettingDBGrid.Fields[2].Value='回购') then
    begin
      ZQXXHGForm1.Show;
      ZQXXHGForm1.Caption:='证券信息回购-查看';
      ZQXXHGForm1.ZQXXHGZQDMEdit.Text:=BasicSettingDBGrid.Fields[0].Value;
      ZQXXHGForm1.ZQXXHGJYSCEdit.Text:=BasicSettingDBGrid.Fields[1].Value;
      ZQXXHGForm1.ZQXXHGZQMCEdit.Text:=BasicSettingDBGrid.Fields[3].Value;
      ZQXXHGForm1.dtpZQXXHGFXRQ.DateTime:=BasicSettingDBGrid.Fields[6].AsDateTime;
      if (BasicSettingDBGrid.Fields[11].Value <> NULL) then
        ZQXXHGForm1.ZQXXHGHGTSEdit.Text:=BasicSettingDBGrid.Fields[11].Value;

      //修改被改变的属性
      ZQXXHGForm1.ZQXXHGSureButton.Visible:=False;
      ZQXXHGForm1.ZQXXHGCancleButton.Caption:='确定';

      ZQXXHGForm1.ZQXXHGZQLXComboBox.Enabled := False;
      ZQXXHGForm1.ZQXXHGZQDMEdit.Enabled := False;
      ZQXXHGForm1.ZQXXHGJYSCEdit.Enabled := False;
      ZQXXHGForm1.ZQXXHGZQMCEdit.Enabled := True;
      ZQXXHGForm1.dtpZQXXHGFXRQ.Enabled := True;
      ZQXXHGForm1.ZQXXHGHGTSEdit.Enabled := True;
    end
    else
      showMessage('暂时不可以查看！');
  end
  else if(BasicSubMenuTreeView.Selected.Text='会计科目设置') then
  begin

    if (BasicSettingDBGrid.Fields[0].Value <> NULL) then
    begin
      KJKMForm1.show;
      KJKMForm1.Caption:='会计科目-查看';

      KJKMForm1.KJKMKMDMEdit.Text:=BasicSettingDBGrid.Fields[0].Value;
      KJKMForm1.KJKMKMMCEdit.Text:=BasicSettingDBGrid.Fields[1].Value;
      KJKMForm1.cbbKJKMJDFX.Text:=BasicSettingDBGrid.Fields[2].Value;

      KJKMForm1.KJKMSureButton.Visible:=False;
      KJKMForm1.KJKMCancleButton.Caption:='确定';

      KJKMForm1.KJKMKMDMEdit.Enabled := False;
      KJKMForm1.KJKMKMMCEdit.Enabled := False;
      KJKMForm1.cbbKJKMJDFX.Enabled := False;
    end;

  end;
end;


procedure TMainForm.BasicAddButtonClick(Sender: TObject);
begin
// 增加按钮的作用，默认为股票，当选择的类别发生变化时，打开别的窗口
  if (BasicSubMenuTreeView.Selected.Text='证券信息设置') then
  begin
    ZQXXGPForm1.Show;
    ZQXXGPForm1.Caption:='证券信息新增';
    //清空编辑框的内容
    ZQXXGPForm1.ZQXXGPZQDMEdit.Text:='';
    ZQXXGPForm1.ZQXXGPJYSCEdit.Text:='';
    ZQXXGPForm1.ZQXXGPZGBEdit.Text:='0.0';
    ZQXXGPForm1.ZQXXGPMGMZEdit.Text:='0.0';
    ZQXXGPForm1.ZQXXGPZQMCEdit.Text:='';
    ZQXXGPForm1.dtpZQXXGPFXRQ.DateTime:=dtpMainForm.DateTime;

    // 设置为可修改
    ZQXXGPForm1.ZQXXGPZQLXComboBox.Enabled := True;
    ZQXXGPForm1.ZQXXGPZQDMEdit.Enabled := True;
    ZQXXGPForm1.ZQXXGPJYSCEdit.Enabled := True;
    ZQXXGPForm1.ZQXXGPZQMCEdit.Enabled := True;
    ZQXXGPForm1.dtpZQXXGPFXRQ.Enabled := True;
    ZQXXGPForm1.ZQXXGPZGBEdit.Enabled := True;
    ZQXXGPForm1.ZQXXGPMGMZEdit.Enabled := True;
  end
// 如果选择的是 会计科目设置的时候作用
  else if BasicSubMenuTreeView.Selected.Text='会计科目设置' then
  begin
    KJKMForm1.show;
    KJKMForm1.Caption:='会计科目-新增';

    KJKMForm1.KJKMKMDMEdit.Text:='';
    KJKMForm1.KJKMKMMCEdit.Text:='';
    KJKMForm1.cbbKJKMJDFX.Text:='';

    KJKMForm1.KJKMKMDMEdit.Enabled := True;
    KJKMForm1.KJKMKMMCEdit.Enabled := True;
    KJKMForm1.cbbKJKMJDFX.Enabled := True;
  end
  else if BasicSubMenuTreeView.Selected.Text='交易费率设置' then
  begin
    JYFLForm1.Caption:='交易费率-新增';

    JYFLForm1.JYSCEdit.Text:='';
    JYFLForm1.JYLXEdit.Text:='';
    JYFLForm1.YHEdit.Text:='0.0';
    JYFLForm1.JSEdit.Text:='0.0';
    JYFLForm1.GHEdit.Text:='0.0';
    JYFLForm1.ZGEdit.Text:='0.0';
    JYFLForm1.YJEdit.Text:='0.0';

    JYFLForm1.JYFLSureButton.Visible:=True;
    JYFLForm1.JYFLCancleButton.Caption:='取消';

    JYFLForm1.YHEdit.Enabled := True;
    JYFLForm1.JSEdit.Enabled := True;
    JYFLForm1.GHEdit.Enabled := True;
    JYFLForm1.ZGEdit.Enabled := True;
    JYFLForm1.YJEdit.Enabled := True;
    JYFLForm1.JYLXEdit.Enabled := True;
    JYFLForm1.JYSCEdit.Enabled := True;
    JYFLForm1.Show;
  end;
end;


// 搜索按钮的作用，根据不同的子菜单选中，所以进行的活动不同
procedure TMainForm.BasicSearchButtonClick(Sender: TObject);
begin

  with UserADOQuery do
  begin
    Close;
    SQL.Clear;
    if (BasicSubMenuTreeView.Selected.Text='交易费率设置') then
    begin
      SQL.Add('Select * from TJYFL where TJYFL_JYSC=:a');
      Parameters.ParamByName('a').Value:=BasicSearchEdit.Text;
      Open;
      db.TNumericField(UserADOQuery.FieldByName('TJYFL_YHS')).DisplayFormat := '0.00000000';
      db.TNumericField(UserADOQuery.FieldByName('TJYFL_JSF')).DisplayFormat := '0.00000000';
      db.TNumericField(UserADOQuery.FieldByName('TJYFL_GHF')).DisplayFormat := '0.00000000';
      db.TNumericField(UserADOQuery.FieldByName('TJYFL_ZGF')).DisplayFormat := '0.00000000';
      db.TNumericField(UserADOQuery.FieldByName('TJYFL_YJ')).DisplayFormat := '0.00000000';
    end
    else if (BasicSubMenuTreeView.Selected.Text='证券信息设置') then
    begin
      //如果搜索框的证券代码不为 空 的话,搜素具体的证券信息
      if (BasicSearchEdit.Text <> '') then
      begin
        // 如果是全部的话，就选择全部进行查询
        if (BasicZQLXComboBox.Text = '全部') then
        begin
          SQL.Add('Select * from TZQXX where TZQXX_ZQDM=:a');
          Parameters.ParamByName('a').Value:=trim(BasicSearchEdit.Text);
        end
        //如果搜索框的证券代码为 空 的话,搜素证券类别
        else
        begin
          SQL.Add('Select * from TZQXX where TZQXX_ZQDM=:a and TZQXX_ZQLB=:b');
          Parameters.ParamByName('a').Value:=trim(BasicSearchEdit.Text);
          Parameters.ParamByName('b').Value:=BasicZQLXComboBox.Text;
        end;
      end
      else
      begin
        if (BasicZQLXComboBox.Text = '全部') then
        begin
          SQL.Add('Select * from TZQXX');
        end
        else
        begin
          SQL.Add('Select * from TZQXX where TZQXX_ZQLB=:a');
          Parameters.ParamByName('a').Value:=BasicZQLXComboBox.Text;
        end;
      end; 

      Open;
    end
    else if (BasicSubMenuTreeView.Selected.Text='会计科目设置') then
    begin
      SQL.Add('Select * from TKJKM where TKJKM_KMDM=:a');
      Parameters.ParamByName('a').Value:=BasicSearchEdit.Text;
      Open;
    end
    else
    begin
      SQL.Add('Select * from JYFL where SCMC=:a');//TODO 暂不实现
      Parameters.ParamByName('a').Value:=BasicSearchEdit.Text;
      Open;
    end;

    ChangedbgrXTSZTitle(Sender);
  end;
end;

// 基础设置TreeMenu 点击产生的事件
procedure TMainForm.BasicSubMenuOnClick(Sender: TObject);
begin
  MainForm.SelectAllBasicSetting(Sender, BasicSubMenuTreeView.Selected.Text);
  // 使 增加 按钮和证券类型ComboBox隐藏
  if (BasicSubMenuTreeView.Selected.Text='证券信息设置') then
  begin
    BasicAddButton.Visible:=True;
    BasicZQLXComboBox.Visible:=True;
    BasicSearchEdit.Hint:='按照证券代码搜索';
    //显示搜索框与搜索按钮
    BasicSearchEdit.Visible:=True;
    BasicSearchButton.Visible:=True;
    // 设置右键菜单的删除按钮的可见性
    BasicDBGDeleteButton.Visible:=True;
  end
  else if(BasicSubMenuTreeView.Selected.Text='会计科目设置') then
  begin
    BasicAddButton.Visible:=True;
    BasicZQLXComboBox.Visible:=False;
    BasicSearchEdit.Hint:='按照科目代码搜索';
    //显示搜索框与搜索按钮
    BasicSearchEdit.Visible:=True;
    BasicSearchButton.Visible:=True;
    // 设置右键菜单的删除按钮的可见性
    BasicDBGDeleteButton.Visible:=True;
  end
  else if(BasicSubMenuTreeView.Selected.Text='交易费率设置') then
  begin
    BasicAddButton.Visible:=True;
  end
  else
  begin
    BasicAddButton.Visible:=False;
    BasicZQLXComboBox.Visible:=False;
    //隐藏搜索框与搜索按钮
    BasicSearchEdit.Visible:=False;
    BasicSearchButton.Visible:=False;
    // 设置右键菜单的删除按钮的可见性
    BasicDBGDeleteButton.Visible:=False;
  end;
end;

// 查找所选设置类型的基本信息
procedure TMainForm.SelectAllBasicSetting(Sender:TObject;Szkm: String);
begin
  with UserADOQuery do
  begin
    Close;
    SQL.Clear;
    if ( Szkm='交易费率设置') then
    begin
      SQL.Add('select * from TJYFL');
      Open;
      db.TNumericField(UserADOQuery.FieldByName('TJYFL_YHS')).DisplayFormat := '0.00000000';
      db.TNumericField(UserADOQuery.FieldByName('TJYFL_JSF')).DisplayFormat := '0.00000000';
      db.TNumericField(UserADOQuery.FieldByName('TJYFL_GHF')).DisplayFormat := '0.00000000';
      db.TNumericField(UserADOQuery.FieldByName('TJYFL_ZGF')).DisplayFormat := '0.00000000';
      db.TNumericField(UserADOQuery.FieldByName('TJYFL_YJ')).DisplayFormat := '0.00000000';
    end
    else if(Szkm='三提两费设置') then
    begin
      SQL.Add('select * from TSTLF');
      Open;
    end
    else if(Szkm='接收路径设置') then
    begin
      SQL.Add('select * from TJSLJ');
      Open;
    end
    else if(Szkm='证券信息设置') then
    begin
      SQL.Add('select * from TZQXX');
      Open;
    end
    else
    begin
      SQL.Add('select * from TKJKM');
      Open;
    end;
//    db.TNumericField(UserADOQuery.FieldByName('TJYFL_JSF')).DisplayFormat := '#.############';

   end;
   // 调用函数更改列名
   ChangedbgrXTSZTitle(Sender);
end;

procedure TMainForm.ChangedbgrXTSZTitle(Sender:Tobject);
begin
  if ( BasicSubMenuTreeView.Selected.Text ='交易费率设置') then
  begin
    with BasicSettingDBGrid do
    begin
      Columns[0].Title.Caption := '交易市场';
      Columns[0].Width := 100;
      Columns[1].Title.Caption := '业务类别';
      Columns[1].Width := 100;
      Columns[2].Title.Caption := '印花税';
      Columns[2].Width := 100;
      Columns[3].Title.Caption := '经手费';
      Columns[3].Width := 100;
      Columns[4].Title.Caption := '过户费';
      Columns[4].Width := 100;
      Columns[5].Title.Caption := '证管费';
      Columns[5].Width := 100;
      Columns[6].Title.Caption := '佣金';
      Columns[6].Width := 100;
    end;
  end
  else if(BasicSubMenuTreeView.Selected.Text ='三提两费设置') then
  begin
    with BasicSettingDBGrid do
    begin
      Columns[0].Title.Caption := '费用类型';
      Columns[0].Width := 100;
      Columns[1].Title.Caption := '开始日期';
      Columns[1].Width := 100;
      Columns[2].Title.Caption := '结束日期';
      Columns[2].Width := 100;
      Columns[3].Title.Caption := '计提比例';
      Columns[3].Width := 100;
      Columns[4].Title.Caption := '费用总额';
      Columns[4].Width := 100;
      Columns[5].Title.Caption := '计提次数';
      Columns[5].Width := 100;
    end;

  end
  else if(BasicSubMenuTreeView.Selected.Text ='接收路径设置') then
  begin
    with BasicSettingDBGrid do
    begin
      Columns[0].Title.Caption := '接口名称';
      Columns[0].Width := 100;
      Columns[1].Title.Caption := '接口编号';
      Columns[1].Width := 100;
      Columns[2].Title.Caption := '文件路径';
      Columns[2].Width := 450;
      Columns[3].Title.Caption := '文件名称';
      Columns[3].Width := 100;
    end;
  end
  else if(BasicSubMenuTreeView.Selected.Text ='证券信息设置') then
  begin
    with BasicSettingDBGrid do
    begin
      Columns[0].Title.Caption := '证券代码';
      Columns[0].Width := 100;
      Columns[1].Title.Caption := '交易市场';
      Columns[1].Width := 100;
      Columns[2].Title.Caption := '证券类别';
      Columns[2].Width := 100;
      Columns[3].Title.Caption := '证券名称';
      Columns[3].Width := 100;
      Columns[4].Title.Caption := '总股本';
      Columns[4].Width := 100;
      Columns[5].Title.Caption := '每股面值';
      Columns[5].Width := 100;
      Columns[6].Title.Caption := '发行日期';
      Columns[6].Width := 100;
      Columns[7].Title.Caption := '起息日';
      Columns[7].Width := 100;
      Columns[8].Title.Caption := '年利率';
      Columns[8].Width := 100;
      Columns[9].Title.Caption := '利息税';
      Columns[9].Width := 100;
      Columns[10].Title.Caption := '付息方式';
      Columns[10].Width := 100;
      Columns[11].Title.Caption := '回购天数';
      Columns[11].Width := 100;
    end;
  end
  else
  begin
    with BasicSettingDBGrid do
    begin
      Columns[0].Title.Caption := '科目代码';
      Columns[0].Width := 100;
      Columns[1].Title.Caption := '科目名称';
      Columns[1].Width := 200;
      Columns[2].Title.Caption := '借贷方向';
      Columns[2].Width := 100;
    end;
  end;
end;

// 当类型选择Combox 发生变化时，重新查询数据
procedure TMainForm.BasicZQLXComboBoxChange(Sender: TObject);
begin
  with UserADOQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from TZQXX where TZQXX_ZQLB=:a');
    Parameters.ParamByName('a').Value:=BasicZQLXComboBox.Text;
    Open;
    ChangedbgrXTSZTitle(Sender);
  end;
end;


// 基础设置界面右键菜单-浏览
procedure TMainForm.BasicDBGScanButtonClick(Sender: TObject);
begin
  BasicScanButtonClick(Sender);
end;

// 基础设置界面右键菜单-编辑
procedure TMainForm.BasicDBGEditButtonClick(Sender: TObject);
begin
  BasicEditButtonClick(Sender);
end;

// 基础设置界面右键菜单-删除
procedure TMainForm.BasicDBGDeleteButtonClick(Sender: TObject);
Var ZQDM: String;
begin
   BasicSettingDBGrid.DataSource.DataSet.Delete;
//  if BasicSettingDBGrid.Fields[0].Value = NULL then Exit;
//  ZQDM:=BasicSettingDBGrid.Fields[0].Value;
//  with UserADOQuery do
//  begin
//    Close;
//    SQL.Clear;
//    if(BasicSubMenuTreeView.Selected.Text='证券信息设置') then
//    begin
//      SQL.Add('delete from TZQXX where TZQXX_ZQDM=:a');
//      Parameters.ParamByName('a').Value:=ZQDM;
//  //    Parameters.ParamByName('a').Value:=BasicSettingDBGrid.Fields[0].Text;
//      end
//    else if(BasicSubMenuTreeView.Selected.Text='会计科目设置') then
//    begin
//      SQL.Add('delete from TKJKM where TKJKM_KMDM=:a');
//      Parameters.ParamByName('a').Value:=ZQDM;
////      Parameters.ParamByName('a').Value:=BasicSettingDBGrid.Fields[0].Text;
//    end;
//    ExecSQL;
//    BasicSubMenuOnClick(Sender);
//  end;
end;

//..............................................................................权益公告维护
// 初始化数据维护界面进行的操作
procedure TMainForm.tsDataManageShow(Sender: TObject);
begin
  dbgrdDataManage.Visible:=True;
  // more选择第一个条目
  tvDataManage.Items.Item[0].Selected:=True;
  // 设置除权的开始日期和结束日期为主界面选择的日期
  dtpKSRQDataManage.Date:=dtpMainForm.DateTime;
  dtpJSRQDataManage.Date:=dtpMainForm.DateTime;

  // 调用函数实现数据的刷新
  dtpDataManageOnChange(Sender);
end;


// 根据到账日期来查询数据
procedure TMainForm.dtpDataManageOnChange(Sender: TObject);
begin
  with UserADOQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select thl_ywrq,thl_dzrq,thl_jysc,thl_zqdm,thl_zqmc,thl_djsl,thl_fhje,thl_qybl'+
    ' from THL where THL_YWRQ between :a and :b and THL_YWLB=''红利到账''');
    Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpKSRQDataManage.DateTime);
    Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpJSRQDataManage.DateTime);
    Open;

    changeDbgrdDataTitle(Sender);
  end;
end;

// 搜索按钮进行的搜索根据证券代码不使用时间判断
procedure TMainForm.btnSearchDataManageClick(Sender: TObject);
begin
  with UserADOQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from THL where THL_ZQDM=:a');
    Parameters.ParamByName('a').Value:=edtSearchDataManage.Text;
    Open;

    changeDbgrdDataTitle(Sender);
  end;
end;


// 刷新按钮的作用
procedure TMainForm.btnFreshDataManageClick(Sender: TObject);
begin
  dtpDataManageOnChange(Sender);
end;

// 查看按钮作用
procedure TMainForm.btnScanDataManageClick(Sender: TObject);
begin
  if (dbgrdDataManage.Fields[4].Text = NULL) or (dbgrdDataManage.Fields[4].Text = '') then
    exit;
  DataManageGPForm1.Show;
  DataManageGPForm1.Caption:='股票分红公告-查看';

  //参数传入
  DataManageGPForm1.edtZQDMDataManageGP.Text:=dbgrdDataManage.Fields[3].Text;
  DataManageGPForm1.edtDMGPJYSCEdit.Text := dbgrdDataManage.Fields[2].Text;
  DataManageGPForm1.edtZQMCDataManageGP.Text:=dbgrdDataManage.Fields[4].Text;
  DataManageGPForm1.edtGHSLDataManageGP.Text:=dbgrdDataManage.Fields[5].Text;
  DataManageGPForm1.edtQYBLDataManageGP.Text:=dbgrdDataManage.Fields[7].Text;
  DataManageGPForm1.dtpKSRQDataManageGP.DateTime:=dbgrdDataManage.Fields[0].AsDateTime;
  DataManageGPForm1.dtpJSRQDataManageGP.DateTime:=dbgrdDataManage.Fields[1].AsDateTime;

  // 隐藏组件
  DataManageGPForm1.btnDataMGPSure.Visible:=False;
  DataManageGPForm1.btnDataMGPCancle.Caption:='确定';

  DataManageGPForm1.edtZQDMDataManageGP.Enabled := False;
  DataManageGPForm1.edtDMGPJYSCEdit.Enabled := False;
  DataManageGPForm1.edtZQMCDataManageGP.Enabled := False;
  DataManageGPForm1.edtGHSLDataManageGP.Enabled := False;
  DataManageGPForm1.edtQYBLDataManageGP.Enabled := False;
  DataManageGPForm1.dtpKSRQDataManageGP.Enabled := False;
  DataManageGPForm1.dtpJSRQDataManageGP.Enabled := False;
end;

// 编辑按钮作用
procedure TMainForm.btnEditDataManageClick(Sender: TObject);
begin
  if (dbgrdDataManage.Fields[4].Text = NULL) or (dbgrdDataManage.Fields[4].Text = '') then
    exit;
  DataManageGPForm1.Show;
  DataManageGPForm1.Caption:='股票分红公告-编辑';
  //参数传入
  DataManageGPForm1.edtZQDMDataManageGP.Text:=dbgrdDataManage.Fields[3].Text;
  DataManageGPForm1.edtDMGPJYSCEdit.Text := dbgrdDataManage.Fields[2].Text;
  DataManageGPForm1.edtZQMCDataManageGP.Text:=dbgrdDataManage.Fields[4].Text;
  DataManageGPForm1.edtGHSLDataManageGP.Text:=dbgrdDataManage.Fields[5].Text;
  DataManageGPForm1.edtQYBLDataManageGP.Text:=dbgrdDataManage.Fields[7].Text;
  DataManageGPForm1.dtpKSRQDataManageGP.DateTime:=dbgrdDataManage.Fields[0].AsDateTime;
  DataManageGPForm1.dtpJSRQDataManageGP.DateTime:=dbgrdDataManage.Fields[1].AsDateTime;

  // 显示组件
  DataManageGPForm1.btnDataMGPSure.Visible:=True;
  DataManageGPForm1.btnDataMGPCancle.Caption:='取消';

  DataManageGPForm1.edtZQDMDataManageGP.Enabled := False;
  DataManageGPForm1.edtDMGPJYSCEdit.Enabled := False;
  DataManageGPForm1.edtZQMCDataManageGP.Enabled := True;
  DataManageGPForm1.edtGHSLDataManageGP.Enabled := True;
  DataManageGPForm1.edtQYBLDataManageGP.Enabled := True;
  DataManageGPForm1.dtpKSRQDataManageGP.Enabled := True;
  DataManageGPForm1.dtpJSRQDataManageGP.Enabled := True;
end;


// 新增按钮作用
procedure TMainForm.btnAddDataManageClick(Sender: TObject);
begin
  DataManageGPForm1.Show;
  DataManageGPForm1.Caption:='股票分红公告-新增';
  // 清空组件中的内容，日期为获取今天
  DataManageGPForm1.edtZQDMDataManageGP.Text:='';
  DataManageGPForm1.edtDMGPJYSCEdit.Text := '';
  DataManageGPForm1.edtZQMCDataManageGP.Text:='';
  DataManageGPForm1.edtGHSLDataManageGP.Text:='0';
  DataManageGPForm1.edtQYBLDataManageGP.Text:='0.0';
  DataManageGPForm1.dtpKSRQDataManageGP.Date:=dtpMainForm.DateTime;
  DataManageGPForm1.dtpJSRQDataManageGP.Date:=dtpMainForm.DateTime;

   // 显示组件
  DataManageGPForm1.btnDataMGPSure.Visible:=True;
  DataManageGPForm1.btnDataMGPCancle.Caption:='取消';

  DataManageGPForm1.edtZQDMDataManageGP.Enabled := True;
  DataManageGPForm1.edtDMGPJYSCEdit.Enabled := True;
  DataManageGPForm1.edtZQMCDataManageGP.Enabled := True;
  DataManageGPForm1.edtGHSLDataManageGP.Enabled := True;
  DataManageGPForm1.edtQYBLDataManageGP.Enabled := True;
  DataManageGPForm1.dtpKSRQDataManageGP.Enabled := True;
  DataManageGPForm1.dtpJSRQDataManageGP.Enabled := True;
end;

// 更改表头 dbgrdDataManage
procedure TMainForm.changeDbgrdDataTitle(Sender:TObject);
begin
  if (tvDataManage.Selected.Text = '股票分红公告') then
  begin
    with dbgrdDataManage do
    begin
      Columns[0].title.caption := '业务日期';
      columns[0].Width := 100;
      Columns[1].title.caption := '到账日期';
      columns[1].Width := 100;
      Columns[2].title.caption := '交易市场';
      columns[2].Width := 100;
      Columns[3].title.caption := '证券代码';
      columns[3].Width := 100;
      Columns[4].title.caption := '证券名称';
      columns[4].Width := 100;
      Columns[5].title.caption := '登记数量';
      columns[5].Width := 100;
      Columns[6].title.caption := '分红金额';
      columns[6].Width := 100;
      Columns[7].title.caption := '权益比例';
      columns[7].Width := 100;
    end;
  end;
end;

// 右键菜单-查看
procedure TMainForm.pmDMN1Click(Sender: TObject);
begin
  btnScanDataManageClick(Sender);
end;

// 右键菜单-编辑
procedure TMainForm.pmDMN2Click(Sender: TObject);
begin
  btnEditDataManageClick(Sender);
end;

// 右键菜单-新增
procedure TMainForm.pmDMN4Click(Sender: TObject);
begin
  btnAddDataManageClick(Sender);
end;


//..............................................................................证券业务
// 由于债券交易和股票交易的数据差别就在 佣金和应收利息，所以直接使用 GPJY 的窗口组件
// 股票分红 界面和 债券兑息界面相差不多，所以直接使用 兑息（ZQYWDXForm) 界面
// 初始化界面的操作
procedure TMainForm.tsZQYWShow(Sender: TObject);
begin
  dbgrdZQYW.Visible:=True;
  // 选择第一个条目
  tvZQYW.Items.Item[1].Selected:=True;
  // 设置除权的开始日期和结束日期为主界面选择的日期
  dtpZQYWKSRQ.Date:=dtpMainForm.DateTime;
  dtpZQYWJSRQ.Date:=dtpMainForm.DateTime;

  // 调用函数实现数据的刷新
  dtpZQYWOnChange(Sender);
end;


// 根据交易日期和所选的标签来查询数据 当子菜单发生变化的时候，将调用此函数数进行数据刷新
procedure TMainForm.dtpZQYWOnChange(Sender: TObject);
begin
  with UserADOQuery do
  begin
    Close;
    SQL.Clear;
    if (tvZQYW.Selected.Text='股票交易') then
    begin
      SQL.Add('select * from TGPJY where TGPJY_JYRQ between :a and :b');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else if(tvZQYW.Selected.Text='新股中签') then
    begin
      SQL.Add('select * from TXG where TXG_YWRQ between :a and :b and TXG_YWLB=''新股中签''');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else if(tvZQYW.Selected.Text='中签交收') then
    begin
      SQL.Add('select * from TXG where TXG_YWRQ between :a and :b and TXG_YWLB=''新股交收''');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else if(tvZQYW.Selected.Text='中签缴款') then
    begin
      SQL.Add('select * from TXG where TXG_YWRQ between :a and :b and TXG_YWLB=''新股缴款''');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else if(tvZQYW.Selected.Text='新股流通') then
    begin
      SQL.Add('select * from TXG where TXG_YWRQ between :a and :b and TXG_YWLB=''新股流通''');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else if(tvZQYW.Selected.Text='红利除权') then
    begin
      SQL.Add('select * from THL where THL_YWRQ between :a and :b and THL_YWLB=''红利除权''');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else if(tvZQYW.Selected.Text='红利到账') then
    begin
      SQL.Add('select * from THL where THL_YWRQ between :a and :b and THL_YWLB=''红利到账''');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else if(tvZQYW.Selected.Text='红利送股') then
    begin
      SQL.Add('select * from THL where THL_YWRQ between :a and :b and THL_YWLB=''红股到账''');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else if(tvZQYW.Selected.Text='债券交易') then
    begin
      SQL.Add('select * from TZQJY where TZQJY_JYRQ between :a and :b and (TZQJY_JYFX=''买入'' or TZQJY_JYFX=''卖出'')');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else if(tvZQYW.Selected.Text='兑息转出') then
    begin
      SQL.Add('select * from TZQJY where TZQJY_JYRQ between :a and :b  and TZQJY_JYFX=''兑息转出''');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else if(tvZQYW.Selected.Text='兑息到账') then
    begin
      SQL.Add('select * from TZQJY where TZQJY_JYRQ between :a and :b and TZQJY_JYFX=''兑息到账''');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else if(tvZQYW.Selected.Text='债券业务') then
    begin
      SQL.Add('select * from TZQJY where TZQJY_JYRQ between :a and :b');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else if(tvZQYW.Selected.Text='回购业务') then
    begin
      SQL.Add('select * from THGJY where THGJY_CJRQ between :a and :b');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else
    begin
      SQL.Add('select * from TGPJY where TGPJY_JYRQ between :a and :b');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end;
    Open;

    ChangedbgrdZQYWTitle(Sender);
  end;
end;



// 点击查看按钮产生的活动
procedure TMainForm.btnZQYWScanClick(Sender: TObject);
begin
  // 如果 执行为空
  if (dbgrdZQYW.Fields[0].Text = NULL) or (dbgrdZQYW.Fields[0].Text = '') then
    exit;
  if (tvZQYW.Selected.Text='股票交易') then
  begin
    ZQYWGPJYForm1.Caption:='股票交易-查看';
    // 参数设置
    ZQYWGPJYForm1.edtGPJYZQDM.Text:=dbgrdZQYW.Fields[0].Text;
    ZQYWGPJYForm1.edtGPJYZQMC.Text:=dbgrdZQYW.Fields[1].Text;
    ZQYWGPJYForm1.dtpGPJYJYRQ.Date:=dbgrdZQYW.Fields[2].AsDateTime;
    ZQYWGPJYForm1.cbbGPJYJYFX.Text:=dbgrdZQYW.Fields[3].Text;
    ZQYWGPJYForm1.cbbGPJYJYSC.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWGPJYForm1.edtGPJYCJJG.Text:=dbgrdZQYW.Fields[5].Text;
    ZQYWGPJYForm1.edtGPJYCJJE.Text:=dbgrdZQYW.Fields[6].Text;
    ZQYWGPJYForm1.edtZQYWCJSL.Text:=dbgrdZQYW.Fields[7].Text;
    ZQYWGPJYForm1.edtGPJYYHS.Text:=dbgrdZQYW.Fields[9].Text;
    ZQYWGPJYForm1.edtGPJYJSF.Text:=dbgrdZQYW.Fields[8].Text;
    ZQYWGPJYForm1.edtGPJYGHF.Text:=dbgrdZQYW.Fields[10].Text;
    ZQYWGPJYForm1.edtGPJYZGF.Text:=dbgrdZQYW.Fields[11].Text;
    ZQYWGPJYForm1.edtGPJYYJ.Text:=dbgrdZQYW.Fields[12].Text;
    ZQYWGPJYForm1.edtGPJYSXF.Text:=FloatToStr(dbgrdZQYW.Fields[8].Text + dbgrdZQYW.Fields[9].Value
           + dbgrdZQYW.Fields[10].Value + dbgrdZQYW.Fields[11].Value);

    ZQYWGPJYForm1.lblGPJYSXF.Caption:='手续费';
    ZQYWGPJYForm1.lblGPJYYJ.Caption:='佣金';
    ZQYWGPJYForm1.btnGPJYSure.Visible:=False;
    ZQYWGPJYForm1.btnGPJYCancle.Caption:='确定';
    ZQYWGPJYForm1.Show;
  end
  else if(tvZQYW.Selected.Text='新股中签') or (tvZQYW.Selected.Text='中签缴款')
        or (tvZQYW.Selected.Text='中签交收')or (tvZQYW.Selected.Text='新股流通')then
  begin

    ZQYWXGForm1.Caption:='新股业务-查看';
    // TODO 参数设置
    ZQYWXGForm1.edtXGZQDM.Text:=dbgrdZQYW.Fields[0].Text;
    ZQYWXGForm1.cbbXGJYSC.Text:=dbgrdZQYW.Fields[1].Text;
    ZQYWXGForm1.cbbXGYWLB.Text:=dbgrdZQYW.Fields[2].Text;
    ZQYWXGForm1.edtXGCJJG.Text:=dbgrdZQYW.Fields[3].Text;
    ZQYWXGForm1.edtXGCJJE.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWXGForm1.edtXGCJSL.Text:=dbgrdZQYW.Fields[5].Text;
    ZQYWXGForm1.dtpXGYWRQ.Date:=dbgrdZQYW.Fields[6].AsDateTime;
    ZQYWXGForm1.edtXGZQMC.Text:=dbgrdZQYW.Fields[7].Text;

    ZQYWXGForm1.cbbXGYWLB.Enabled:=False;

    ZQYWXGForm1.btnXGSure.Visible:=False;
    ZQYWXGForm1.btnXGCancle.Caption:='确定';

    ZQYWXGForm1.Show;
  end
  else if(tvZQYW.Selected.Text='红利除权') then
  begin

    ZQYWDXForm1.Caption:='红利业务-除权-查看';
    // TODO 参数设置
    ZQYWDXForm1.edtDXZQDM.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWDXForm1.edtDXZQMC.Text:=dbgrdZQYW.Fields[5].Text;
    ZQYWDXForm1.dtpDXJYRQ.Date:=dbgrdZQYW.Fields[0].AsDateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:=dbgrdZQYW.Fields[3].Text;
    ZQYWDXForm1.edtDXZCLX.Text:=dbgrdZQYW.Fields[7].Text;

    ZQYWDXForm1.lblDXZCLX.Caption:='分红金额';
    ZQYWDXForm1.btnDXSure.Visible:=False;
    ZQYWDXForm1.btnDXCancle.Caption:='确定';

    ZQYWDXForm1.edtDXZQDM.Enabled:= False;
    ZQYWDXForm1.edtDXZQMC.Enabled := False;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := False;
    ZQYWDXForm1.cbbDXJYSC.Enabled := False;
    ZQYWDXForm1.edtDXZCLX.Enabled := False;

    ZQYWDXForm1.edtDXZQDM.Visible := True;
    ZQYWDXForm1.cbbZQDXZQDM.Visible := False;
    ZQYWDXForm1.Show;
  end
  else if(tvZQYW.Selected.Text='红利到账') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='红利业务-到账-查看';
    // TODO 参数设置
     ZQYWDXForm1.edtDXZQDM.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWDXForm1.edtDXZQMC.Text:=dbgrdZQYW.Fields[5].Text;
    ZQYWDXForm1.dtpDXJYRQ.Date:=dbgrdZQYW.Fields[0].AsDateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:=dbgrdZQYW.Fields[3].Text;
    ZQYWDXForm1.edtDXZCLX.Text:=dbgrdZQYW.Fields[7].Text;

    ZQYWDXForm1.lblDXZCLX.Caption:='分红金额';
    ZQYWDXForm1.btnDXSure.Visible:=False;
    ZQYWDXForm1.btnDXCancle.Caption:='确定';

    ZQYWDXForm1.edtDXZQDM.Enabled := False;
    ZQYWDXForm1.edtDXZQMC.Enabled := False;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := False;
    ZQYWDXForm1.cbbDXJYSC.Enabled := False;
    ZQYWDXForm1.edtDXZCLX.Enabled := False;
    ZQYWDXForm1.edtDXZQDM.Visible := True;
    ZQYWDXForm1.cbbZQDXZQDM.Visible := False;
  end
  else if(tvZQYW.Selected.Text='红利送股') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='红股到账-查看';
    // TODO 参数设置
     ZQYWDXForm1.edtDXZQDM.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWDXForm1.edtDXZQMC.Text:=dbgrdZQYW.Fields[5].Text;
    ZQYWDXForm1.dtpDXJYRQ.Date:=dbgrdZQYW.Fields[0].AsDateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:=dbgrdZQYW.Fields[3].Text;
    ZQYWDXForm1.edtDXZCLX.Text:=dbgrdZQYW.Fields[6].Text;

    ZQYWDXForm1.lblDXZCLX.Caption:='分红数量';
    ZQYWDXForm1.btnDXSure.Visible:=False;
    ZQYWDXForm1.btnDXCancle.Caption:='确定';

    ZQYWDXForm1.edtDXZQDM.Enabled := False;
    ZQYWDXForm1.edtDXZQMC.Enabled := False;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := False;
    ZQYWDXForm1.cbbDXJYSC.Enabled := False;
    ZQYWDXForm1.edtDXZCLX.Enabled := False;
    
    ZQYWDXForm1.edtDXZQDM.Visible := True;
    ZQYWDXForm1.cbbZQDXZQDM.Visible := False;
  end
  else if(tvZQYW.Selected.Text='债券交易') then
  begin

    ZQYWGPJYForm1.Caption:='债券交易-查看';
    // TODO 参数设置
    ZQYWGPJYForm1.edtGPJYZQDM.Text:=dbgrdZQYW.Fields[0].Text;
    ZQYWGPJYForm1.edtGPJYZQMC.Text:=dbgrdZQYW.Fields[1].Text;
    ZQYWGPJYForm1.dtpGPJYJYRQ.Date:=dbgrdZQYW.Fields[2].AsDateTime;
    ZQYWGPJYForm1.cbbGPJYJYFX.Text:=dbgrdZQYW.Fields[3].Text;
    ZQYWGPJYForm1.cbbGPJYJYSC.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWGPJYForm1.edtGPJYCJJG.Text:=dbgrdZQYW.Fields[5].Text;
    ZQYWGPJYForm1.edtGPJYCJJE.Text:=dbgrdZQYW.Fields[6].Text;
    ZQYWGPJYForm1.edtZQYWCJSL.Text:=dbgrdZQYW.Fields[7].Text;
    ZQYWGPJYForm1.edtGPJYYHS.Text:=dbgrdZQYW.Fields[9].Text;
    ZQYWGPJYForm1.edtGPJYJSF.Text:=dbgrdZQYW.Fields[8].Text;
    ZQYWGPJYForm1.edtGPJYGHF.Text:=dbgrdZQYW.Fields[10].Text;
    ZQYWGPJYForm1.edtGPJYZGF.Text:=dbgrdZQYW.Fields[11].Text;
    // 债券交易没有利息税，所以使用佣金的框作为利息税的展示
    ZQYWGPJYForm1.edtGPJYSXF.Text:=dbgrdZQYW.Fields[13].Text;
    ZQYWGPJYForm1.edtGPJYYJ.Text:=dbgrdZQYW.Fields[15].Text;

    ZQYWGPJYForm1.lblGPJYSXF.Caption:='税前利息';
    ZQYWGPJYForm1.lblGPJYYJ.Caption:='利息税';
    ZQYWGPJYForm1.btnGPJYSure.Visible:=False;
    ZQYWGPJYForm1.btnGPJYCancle.Caption:='确定';
    ZQYWGPJYForm1.Show;
  end
  else if(tvZQYW.Selected.Text='兑息转出') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='兑息业务-转出-查看';
    // TODO 参数设置
    ZQYWDXForm1.edtDXZQDM.Text:=dbgrdZQYW.Fields[0].Text;
    ZQYWDXForm1.edtDXZQMC.Text:=dbgrdZQYW.Fields[1].Text;
    ZQYWDXForm1.dtpDXJYRQ.Date:=dbgrdZQYW.Fields[2].AsDateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWDXForm1.edtDXZCLX.Text:=dbgrdZQYW.Fields[14].Text;

    ZQYWDXForm1.lblDXZCLX.Caption:='兑息金额';
    ZQYWDXForm1.btnDXSure.Visible:=False;
    ZQYWDXForm1.btnDXCancle.Caption:='确定';

    ZQYWDXForm1.edtDXZQDM.Enabled := False;
    ZQYWDXForm1.edtDXZQMC.Enabled := False;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := False;
    ZQYWDXForm1.cbbDXJYSC.Enabled := False;
    ZQYWDXForm1.edtDXZCLX.Enabled := False;
    
    ZQYWDXForm1.edtDXZQDM.Visible := True;
    ZQYWDXForm1.cbbZQDXZQDM.Visible := False;
  end
  else if(tvZQYW.Selected.Text='兑息到账') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='兑息业务-到账-查看';
    // TODO 参数设置
    ZQYWDXForm1.edtDXZQDM.Text:=dbgrdZQYW.Fields[0].Text;
    ZQYWDXForm1.edtDXZQMC.Text:=dbgrdZQYW.Fields[1].Text;
    ZQYWDXForm1.dtpDXJYRQ.Date:=dbgrdZQYW.Fields[2].AsDateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWDXForm1.edtDXZCLX.Text:=dbgrdZQYW.Fields[14].Text;

    ZQYWDXForm1.lblDXZCLX.Caption:='兑息金额';
    ZQYWDXForm1.btnDXSure.Visible:=False;
    ZQYWDXForm1.btnDXCancle.Caption:='确定';

    ZQYWDXForm1.edtDXZQDM.Enabled := False;
    ZQYWDXForm1.edtDXZQMC.Enabled := False;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := False;
    ZQYWDXForm1.cbbDXJYSC.Enabled := False;
    ZQYWDXForm1.edtDXZCLX.Enabled := False;

    ZQYWDXForm1.edtDXZQDM.Visible := True;
    ZQYWDXForm1.cbbZQDXZQDM.Visible := False;
  end
  else if(tvZQYW.Selected.Text='回购业务') then
  begin

    ZQYWHGForm1.Caption:='回购业务-查看';
    // TODO 参数设置
    ZQYWHGForm1.edtHGZQDM.Text:=dbgrdZQYW.Fields[0].Text;
    ZQYWHGForm1.edtHGZQMC.Text:=dbgrdZQYW.Fields[1].Text;
    ZQYWHGForm1.edtHGHGTS.Text:=dbgrdZQYW.Fields[2].Text;
    ZQYWHGForm1.dtpHGJYRQ.Date:=dbgrdZQYW.Fields[3].AsDateTime;
    ZQYWHGForm1.dtpHGDQRQ.Date:=dbgrdZQYW.Fields[4].AsDateTime;
    ZQYWHGForm1.cbbHGJYFX.Text:=dbgrdZQYW.Fields[5].Text;
    ZQYWHGForm1.cbbHGJYSC.Text:=dbgrdZQYW.Fields[6].Text;
    ZQYWHGForm1.edtHGCJJE.Text:=dbgrdZQYW.Fields[7].Text;
    ZQYWHGForm1.edtHGFKJE.Text:=dbgrdZQYW.Fields[8].Text;

    ZQYWHGForm1.btnHGSure.Visible:=False;
    ZQYWHGForm1.btnHGCancle.Caption:='确定';
    ZQYWHGForm1.Show;
  end
  else
  begin

  end;
end;

// 点击编辑按钮产生的活动
procedure TMainForm.btnZQYWEditClick(Sender: TObject);
begin
  if (dbgrdZQYW.Fields[0].Text = NULL) or (dbgrdZQYW.Fields[0].Text = '') then
    exit;
  if (tvZQYW.Selected.Text='股票交易') then
  begin

    ZQYWGPJYForm1.Caption:='股票交易-修改';
    // 参数设置
    ZQYWGPJYForm1.edtGPJYZQDM.Text:=dbgrdZQYW.Fields[0].Text;
    ZQYWGPJYForm1.edtGPJYZQMC.Text:=dbgrdZQYW.Fields[1].Text;
    ZQYWGPJYForm1.dtpGPJYJYRQ.Date:=dbgrdZQYW.Fields[2].AsDateTime;
    ZQYWGPJYForm1.cbbGPJYJYFX.Text:=dbgrdZQYW.Fields[3].Text;
    ZQYWGPJYForm1.cbbGPJYJYSC.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWGPJYForm1.edtGPJYCJJG.Text:=dbgrdZQYW.Fields[5].Text;
    ZQYWGPJYForm1.edtGPJYCJJE.Text:=dbgrdZQYW.Fields[6].Text;
    ZQYWGPJYForm1.edtZQYWCJSL.Text:=dbgrdZQYW.Fields[7].Text;
    ZQYWGPJYForm1.edtGPJYYHS.Text:=dbgrdZQYW.Fields[9].Text;
    ZQYWGPJYForm1.edtGPJYJSF.Text:=dbgrdZQYW.Fields[8].Text;
    ZQYWGPJYForm1.edtGPJYGHF.Text:=dbgrdZQYW.Fields[10].Text;
    ZQYWGPJYForm1.edtGPJYZGF.Text:=dbgrdZQYW.Fields[11].Text;
    ZQYWGPJYForm1.edtGPJYYJ.Text:=dbgrdZQYW.Fields[12].Text;
    ZQYWGPJYForm1.edtGPJYSXF.Text:=FloatToStr(dbgrdZQYW.Fields[8].Text + dbgrdZQYW.Fields[9].Value
           + dbgrdZQYW.Fields[10].Value + dbgrdZQYW.Fields[11].Value);
           
    ZQYWGPJYForm1.lblGPJYSXF.Caption:='手续费';
    ZQYWGPJYForm1.lblGPJYYJ.Caption:='佣金';
    ZQYWGPJYForm1.btnGPJYSure.Visible:=True;
    ZQYWGPJYForm1.btnGPJYCancle.Caption:='取消';
    ZQYWGPJYForm1.Show;
  end
  else if(tvZQYW.Selected.Text='新股中签') or (tvZQYW.Selected.Text='中签缴款')
          or (tvZQYW.Selected.Text='中签交收') or (tvZQYW.Selected.Text='新股流通')then
  begin

    ZQYWXGForm1.Caption:='新股业务-修改';
    // TODO 参数设置
    ZQYWXGForm1.edtXGZQDM.Text:=dbgrdZQYW.Fields[0].Text;
    ZQYWXGForm1.cbbXGJYSC.Text:=dbgrdZQYW.Fields[1].Text;
    ZQYWXGForm1.cbbXGYWLB.Text:=dbgrdZQYW.Fields[2].Text;
    ZQYWXGForm1.edtXGCJJG.Text:=dbgrdZQYW.Fields[3].Text;
    ZQYWXGForm1.edtXGCJJE.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWXGForm1.edtXGCJSL.Text:=dbgrdZQYW.Fields[5].Text;
    ZQYWXGForm1.dtpXGYWRQ.Date:=dbgrdZQYW.Fields[6].AsDateTime;
    ZQYWXGForm1.edtXGZQMC.Text:=dbgrdZQYW.Fields[7].Text;

    ZQYWXGForm1.cbbXGYWLB.Enabled:=False;

    ZQYWXGForm1.btnXGSure.Visible:=True;
    ZQYWXGForm1.btnXGCancle.Caption:='取消';
    ZQYWXGForm1.Show;
  end
  else if(tvZQYW.Selected.Text='红利除权') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='红利业务-除权-修改';
    // TODO 参数设置
    ZQYWDXForm1.edtDXZQDM.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWDXForm1.edtDXZQMC.Text:=dbgrdZQYW.Fields[5].Text;
    ZQYWDXForm1.dtpDXJYRQ.Date:=dbgrdZQYW.Fields[0].AsDateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:=dbgrdZQYW.Fields[3].Text;
    ZQYWDXForm1.edtDXZCLX.Text:=dbgrdZQYW.Fields[7].Text;

    ZQYWDXForm1.lblDXZCLX.Caption:='分红金额';
    ZQYWDXForm1.btnDXSure.Visible:=True;
    ZQYWDXForm1.btnDXCancle.Caption:='取消';

    ZQYWDXForm1.edtDXZQDM.Enabled := False;
    ZQYWDXForm1.edtDXZQMC.Enabled := True;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := True;
    ZQYWDXForm1.cbbDXJYSC.Enabled := False;
    ZQYWDXForm1.edtDXZCLX.Enabled := True;

    ZQYWDXForm1.edtDXZQDM.Visible := True;
    ZQYWDXForm1.cbbZQDXZQDM.Visible := False;
  end
  else if(tvZQYW.Selected.Text='红利到账') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='红利业务-到账-修改';
    // TODO 参数设置
    ZQYWDXForm1.edtDXZQDM.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWDXForm1.edtDXZQMC.Text:=dbgrdZQYW.Fields[5].Text;
    ZQYWDXForm1.dtpDXJYRQ.Date:=VarToDateTime(dbgrdZQYW.Fields[0].Text);
    ZQYWDXForm1.cbbDXJYSC.Text:=dbgrdZQYW.Fields[3].Text;
    ZQYWDXForm1.edtDXZCLX.Text:=dbgrdZQYW.Fields[7].Text;
    
    ZQYWDXForm1.lblDXZCLX.Caption:='分红金额';
    ZQYWDXForm1.btnDXSure.Visible:=True;
    ZQYWDXForm1.btnDXCancle.Caption:='取消';

    ZQYWDXForm1.edtDXZQDM.Enabled := False;
    ZQYWDXForm1.edtDXZQMC.Enabled := False;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := True;
    ZQYWDXForm1.cbbDXJYSC.Enabled := False;
    ZQYWDXForm1.edtDXZCLX.Enabled := True;
    
    ZQYWDXForm1.edtDXZQDM.Visible := True;
    ZQYWDXForm1.cbbZQDXZQDM.Visible := False;
  end
  else if(tvZQYW.Selected.Text='红利送股') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='红股到账-修改';
    // TODO 参数设置
     ZQYWDXForm1.edtDXZQDM.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWDXForm1.edtDXZQMC.Text:=dbgrdZQYW.Fields[5].Text;
    ZQYWDXForm1.dtpDXJYRQ.Date:=dbgrdZQYW.Fields[0].AsDateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:=dbgrdZQYW.Fields[3].Text;
    ZQYWDXForm1.edtDXZCLX.Text:=dbgrdZQYW.Fields[6].Text;

    ZQYWDXForm1.lblDXZCLX.Caption:='分红数量';
    ZQYWDXForm1.btnDXSure.Visible:=True;
    ZQYWDXForm1.btnDXCancle.Caption:='取消';

    ZQYWDXForm1.edtDXZQDM.Enabled := False;
    ZQYWDXForm1.edtDXZQMC.Enabled := False;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := True;
    ZQYWDXForm1.cbbDXJYSC.Enabled := False;
    ZQYWDXForm1.edtDXZCLX.Enabled := True;
    
    ZQYWDXForm1.edtDXZQDM.Visible := True;
    ZQYWDXForm1.cbbZQDXZQDM.Visible := False;
  end
  else if(tvZQYW.Selected.Text='债券交易') then
  begin

    ZQYWGPJYForm1.Caption:='债券交易-修改';
    // TODO 参数设置
     ZQYWGPJYForm1.edtGPJYZQDM.Text:=dbgrdZQYW.Fields[0].Text;
    ZQYWGPJYForm1.edtGPJYZQMC.Text:=dbgrdZQYW.Fields[1].Text;
    ZQYWGPJYForm1.dtpGPJYJYRQ.Date:=dbgrdZQYW.Fields[2].AsDateTime;
    ZQYWGPJYForm1.cbbGPJYJYFX.Text:=dbgrdZQYW.Fields[3].Text;
    ZQYWGPJYForm1.cbbGPJYJYSC.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWGPJYForm1.edtGPJYCJJG.Text:=dbgrdZQYW.Fields[5].Text;
    ZQYWGPJYForm1.edtGPJYCJJE.Text:=dbgrdZQYW.Fields[6].Text;
    ZQYWGPJYForm1.edtZQYWCJSL.Text:=dbgrdZQYW.Fields[7].Text;
    ZQYWGPJYForm1.edtGPJYYHS.Text:=dbgrdZQYW.Fields[9].Text;
    ZQYWGPJYForm1.edtGPJYJSF.Text:=dbgrdZQYW.Fields[8].Text;
    ZQYWGPJYForm1.edtGPJYGHF.Text:=dbgrdZQYW.Fields[10].Text;
    ZQYWGPJYForm1.edtGPJYZGF.Text:=dbgrdZQYW.Fields[11].Text;

    // 债券交易没有利息税，所以使用佣金的框作为利息税的展示  手续费 作为 税前利息使用
    ZQYWGPJYForm1.edtGPJYSXF.Text:=dbgrdZQYW.Fields[13].Text;
    ZQYWGPJYForm1.edtGPJYYJ.Text:=dbgrdZQYW.Fields[15].Text;

    ZQYWGPJYForm1.lblGPJYSXF.Caption:='税前利息';
    ZQYWGPJYForm1.lblGPJYYJ.Caption:='利息税';
    ZQYWGPJYForm1.btnGPJYSure.Visible:=True;
    ZQYWGPJYForm1.btnGPJYCancle.Caption:='取消';
    ZQYWGPJYForm1.Show;
  end
  else if(tvZQYW.Selected.Text='兑息转出') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='兑息业务-转出-修改';
    // TODO 参数设置
     ZQYWDXForm1.edtDXZQDM.Text:=dbgrdZQYW.Fields[0].Text;
    ZQYWDXForm1.edtDXZQMC.Text:=dbgrdZQYW.Fields[1].Text;
    ZQYWDXForm1.dtpDXJYRQ.Date:=dbgrdZQYW.Fields[2].AsDateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWDXForm1.edtDXZCLX.Text:=dbgrdZQYW.Fields[14].Text;

    ZQYWDXForm1.lblDXZCLX.Caption:='兑息金额';
    ZQYWDXForm1.btnDXSure.Visible:=True;
    ZQYWDXForm1.btnDXCancle.Caption:='取消';

    ZQYWDXForm1.edtDXZQDM.Enabled := False;
    ZQYWDXForm1.edtDXZQMC.Enabled := True;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := True;
    ZQYWDXForm1.cbbDXJYSC.Enabled := False;
    ZQYWDXForm1.edtDXZCLX.Enabled := True;
    
    ZQYWDXForm1.edtDXZQDM.Visible := True;
    ZQYWDXForm1.cbbZQDXZQDM.Visible := False;
  end
  else if(tvZQYW.Selected.Text='兑息到账') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='兑息业务-到账-修改';
    // TODO 参数设置
    ZQYWDXForm1.edtDXZQDM.Text:=dbgrdZQYW.Fields[0].Text;
    ZQYWDXForm1.edtDXZQMC.Text:=dbgrdZQYW.Fields[1].Text;
    ZQYWDXForm1.dtpDXJYRQ.Date:=dbgrdZQYW.Fields[2].AsDateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWDXForm1.edtDXZCLX.Text:=dbgrdZQYW.Fields[14].Text;

    ZQYWDXForm1.lblDXZCLX.Caption:='兑息金额';
    ZQYWDXForm1.btnDXSure.Visible:=True;
    ZQYWDXForm1.btnDXCancle.Caption:='取消';

    ZQYWDXForm1.edtDXZQDM.Enabled := False;
    ZQYWDXForm1.edtDXZQMC.Enabled := True;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := True;
    ZQYWDXForm1.cbbDXJYSC.Enabled := False;
    ZQYWDXForm1.edtDXZCLX.Enabled := True;
    
    ZQYWDXForm1.edtDXZQDM.Visible := True;
    ZQYWDXForm1.cbbZQDXZQDM.Visible := False;
  end
  else if(tvZQYW.Selected.Text='回购业务') then
  begin

    ZQYWHGForm1.Caption:='回购业务-修改';
    // TODO 参数设置
    ZQYWHGForm1.edtHGZQDM.Text:=dbgrdZQYW.Fields[0].Text;
    ZQYWHGForm1.edtHGZQMC.Text:=dbgrdZQYW.Fields[1].Text;
    ZQYWHGForm1.edtHGHGTS.Text:=dbgrdZQYW.Fields[2].Text;
    ZQYWHGForm1.dtpHGJYRQ.Date:=dbgrdZQYW.Fields[3].AsDateTime;
    ZQYWHGForm1.dtpHGDQRQ.Date:=dbgrdZQYW.Fields[4].AsDateTime;
    ZQYWHGForm1.cbbHGJYFX.Text:=dbgrdZQYW.Fields[5].Text;
    ZQYWHGForm1.cbbHGJYSC.Text:=dbgrdZQYW.Fields[6].Text;
    ZQYWHGForm1.edtHGCJJE.Text:=dbgrdZQYW.Fields[7].Text;
    ZQYWHGForm1.edtHGFKJE.Text:=dbgrdZQYW.Fields[8].Text;

    ZQYWHGForm1.btnHGSure.Visible:=True;
    ZQYWHGForm1.btnHGCancle.Caption:='取消';
    ZQYWHGForm1.Show;
  end
  else exit;
end;


// 点击新增按钮产生的活动
procedure TMainForm.btnZQYWAddClick(Sender: TObject);
begin
  if (tvZQYW.Selected.Text='股票交易') then
  begin

    ZQYWGPJYForm1.Caption:='股票交易-新增';
    // TODO 参数设置
    ZQYWGPJYForm1.edtGPJYZQDM.Text:='';
    ZQYWGPJYForm1.edtGPJYZQMC.Text:='';
    ZQYWGPJYForm1.dtpGPJYJYRQ.Date:= MainForm.dtpMainForm.DateTime;
    ZQYWGPJYForm1.cbbGPJYJYFX.Text:='';
    ZQYWGPJYForm1.cbbGPJYJYSC.Text:='';
    ZQYWGPJYForm1.edtGPJYCJJG.Text:='0';
    ZQYWGPJYForm1.edtGPJYCJJE.Text:='0';
    ZQYWGPJYForm1.edtZQYWCJSL.Text:='0';
    ZQYWGPJYForm1.edtGPJYYHS.Text:='0';
    ZQYWGPJYForm1.edtGPJYJSF.Text:='0';
    ZQYWGPJYForm1.edtGPJYGHF.Text:='0';
    ZQYWGPJYForm1.edtGPJYZGF.Text:='0';
    ZQYWGPJYForm1.edtGPJYYJ.Text:='0';
    ZQYWGPJYForm1.edtGPJYSXF.Text:='0.000001';
    ZQYWGPJYForm1.cbbGPJYZQDM.Text := '';

    ZQYWGPJYForm1.lblGPJYSXF.Caption:='手续费';
    ZQYWGPJYForm1.lblGPJYYJ.Caption:='佣金';
    ZQYWGPJYForm1.btnGPJYSure.Visible:=True;
    ZQYWGPJYForm1.btnGPJYCancle.Caption:='取消';
    ZQYWGPJYForm1.Show;
  end
  // 暂未分类，需要分类
  else if (tvZQYW.Selected.Text='新股中签') or (tvZQYW.Selected.Text='中签缴款')
      or (tvZQYW.Selected.Text='中签交收') or (tvZQYW.Selected.Text='新股流通')then
  begin

    ZQYWXGForm1.Caption:='新股业务-新增';
    // TODO 参数设置
    ZQYWXGForm1.edtXGZQDM.Text:='';
    ZQYWXGForm1.edtXGZQMC.Text:='';
    ZQYWXGForm1.dtpXGYWRQ.Date:= MainForm.dtpMainForm.DateTime;
    // 分别设置业务类别，后面根据业务类别和证券代码进行业务的判别
    if(tvZQYW.Selected.Text='新股中签') then
      ZQYWXGForm1.cbbXGYWLB.Text:='新股中签'
    else if(tvZQYW.Selected.Text='中签缴款') then
      ZQYWXGForm1.cbbXGYWLB.Text:='新股缴款'
    else if(tvZQYW.Selected.Text='中签交收') then
      ZQYWXGForm1.cbbXGYWLB.Text:='新股交收'
    else if(tvZQYW.Selected.Text='新股流通') then
      ZQYWXGForm1.cbbXGYWLB.Text:='新股流通';

    ZQYWXGForm1.cbbXGJYSC.Text:='';
    ZQYWXGForm1.edtXGCJSL.Text:='0';
    ZQYWXGForm1.edtXGCJJG.Text:='0';
    ZQYWXGForm1.edtXGCJJE.Text:='0';

    ZQYWXGForm1.cbbXGYWLB.Enabled:=False;

    ZQYWXGForm1.btnXGSure.Visible:=True;
    ZQYWXGForm1.btnXGCancle.Caption:='取消';
    ZQYWXGForm1.Show;
  end
  else if(tvZQYW.Selected.Text='红利除权') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='红利业务-除权-新增';
    // TODO 参数设置
    ZQYWDXForm1.edtDXZQDM.Text:='';
    ZQYWDXForm1.edtDXZQMC.Text:='';
    ZQYWDXForm1.dtpDXJYRQ.Date:=MainForm.dtpMainForm.DateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:='';
    ZQYWDXForm1.edtDXZCLX.Text:='0';

    ZQYWDXForm1.lblDXZCLX.Caption:='分红金额';
    ZQYWDXForm1.btnDXSure.Visible:=True;
    ZQYWDXForm1.btnDXCancle.Caption:='取消';

    ZQYWDXForm1.edtDXZQDM.Enabled := True;
    ZQYWDXForm1.edtDXZQMC.Enabled := False;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := True;
    ZQYWDXForm1.cbbDXJYSC.Enabled := False;
    ZQYWDXForm1.edtDXZCLX.Enabled := True;

    ZQYWDXForm1.edtDXZQDM.Visible := False;
    ZQYWDXForm1.cbbZQDXZQDM.Visible := True;
    ZQYWDXForm1.cbbZQDXZQDM.Text := '';
  end
  else if(tvZQYW.Selected.Text='红利到账') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='红利业务-到账-新增';
    // TODO 参数设置
    ZQYWDXForm1.edtDXZQDM.Text:='';
    ZQYWDXForm1.edtDXZQMC.Text:='';
    ZQYWDXForm1.dtpDXJYRQ.Date:=MainForm.dtpMainForm.DateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:='';
    ZQYWDXForm1.edtDXZCLX.Text:='0';

    ZQYWDXForm1.lblDXZCLX.Caption:='分红金额';
    ZQYWDXForm1.btnDXSure.Visible:=True;
    ZQYWDXForm1.btnDXCancle.Caption:='取消';

    ZQYWDXForm1.edtDXZQDM.Enabled := True;
    ZQYWDXForm1.edtDXZQMC.Enabled := False;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := True;
    ZQYWDXForm1.cbbDXJYSC.Enabled := False;
    ZQYWDXForm1.edtDXZCLX.Enabled := True;

    ZQYWDXForm1.edtDXZQDM.Visible := False;
    ZQYWDXForm1.cbbZQDXZQDM.Visible := True;
    ZQYWDXForm1.cbbZQDXZQDM.Text := '';
  end
  else if(tvZQYW.Selected.Text='红利送股') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='红股到账-新增';
    // TODO 参数设置
     ZQYWDXForm1.edtDXZQDM.Text:='';
    ZQYWDXForm1.edtDXZQMC.Text:='';
    ZQYWDXForm1.dtpDXJYRQ.Date:= Now();
    ZQYWDXForm1.cbbDXJYSC.Text:='';
    ZQYWDXForm1.edtDXZCLX.Text:='0';

    ZQYWDXForm1.lblDXZCLX.Caption:='分红数量';
    ZQYWDXForm1.btnDXSure.Visible:=True;
    ZQYWDXForm1.btnDXCancle.Caption:='取消';

    ZQYWDXForm1.edtDXZQDM.Enabled := True;
    ZQYWDXForm1.edtDXZQMC.Enabled := False;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := True;
    ZQYWDXForm1.cbbDXJYSC.Enabled := False;
    ZQYWDXForm1.edtDXZCLX.Enabled := True;

    ZQYWDXForm1.edtDXZQDM.Visible := False;
    ZQYWDXForm1.cbbZQDXZQDM.Visible := True;
    ZQYWDXForm1.cbbZQDXZQDM.Text := '';
  end
  else if(tvZQYW.Selected.Text='债券交易') then
  begin

    ZQYWGPJYForm1.Caption:='债券交易-新增';
    // TODO 参数设置
     ZQYWGPJYForm1.edtGPJYZQDM.Text:='';
    ZQYWGPJYForm1.edtGPJYZQMC.Text:='';
    ZQYWGPJYForm1.dtpGPJYJYRQ.Date:= MainForm.dtpMainForm.DateTime;
    ZQYWGPJYForm1.cbbGPJYJYFX.Text:='';
    ZQYWGPJYForm1.cbbGPJYJYSC.Text:='';
    ZQYWGPJYForm1.edtGPJYCJJG.Text:='0';
    ZQYWGPJYForm1.edtGPJYCJJE.Text:='0';
    ZQYWGPJYForm1.edtZQYWCJSL.Text:='0';
    ZQYWGPJYForm1.edtGPJYYHS.Text:='0';
    ZQYWGPJYForm1.edtGPJYJSF.Text:='0';
    ZQYWGPJYForm1.edtGPJYGHF.Text:='0';
    ZQYWGPJYForm1.edtGPJYZGF.Text:='0';
    ZQYWGPJYForm1.edtGPJYSXF.Text:='0';
    // 债券交易没有利息税，所以使用佣金的框作为利息税的展示
    ZQYWGPJYForm1.edtGPJYYJ.Text:='';
    ZQYWGPJYForm1.cbbGPJYZQDM.Text := '';

    ZQYWGPJYForm1.lblGPJYSXF.Caption:='税前利息';
    ZQYWGPJYForm1.lblGPJYYJ.Caption:='利息税';
    ZQYWGPJYForm1.btnGPJYSure.Visible:=True;
    ZQYWGPJYForm1.btnGPJYCancle.Caption:='取消';
    ZQYWGPJYForm1.Show;
  end
  else if(tvZQYW.Selected.Text='兑息转出') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='兑息业务-转出-新增';
    // TODO 参数设置
    ZQYWDXForm1.edtDXZQDM.Text:='';
    ZQYWDXForm1.edtDXZQMC.Text:='';
    ZQYWDXForm1.dtpDXJYRQ.Date:=MainForm.dtpMainForm.DateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:='';
    ZQYWDXForm1.edtDXZCLX.Text:='0';

    ZQYWDXForm1.lblDXZCLX.Caption:='兑息金额';
    ZQYWDXForm1.btnDXSure.Visible:=True;
    ZQYWDXForm1.btnDXCancle.Caption:='取消';

    ZQYWDXForm1.edtDXZQDM.Enabled := True;
    ZQYWDXForm1.edtDXZQMC.Enabled := False;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := True;
    ZQYWDXForm1.cbbDXJYSC.Enabled := False;
    ZQYWDXForm1.edtDXZCLX.Enabled := True;

    ZQYWDXForm1.edtDXZQDM.Visible := False;
    ZQYWDXForm1.cbbZQDXZQDM.Visible := True;
    ZQYWDXForm1.cbbZQDXZQDM.Text := '';
  end
  else if(tvZQYW.Selected.Text='兑息到账') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='兑息业务-到账-新增';
    // TODO 参数设置
    ZQYWDXForm1.edtDXZQDM.Text:='';
    ZQYWDXForm1.edtDXZQMC.Text:='';
    ZQYWDXForm1.dtpDXJYRQ.Date:= MainForm.dtpMainForm.DateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:='';
    ZQYWDXForm1.edtDXZCLX.Text:='';

    ZQYWDXForm1.lblDXZCLX.Caption:='兑息金额';
    ZQYWDXForm1.btnDXSure.Visible:=True;
    ZQYWDXForm1.btnDXCancle.Caption:='取消';

    ZQYWDXForm1.edtDXZQDM.Enabled := True;
    ZQYWDXForm1.edtDXZQMC.Enabled := False;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := True;
    ZQYWDXForm1.cbbDXJYSC.Enabled := False;
    ZQYWDXForm1.edtDXZCLX.Enabled := True;

    ZQYWDXForm1.edtDXZQDM.Visible := False;
    ZQYWDXForm1.cbbZQDXZQDM.Visible := True;
    ZQYWDXForm1.cbbZQDXZQDM.Text := '';
  end
  else if(tvZQYW.Selected.Text='回购业务') then
  begin

    ZQYWHGForm1.Caption:='回购业务-新增';
    // TODO 参数设置
    ZQYWHGForm1.edtHGZQDM.Text:='';
    ZQYWHGForm1.edtHGZQMC.Text:='';
    ZQYWHGForm1.dtpHGJYRQ.Date:=MainForm.dtpMainForm.DateTime;
    ZQYWHGForm1.dtpHGDQRQ.Date:=MainForm.dtpMainForm.DateTime;
    ZQYWHGForm1.cbbHGJYFX.Text:='';
    ZQYWHGForm1.edtHGHGTS.Text:='0';
    ZQYWHGForm1.cbbHGJYSC.Text:='';
    ZQYWHGForm1.edtHGCJJE.Text:='0';
    ZQYWHGForm1.edtHGFKJE.Text:='0';

    ZQYWHGForm1.btnHGSure.Visible:=True;
    ZQYWHGForm1.btnHGCancle.Caption:='取消';
    ZQYWHGForm1.Show;
  end
  else
  begin

  end;
end;

// 右键删除按钮作用
procedure TMainForm.mni3Click(Sender: TObject);
begin
  dbgrdZQYW.DataSource.DataSet.Delete;
end;



// 点击刷新按钮产生的活动
procedure TMainForm.btnZQYWFreshClick(Sender: TObject);
begin
  dtpZQYWOnChange(Sender);
end;


// 点击搜索按钮产生的活动
procedure TMainForm.btnZQYWSearchClick(Sender: TObject);
begin
  with UserADOQuery do
  begin
    Close;
    SQL.Clear;
    if (tvZQYW.Selected.Text='股票交易') or (tvZQYW.Selected.Text='股票业务')then
    begin
      SQL.Add('select * from TGPJY where TGPJY_ZQDM=:a');
      Parameters.ParamByName('a').Value:=Trim(edtZQYWSearch.Text);
    end
    else if(tvZQYW.Selected.Text='新股中签') then
    begin
      SQL.Add('select * from TXG where TXG_ZQDM=:a and TXG_YWLB=''新股中签''');
      Parameters.ParamByName('a').Value:=Trim(edtZQYWSearch.Text);
    end
    else if(tvZQYW.Selected.Text='中签缴款') then
    begin
      SQL.Add('sselect * from TXG where TXG_ZQDM=:a and TXG_YWLB=''中签缴款''');
      Parameters.ParamByName('a').Value:=Trim(edtZQYWSearch.Text);
    end
    else if(tvZQYW.Selected.Text='中签交收') then
    begin
      SQL.Add('select * from TXG where TXG_ZQDM=:a and TXG_YWLB=''中签交收''');
      Parameters.ParamByName('a').Value:=Trim(edtZQYWSearch.Text);
    end
    else if(tvZQYW.Selected.Text='新股流通') then
    begin
      SQL.Add('select * from TXG where TXG_ZQDM=:a and TXG_YWLB=''新股流通''');
      Parameters.ParamByName('a').Value:=Trim(edtZQYWSearch.Text);
    end
    else if(tvZQYW.Selected.Text='红利除权') then
    begin
      SQL.Add('select * from THL where THL_ZQDM=:a and THL_YWLB=''红利除权''');
      Parameters.ParamByName('a').Value:=Trim(edtZQYWSearch.Text);
    end
    else if(tvZQYW.Selected.Text='红利到账') then
    begin
      SQL.Add('select * from THL where THL_ZQDM=:a and THL_YWLB=''红利到账''');
      Parameters.ParamByName('a').Value:=Trim(edtZQYWSearch.Text);
    end
    else if(tvZQYW.Selected.Text='红利送股') then
    begin
      SQL.Add('select * from THL where THL_ZQDM=:a and THL_YWLB=''红股到账''');
      Parameters.ParamByName('a').Value:=Trim(edtZQYWSearch.Text);
    end
    else if(tvZQYW.Selected.Text='债券交易') or (tvZQYW.Selected.Text='债券业务') then
    begin
      SQL.Add('select * from TZQJY where TZQJY_ZQDM=:a and (TZQJY_JYFX=''买入'' or TZQJY_JYFX=''卖出''）');
      Parameters.ParamByName('a').Value:=Trim(edtZQYWSearch.Text);
    end
    else if(tvZQYW.Selected.Text='兑息转出') then
    begin
      SQL.Add('select * from TZQJY where TZQJY_ZQDM=:a and TZQJY_JYFX=''兑息转出''');
      Parameters.ParamByName('a').Value:=Trim(edtZQYWSearch.Text);
    end
    else if(tvZQYW.Selected.Text='兑息到账') then
    begin
      SQL.Add('select * from TZQJY where TZQJY_ZQDM=:a and TZQJY_JYFX=''兑息到账''');
      Parameters.ParamByName('a').Value:=Trim(edtZQYWSearch.Text);
    end
    else if(tvZQYW.Selected.Text='回购业务') then
    begin
      SQL.Add('select * from THGJY where THGJY_ZQDM=:a');
      Parameters.ParamByName('a').Value:=Trim(edtZQYWSearch.Text);
    end;
    Open;// 使用ExecSQL 导致数据查询不出来

    // 使用函数改变表头
    ChangedbgrdZQYWTitle(Sender);
  end;
end;

// 改变  dbgrdZQYW 的表头
procedure TMainForm.ChangedbgrdZQYWTitle(Sender: TObject);
begin
  with  dbgrdZQYW do
  begin
    if (tvZQYW.Selected.Text='股票交易') or (tvZQYW.Selected.Text='股票业务')then
    begin
      Columns[0].Title.Caption := '证券代码';
      Columns[0].Width := 100;
      Columns[1].Title.Caption := '证券名称';
      Columns[1].Width := 100;
      Columns[2].Title.Caption := '交易日期';
      Columns[2].Width := 100;
      Columns[3].Title.Caption := '交易方向';
      Columns[3].Width := 100;
      Columns[4].Title.Caption := '交易市场';
      Columns[4].Width := 100;
      Columns[5].Title.Caption := '成交价格';
      Columns[5].Width := 100;
      Columns[6].Title.Caption := '成交金额';
      Columns[6].Width := 100;
      Columns[7].Title.Caption := '成交数量';
      Columns[7].Width := 100;
      Columns[8].Title.Caption := '经手费';
      Columns[8].Width := 100;
      Columns[9].Title.Caption := '印花税';
      Columns[9].Width := 100;
      Columns[10].Title.Caption := '过户费';
      Columns[10].Width := 100;
      Columns[11].Title.Caption := '证管费';
      Columns[11].Width := 100;
      Columns[12].Title.Caption := '佣金';
      Columns[12].Width := 100;
    end
    else if(tvZQYW.Selected.Text='新股中签') or (tvZQYW.Selected.Text='中签缴款')
           or (tvZQYW.Selected.Text='中签交收') or (tvZQYW.Selected.Text='新股流通')then
    begin
      Columns[0].Title.Caption := '证券代码';
      Columns[0].Width := 100;
      Columns[1].Title.Caption := '交易市场';
      Columns[1].Width := 100;
      Columns[2].Title.Caption := '业务类别';
      Columns[2].Width := 100;
      Columns[3].Title.Caption := '成交价格';
      Columns[3].Width := 100;
      Columns[4].Title.Caption := '成交金额';
      Columns[4].Width := 100;
      Columns[5].Title.Caption := '成交数量';
      Columns[5].Width := 100;
      Columns[6].Title.Caption := '业务日期';
      Columns[6].Width := 100;
      Columns[7].Title.Caption := '证券名称';
      Columns[7].Width := 100;
      Columns[8].Title.Caption := '交易日期';
      Columns[8].Width := 100;
    end
    else if(tvZQYW.Selected.Text='红利除权') or (tvZQYW.Selected.Text='红利到账')
          or (tvZQYW.Selected.Text='红利送股')  then
    begin
      Columns[0].title.caption := '业务日期';
      columns[0].Width := 100;
      Columns[1].title.caption := '到账日期';
      columns[1].Width := 100;
      Columns[2].title.caption := '业务类别';
      columns[2].Width := 100;
      Columns[3].title.caption := '交易市场';
      columns[3].Width := 100;
      Columns[4].title.caption := '证券代码';
      columns[4].Width := 100;
      Columns[5].title.caption := '证券名称';
      columns[5].Width := 100;
      Columns[6].title.caption := '登记数量';
      columns[6].Width := 100;
      Columns[7].title.caption := '分红金额';
      columns[7].Width := 100;
      Columns[8].title.caption := '权益比例';
      columns[8].Width := 100;
    end
    else if(tvZQYW.Selected.Text='债券交易') or (tvZQYW.Selected.Text='兑息转出')
         or (tvZQYW.Selected.Text='兑息到账') or (tvZQYW.Selected.Text='债券业务')then
    begin
      Columns[0].Title.Caption := '证券代码';
      Columns[0].Width := 100;
      Columns[1].Title.Caption := '债券名称';
      Columns[1].Width := 100;
      Columns[2].Title.Caption := '交易日期';
      Columns[2].Width := 100;
      Columns[3].Title.Caption := '交易方向';
      Columns[3].Width := 100;
      Columns[4].Title.Caption := '交易市场';
      Columns[4].Width := 100;
      Columns[5].Title.Caption := '成交价格';
      Columns[5].Width := 100;
      Columns[6].Title.Caption := '成交金额';
      Columns[6].Width := 100;
      Columns[7].Title.Caption := '成交数量';
      Columns[7].Width := 100;
      Columns[8].Title.Caption := '经手费';
      Columns[8].Width := 100;
      Columns[9].Title.Caption := '印花税';
      Columns[9].Width := 100;
      Columns[10].Title.Caption := '过户费';
      Columns[10].Width := 100;
      Columns[11].Title.Caption := '证管费';
      Columns[11].Width := 100;
      Columns[12].Title.Caption := '佣金';
      Columns[12].Width := 100;
      Columns[13].Title.Caption := '税前利息';
      Columns[13].Width := 100;
      Columns[14].Title.Caption := '税后利息';
      Columns[14].Width := 100;
      Columns[15].Title.Caption := '利息税';
      Columns[15].Width := 100;
      Columns[16].Title.Caption := '业务日期';
      Columns[16].Width := 100;
    end
    else if(tvZQYW.Selected.Text='回购业务') then
    begin
      Columns[0].Title.Caption := '证券代码';
      Columns[0].Width := 100;
      Columns[1].Title.Caption := '回购名称';
      Columns[1].Width := 100;
      Columns[2].Title.Caption := '回购天数';
      Columns[2].Width := 100;
      Columns[3].Title.Caption := '成交日期';
      Columns[3].Width := 100;
      Columns[4].Title.Caption := '到期日期';
      Columns[4].Width := 100;
      Columns[5].Title.Caption := '回购方向';
      Columns[5].Width := 100;
      Columns[6].Title.Caption := '交易市场';
      Columns[6].Width := 100;
      Columns[7].Title.Caption := '成交金额';
      Columns[7].Width := 100;
      Columns[8].Title.Caption := '返款金额';
      Columns[8].Width := 100;
    end
    else exit;
  end;

end;

// 。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。日常操作

// 初次显示 TAB 时进行操作
procedure TMainForm.tsRCCZShow(Sender: TObject);
begin
  // 同步业务日期
  dtpRCCZYWRQ.DateTime := dtpMainForm.DateTime;
  // 调用函数实现数据的刷新
  tvRCCZOnChange(Sender);

end;

//  根据选择的 条目进行不同界面的显示
procedure TMainForm.tvRCCZOnChange(Sender: TObject);
var TItem:Tlistitem;
    stringDate, stringDateNoYear,string_date,fileRealPath, fileRealName: String;
begin
    // 设置进度条的label 不可见
     lblRCCZCLJD.Caption := '处理进度';
     lblRCCZCLJD.Visible := False;
     lblRCCZCLJD.Update;
    // 获取字符串类型的日期格式，方便后面的找文件和文件名拼接
    stringDate := FileOperation.getStringOfDate(dtpRCCZYWRQ.DateTime);
    stringDateNoYear := FileOperation.getStringOfDateNoYear(dtpRCCZYWRQ.DateTime);
    string_Date := FileOperation.getStringOf_Date(dtpRCCZYWRQ.DateTime);
      // 设置listview头部
    lvRCCZ.Clear;
    lvRCCZ.Columns.Clear;
    lvRCCZ.Columns.Add;
    lvRCCZ.Columns.Add;
    lvRCCZ.Columns.Add;
    lvRCCZ.Columns.Add;
    lvRCCZ.Columns.Add;
    lvRCCZ.Columns.Items[0].Caption:='状态';
    lvRCCZ.Columns.Items[1].Caption:='状态';
    lvRCCZ.Columns.Items[2].Caption:='接口名称';
    lvRCCZ.Columns.Items[3].Caption:='路径';
    lvRCCZ.Columns.Items[4].Caption:='文件名';
    lvRCCZ.Columns.Items[0].Width:=80;
    lvRCCZ.Columns.Items[1].Width:=80;
    lvRCCZ.Columns.Items[2].Width:=150;
    lvRCCZ.Columns.Items[3].Width:=320;
    lvRCCZ.Columns.Items[4].Width:=lvRCCZ.Width - 400 - 150 - 85;
    lvRCCZ.ViewStyle:=vsReport;
    lvRCCZ.GridLines:=True;

    lvRCCZ.Items.Clear;

    with UserADOQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from TJSLJ');
      Open;

      // 查询数据库里面的数据，如果，并将对应的数据插入到 listView
      while not Eof do
      begin
        TItem:=lvRCCZ.Items.Add;
        TItem.Caption:='True';

        // 获取文件的真实路径和真实名称
        fileRealPath := FieldByName('TJSLJ_WJLJ').Value + stringDate + '\';
        if(FieldByName('TJSLJ_WJMC').Value = 'cpxx*.txt') then
        begin
          fileRealName := 'cpxx' + stringDateNoYear + '.txt';
          //判断文件是否已经被读入
          if FileOperation.jkFileAlready('select * from tjk_shzqxx where d_ywrq=date''' +
             string_Date + '''')
          then TItem.SubItems.Add('True')
          else  TItem.SubItems.Add('False');
        end
        else if (FieldByName('TJSLJ_WJMC').Value = 'securities_*.xml') then
        begin
          fileRealName := 'securities_' + StringDate + '.xml';
          if FileOperation.jkFileAlready('select * from tjk_szzqxx where d_ywrq=date''' +
             string_Date + '''')
          then TItem.SubItems.Add('True')
          else  TItem.SubItems.Add('False');
        end
        else if (FieldByName('TJSLJ_WJMC').Value = 'mktdt00.txt') then
        begin
          fileRealName := 'mktdt00.txt';
          if FileOperation.jkFileAlready('select * from tjk_mktdt00 where d_ywrq=date''' +
             string_Date + '''')
          then TItem.SubItems.Add('True')
          else  TItem.SubItems.Add('False');
        end
        else if (FieldByName('TJSLJ_WJMC').Value = 'cashsecurityclosemd_*.xml') then
        begin
          fileRealName := 'cashsecurityclosemd_' + StringDate + '.xml';
          if FileOperation.jkFileAlready('select * from tjk_cashsecurity where d_ywrq=date''' +
             string_Date + '''')
          then TItem.SubItems.Add('True')
          else  TItem.SubItems.Add('False');
        end
        else if (FieldByName('TJSLJ_WJMC').Value = 'GH*.dbf') then
        begin
          fileRealName := 'GH32562.dbf';
          if FileOperation.jkFileAlready('select * from tjk_gh where d_ywrq=date''' +
             string_Date + '''')
          then TItem.SubItems.Add('True')
          else  TItem.SubItems.Add('False');
        end
        else if (FieldByName('TJSLJ_WJMC').Value = 'SJSMX1*.dbf') then
        begin
          fileRealName := 'SJSMX1' + StringDateNoYear + '.dbf';
          if FileOperation.jkFileAlready('select * from tjk_sjsmx1 where d_ywrq=date''' +
             string_Date + '''')
          then TItem.SubItems.Add('True')
          else  TItem.SubItems.Add('False');
        end
        else if (FieldByName('TJSLJ_WJMC').Value = 'JSMX*.dbf') then
        begin
          fileRealName := 'JSMX'+ 'jsmr1' + '.dbf';
          if FileOperation.jkFileAlready('select * from tjk_jsmx where d_ywrq=date''' +
             string_Date + '''')
          then TItem.SubItems.Add('True')
          else  TItem.SubItems.Add('False');
        end
        else if (FieldByName('TJSLJ_WJMC').Value = 'ZQBD*.dbf') then
        begin
          fileRealName := 'ZQBD' + 'jsmr1' + '.dbf';
          if FileOperation.jkFileAlready('select * from tjk_zqbd where d_ywrq=date''' +
             string_Date + '''')
          then TItem.SubItems.Add('True')
          else  TItem.SubItems.Add('False');
        end
        else if (FieldByName('TJSLJ_WJMC').Value = 'SJSFX*.dbf') then
        begin
          fileRealName := 'SJSFX' + StringDateNoYear +'.dbf';
          if FileOperation.jkFileAlready('select * from tjk_sjsfx where d_ywrq=date''' +
             string_Date + '''')
          then TItem.SubItems.Add('True')
          else  TItem.SubItems.Add('False');
        end
        else if (FieldByName('TJSLJ_WJMC').Value = 'SJSJG*.dbf') then
        begin
          fileRealName := 'SJSJG'+ StringDateNoYear + '.dbf';
          if FileOperation.jkFileAlready('select * from tjk_sjsjg where d_ywrq=date''' +
             string_Date + '''')
          then TItem.SubItems.Add('True')
          else  TItem.SubItems.Add('False');
        end;
        
        TItem.SubItems.Add(FieldByName('TJSLJ_JKMC').Value);
        TItem.SubItems.Add(fileRealPath);
        TItem.SubItems.Add(fileRealName);

        if not FileExists(fileRealPath + fileRealName) then
        begin
          TItem.Caption:='False';
        end;

        Next;
      end;
    end;
end;

// 自己定义绘制 listView 的函数，如果每一个 Item 的 Caption 为True，也就是文件存在
// 那么就将绘制这一行的笔刷社会组为 红色
procedure TMainForm.customerDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
var DefaultDraw: Boolean );
begin

  if( Item.Caption = 'False')then
  begin
    Sender.Canvas.Font.Color :=clRed;
  end
  else
  begin
    if (Item.SubItems.Strings[0] = 'True') then
    begin
      Sender.Canvas.Font.Color :=clGreen;
    end;
  end;

end;

// 日终清算按钮的作用
procedure TMainForm.btnRZQSClick(Sender: TObject);
Var i:Integer;
    Titem2:Tlistitem;
begin
  // 遍历listView 中的数据进行处理
  lblRCCZCLJD.Caption := '正在处理';
  lblRCCZCLJD.Visible :=True;
  pbRCCZ.Visible :=True;
  pbRCCZ.Min := 0;
  pbRCCZ.Max := 10;
  pbRCCZ.Position := pbRCCZ.Min;
  lblRCCZCLJD.Update;
  for i := 0 to lvRCCZ.Items.Count-1 do
  begin
    Titem2 := lvRCCZ.Items.Item[i];
    lblRCCZCLJD.Caption :=  Titem2.subItems.Strings[1];
    lblRCCZCLJD.Update;
    if( Titem2.Caption = 'True') then
      FileOperation.jkFileToDataBase(Titem2.subItems.Strings[1],
        Titem2.subItems.Strings[2],Titem2.subItems.Strings[3], dtpRCCZYWRQ.DateTime);
    pbRCCZ.Position := pbRCCZ.Position + 1;
  end;
  pbRCCZ.Position := pbRCCZ.Max;
  pbRCCZ.Visible :=False;
  lblRCCZCLJD.Caption := '数据已导入，正在进行处理！';
  lblRCCZCLJD.Update;

  tvRCCZOnChange(Sender);
  lvRCCZ.Update;

//   TODO 调用存储过程进行业务分类
  with UserADOQuery do
  begin
    Close;
    SQL.Clear;
//     调用存储过程进行日终清算
    SQL.Add('begin rzqs(:a); end;');
    Parameters.ParamByName('a').Value:= FormatDatetime('YYYY/MM/DD', dtpRCCZYWRQ.DateTime);
    ExecSQL;
  end;

  ShowMessage('日终清算已经完成！');
  lblRCCZCLJD.Caption := '处理完成！';
  lblRCCZCLJD.Update;
end;

// 恢复按钮的作用，删除当日所有的接口数据
procedure TMainForm.btnRCCZRecoverClick(Sender: TObject);
begin
  if Application.MessageBox('确定要恢复数据吗？','提示',MB_YESNO)=ID_Yes then
  begin
    with UserADOQuery do
    begin
      Close;
      SQL.Clear;
      // 调用存储过程进行数据删除
      SQL.Add('begin recoveryData(:a); end;');
      Parameters.ParamByName('a').Value:= FormatDatetime('YYYY/MM/DD', dtpRCCZYWRQ.DateTime);
      ExecSQL;
    end;
    tvRCCZOnChange(Sender);
    lvRCCZ.Update;
  end;

end;
// 生成凭证操作。直接调用存储过程
procedure TMainForm.btnRCCZSCPZClick(Sender: TObject);
begin
  lblRCCZCLJD.Caption := '正在生成凭证，请稍等...';
  lblRCCZCLJD.Update;
  with UserADOQuery do
  begin
    Close;
    SQL.Clear;
    // 调用存储过程进行生成凭证
    SQL.Add('begin scpz(:a); end;');
    Parameters.ParamByName('a').Value:= FormatDatetime('YYYY/MM/DD', dtpRCCZYWRQ.DateTime);
    ExecSQL;
  end;

  if Application.MessageBox('凭证已经生成，现在去查看？','提示',MB_YESNO)=ID_Yes then
  begin
    PageControl1.ActivePage := tsBBCK;
    tvBBCKMenu.Items.Item[0].Selected := True;
    dtpBBCKYWRQ.DateTime  := dtpRCCZYWRQ.DateTime;
    tvBBCKOnChange(Sender);
  end;

  lblRCCZCLJD.Visible := False;
  lblRCCZCLJD.Update;
end;

//生成估值表
procedure TMainForm.Button1Click(Sender: TObject);
begin
  ShowMessage('请确保所有的数据都是最新的!');
  // 调用存储过程生成估值表
    with UserADOQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tkjkmye where tkjkmye_ywrq=:a');
      Parameters.ParamByName('a').Value:= FormatDatetime('YYYY/MM/DD', dtpRCCZYWRQ.DateTime);
      Open;
      if (RecordCount < 1) then
      begin
          showmessage('前一天估值表没有生成，无法生成当日估值表！！！');
          lblRCCZCLJD.Visible := False;
          exit;
      end;

      Close;
      SQL.Clear;
      SQL.Add('select * from tgz where tgz_ywrq=:a');
      Parameters.ParamByName('a').Value:= FormatDatetime('YYYY/MM/DD', dtpRCCZYWRQ.DateTime-1);
      Open;
      
      if (RecordCount < 1) then
      begin
        showmessage('请先生成今天的会计科目余额表！！！');
        lblRCCZCLJD.Visible := False;
        exit;
      end;

      Close;
      SQL.Clear;
      SQL.Add('begin scgzb(:a); end;');
      Parameters.ParamByName('a').Value:= FormatDatetime('YYYY/MM/DD', dtpRCCZYWRQ.DateTime);
      ExecSQL;
    end;

    if Application.MessageBox('估值表已经生成，现在去查看？','提示',MB_YESNO)=ID_Yes then
    begin
      PageControl1.ActivePage := tsBBCK;
      tvBBCKMenu.Items.Item[1].Selected := True;
      dtpBBCKYWRQ.DateTime  := dtpRCCZYWRQ.DateTime;
      tvBBCKOnChange(Sender);

    end;

    lblRCCZCLJD.Visible := False;
    lblRCCZCLJD.Update;
end;

// 生成会计科目余额表
procedure TMainForm.Button2Click(Sender: TObject);
begin
  // 调用存储过程生成会计科目余额表
  with UserADOQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('begin sckjkmyeb(:a); end;');
    Parameters.ParamByName('a').Value:= FormatDatetime('YYYY/MM/DD', dtpRCCZYWRQ.DateTime);
    ExecSQL;
  end;
  if Application.MessageBox('会计科目余额表已经生成，现在去查看？','提示',MB_YESNO)=ID_Yes then
  begin
    // 设置 ActivePage 之后， onshow 方法被调用，所有的页面对象已经被创建
    PageControl1.ActivePage := tsBBCK;
    // 选择需要的功能
    tvBBCKMenu.Items.Item[2].Selected := True;
    // 刷新界面
    dtpBBCKYWRQ.DateTime  := dtpRCCZYWRQ.DateTime;
    tvBBCKOnChange(Sender);
  end;
  lblRCCZCLJD.Visible := False;
  lblRCCZCLJD.Update;
end;

// 凭证浏览按钮作用
procedure TMainForm.btnPZLLClick(Sender: TObject);
begin
  PageControl1.ActivePage := tsBBCK;
  tvBBCKMenu.Items.Item[0].Selected := True;
  dtpBBCKYWRQ.DateTime  := dtpRCCZYWRQ.DateTime;
  tvBBCKOnChange(Sender);
end;

//。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。报表查看界面
procedure TMainForm.tsBBCKShow(Sender: TObject);
begin
//  if (tvBBCKMenu.Selected.Text = '') then
    tvBBCKMenu.Items.Item[0].Selected:=True;
  // 同步业务日期
  dtpBBCKYWRQ.DateTime := dtpMainForm.DateTime;
  // 调用函数实现数据的刷新
  tvBBCKOnChange(Sender);

  tvBBCKMenu.HideSelection := False;

end;

procedure TMainForm.tvBBCKOnChange(Sender: TObject);
begin
  with UserADOQUery do
  begin
    Close;
    SQL.Clear;
    if (tvBBCKMenu.Selected.Text = '凭证查看') then
    begin
      lblBCKTitle.Caption := '凭证查看';
      SQL.Add('select tpzmx_flbh,tpzmx_kmdm,tpzmx_kmmc,tpzmx_ywlb,tpzmx_ywzy,tpzmx_je,'+
              'tpzmx_sl,tpzmx_jdfx from tpzmx where tpzmx_pzrq=:a order by tpzmx_flbh');
      Parameters.ParamByName('a').Value := FormatDatetime('YYYY/MM/DD', dtpBBCKYWRQ.DateTime);
      Open;

      // 也可以在 查询语句中设置 别名的方式达到改行名的效果
//       设置表头
      dbgrdBBCK.Columns[0].Title.caption := '科目代码';
      dbgrdBBCK.Columns[0].Width := 30;
      dbgrdBBCK.Columns[1].Title.caption := '科目代码';
      dbgrdBBCK.Columns[1].Width := 100;
      dbgrdBBCK.Columns[2].Title.caption := '科目名称';
      dbgrdBBCK.Columns[2].Width := 250;
      dbgrdBBCK.Columns[3].Title.caption := '业务类别';
      dbgrdBBCK.Columns[3].Width := 125;
      dbgrdBBCK.Columns[4].Title.caption := '业务摘要';
      dbgrdBBCK.Columns[4].Width := 250;
      dbgrdBBCK.Columns[5].Title.caption := '金额';
      dbgrdBBCK.Columns[5].Width := 75;
      dbgrdBBCK.Columns[6].Title.caption := '数量';
      dbgrdBBCK.Columns[6].Width := 50;
      dbgrdBBCK.Columns[7].Title.caption := '借贷方向';
      dbgrdBBCK.Columns[7].Width := 60;
    end
    else if(tvBBCKMenu.Selected.Text = '估值表查看') then
    begin
      lblBCKTitle.Caption := '估值表查看';

      SQL.Add('select tgz_kmdm,tgz_kmmc,tgz_sl,tgz_dwcb,tgz_zcb,'+
      'tgz_cbzjz,tgz_sj,tgz_zsz,tgz_szzjz,tgz_gzzz ' +
      'from tgz where tgz_ywrq=:a order by tgz_kmdm');

      Parameters.ParamByName('a').Value := FormatDatetime('YYYY/MM/DD', dtpBBCKYWRQ.DateTime);
      Open;

      // 也可以在 查询语句中设置 别名的方式达到改行名的效果
//       设置表头
      dbgrdBBCK.Columns[0].Title.caption := '科目代码';
      dbgrdBBCK.Columns[0].Width := 100;
      dbgrdBBCK.Columns[1].Title.caption := '科目名称';
      dbgrdBBCK.Columns[1].Width := 120;
      dbgrdBBCK.Columns[2].Title.caption := '数量';
      dbgrdBBCK.Columns[2].Width := 75;
      dbgrdBBCK.Columns[3].Title.caption := '单位成本';
      dbgrdBBCK.Columns[3].Width := 75;
      dbgrdBBCK.Columns[4].Title.caption := '总成本';
      dbgrdBBCK.Columns[4].Width := 100;
      dbgrdBBCK.Columns[5].Title.caption := '成本占净值';
      dbgrdBBCK.Columns[5].Width := 75;
      dbgrdBBCK.Columns[6].Title.caption := '市价';
      dbgrdBBCK.Columns[6].Width := 75;
      dbgrdBBCK.Columns[7].Title.caption := '总市值';
      dbgrdBBCK.Columns[7].Width := 100;
      dbgrdBBCK.Columns[8].Title.caption := '市值占净值';
      dbgrdBBCK.Columns[8].Width := 120;
      dbgrdBBCK.Columns[9].Title.caption := '估值增值';
      dbgrdBBCK.Columns[9].Width := 120;
    end
    else
    begin
      lblBCKTitle.Caption := '会计科目余额表查看';

      SQL.Add('select tkjkmye_kmdm,tkjkmye_kmmc,tkjkmye_jdfx,tkjkmye_jffsje,'+
      'tkjkmye_dffsje,tkjkmye_ye from tkjkmye where tkjkmye_ywrq=:a order by tkjkmye_kmdm');

      Parameters.ParamByName('a').Value := FormatDatetime('YYYY/MM/DD', dtpBBCKYWRQ.DateTime);
      Open;

      // 也可以在 查询语句中设置 别名的方式达到改行名的效果
//       设置表头
      dbgrdBBCK.Columns[0].Title.caption := '科目代码';
      dbgrdBBCK.Columns[0].Width := 120;
      dbgrdBBCK.Columns[1].Title.caption := '科目名称';
      dbgrdBBCK.Columns[1].Width := 220;
      dbgrdBBCK.Columns[2].Title.caption := '借贷方向';
      dbgrdBBCK.Columns[2].Width := 75;
      dbgrdBBCK.Columns[3].Title.caption := '借方发生金额';
      dbgrdBBCK.Columns[3].Width := 150;
      dbgrdBBCK.Columns[4].Title.caption := '贷方发生金额';
      dbgrdBBCK.Columns[4].Width := 150;
      dbgrdBBCK.Columns[5].Title.caption := '余额';
      dbgrdBBCK.Columns[5].Width := 150;

//      ShowScrollBar(dbgrdBBCK.Handle, SB_HORZ, False); //隐藏横向滚动条
    end;
  end;

end;

// 输入限制
procedure TMainForm.EditNumberKeyPress(Sender: TObject; var Key: Char);
var c: Integer;  
begin  
  if key='.' then  
  begin  
    for c:=1 to length(TEdit(Sender).text) do
    begin
      if Tedit(Sender).text[c]='.' then key:=#0;
    end;
  end
  else
    if key=#13 then PerForm(WM_NEXTDLGCTL,0,0)
    else
        if key=#8 then key:=#8
        else
          if (key<'0') or (key>'9') then
            key:=#0;
end;

// 如果输入的为空 那么就替换为 0
procedure TMainForm.EditBumberLeave(Sender: TObject);
begin
  if Trim(TEdit(Sender).text) = '' then  TEdit(Sender).text := '0';
end;


// 鼠标滚轮滚动事件
procedure TMainForm.OnMouseWheel(Var Msg : TMsg; Var Handled : Boolean);
begin
  try //注意，这里使用容错处理的目的是屏蔽可能引起的错误
  if (Msg.message = WM_MouseWheel)
      and (Screen.ActiveForm.ActiveControl.ClassName='TDBGrid')
      {or (Screen.ActiveForm.ActiveControl.ClassName='TDBGridInplaceEdit')}
      then
  begin
    if Msg.wParam > 0 then
      SendMessage(Screen.ActiveForm.ActiveControl.Handle,
      WM_VSCROLL,
      SB_LINEUP, //SB_PAGEUP按页上滚，SB_LINEUP按行上滚
      0)
    else
      SendMessage(Screen.ActiveForm.ActiveControl.Handle,
      WM_VSCROLL,
      SB_LINEDOWN, //SB_PAGEDOWN按页下滚，SB_LINEDOWN按行下滚
      0);
    Handled:= True;
  end;
  except
  end;
end;
end.















