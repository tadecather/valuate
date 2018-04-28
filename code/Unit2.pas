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


    // ������������
    procedure EditNumberKeyPress(Sender: TObject; var Key: Char);
    procedure EditBumberLeave(Sender: TObject);

    // DBGrid �������¼�
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
// ��ʼ�������ʱ�򣬲�ѯ���е��û�
procedure TMainForm.UserRefreshButtonClick(Sender: TObject);
begin

  with UserADOQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select YH_BH,YH_MC from TYH order by yh_bh');
    Open;

    UserDBGrid.Columns[0].Title.caption := '�û�ID';
    UserDBGrid.Columns[0].Width := 100;
    UserDBGrid.Columns[1].Title.caption := '�û�����';
    UserDBGrid.Columns[1].Width := 100;
    // ȥ��������
    ShowSCrollBar(UserDBGrid.Handle, SB_VERT, False);

  end;
  UserDBGrid.Visible:=True;
end;

// ��ʼ�������ʱ�򣬽��еĲ���
procedure TMainForm.FormCreate(Sender: TObject);
Var SystemTime,ExitTime,lineStr,FilePath: String;
    configFile : TextFile;
    txtLines:TStringList;
begin
  // �������ݿ�����
  conMainForm.Close;
  conMainForm.ConnectionString := LoginForm.qryLoginForm.ConnectionString;
  conMainForm.Open;
//  SubMenuSysM.Items.Item[1].Selected := True;
  //MainForm.SubMenuSysM.FullExpand;
  MainForm.SubMenuSysM.Items.Item[0].Selected:=True;
  MainForm.UserRefreshButtonClick(Sender);
  MainForm.PageControl1.ActivePage:=SysManageTab;

  Application.OnMessage := OnMouseWheel;

  // �������ļ��ж�ȡ ��һ���˳�ʱ��¼��ʱ��
  FilePath := 'config/system.cfg';
  if  FileExists(FilePath) then
  begin
    AssignFile(configFile, FilePath);
    // ֻ����ʽ���ļ�
    Reset(configFile);
    // ����ÿ�еķָ����
    txtLines := TStringList.Create;
    txtLines.Delimiter := '=';
    while Not EOF(configFile) do
    begin
      // ��ȡһ��
      Readln(configFile, lineStr);
      // ʹ�� = ���зָ�
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


procedure TMainForm.FormClose(Sender: TObject;var Action: TCloseAction);
Var FilePath , P1: String;
    configFile : TextFile;
begin
  P1 := '# This File is used For System Time Setting';
  FilePath := 'config/system.cfg';
  AssignFile(configFile, FilePath);
  ReWrite(configFile);
  WriteLn(configFile,p1);
  p1 := 'SYSTEM_TIME = ' + FormatDatetime('YYYY/MM/DD', MainForm.dtpMainForm.DateTime);
  WriteLn(configFile,p1);
  P1 := 'EXIT_LOCALTIME = ' + FormatDatetime('YYYY/MM/DD', Now());
  WriteLn(configFile,p1);
  CloseFile(configFile);
  Application.Terminate;
end;


// �ı�ѡ�е���ɫ
procedure TMainForm.SubMenuSysMCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
    if (cdsSelected in State) then
   begin
      with Sender.Canvas do
        Font.Color :=clRed;
   end;
end;


// �û���������TreeView �ı仯����ķ�Ӧ
procedure TMainForm.SubMenuSysMOnChange(Sender: TObject);
begin
  if (MainForm.SubMenuSysM.Selected.Text='����û�') then

    MainForm.UserRefreshButtonClick(Sender)
  else if(MainForm.SubMenuSysM.Selected.Text='�ر�ϵͳ') then
  begin
    if Application.MessageBox('ȷ���˳�ϵͳ��','��ʾ',MB_YESNO)=ID_Yes then
    begin
      Application.Terminate;
    end;
  end
  else if(MainForm.SubMenuSysM.Selected.Text='�л��û�') then
  begin
    if Application.MessageBox('ȷ���л�ϵͳ��','��ʾ',MB_YESNO)=ID_Yes then
    begin
       Application.Terminate;
       Winexec('project1.exe', sw_show);
    end;

  end;
end;

// ��ѯ�û�ͨ������
procedure TMainForm.UerSearchButtonClick(Sender: TObject);
begin
  with UserADOQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select YH_BH,YH_MC from TYH where YH_MC=:a');
    Parameters.ParamByName('a').Value:=MainForm.UserSearchEdit.Text;
    Open;

    UserDBGrid.Columns[0].Title.caption := '�û�ID';
    UserDBGrid.Columns[0].Width := 100;
    UserDBGrid.Columns[1].Title.caption := '�û�����';
    UserDBGrid.Columns[1].Width := 100;
  end;
end;



//DBGrid �Ҽ��˵�����
// ɾ��
procedure TMainForm.UserDBGDelClick(Sender: TObject);
begin
  // �����û������û����볤��
  UserForm.UserFormUserNameEdit.MaxLength := 20;
  UserForm.UserFormPasswdEdit1.MaxLength := 20;
  UserForm.UserFormPasswdEdit2.MaxLength := 20;
  
  UserForm.Caption:='ɾ���û�';
  UserForm.UserFormUserNameLabel.Caption := '�û���';
  UserForm.UserFormPasswdLabel1.Caption:='���룺';
  UserForm.UserFormUserNameEdit.Text:=UserDBGrid.Fields[1].Text;
  UserForm.UserFormPasswdEdit1.Text:='';
  UserForm.UserFormPasswdLabel2.Visible:=False;
  UserForm.UserFormPasswdEdit2.Visible:=False;
  UserForm.UserFormSureButton.Visible:=True;
  UserForm.UserFormCancleButton.Caption:='ȡ��';
  //MainForm.Visible:=False;
  UserForm.Show;
end;

// �Ҽ���������
procedure TMainForm.UserDBGChangePasswdClick(Sender: TObject);
begin
  // �����û������û����볤��
  UserForm.UserFormUserNameEdit.MaxLength := 20;
  UserForm.UserFormPasswdEdit1.MaxLength := 20;
  UserForm.UserFormPasswdEdit2.MaxLength := 20;

  UserForm.Caption:='�޸�����';
  UserForm.UserFormPasswdLabel2.Visible:=True;
  UserForm.UserFormPasswdEdit2.Visible:=True;
  UserForm.UserFormUserNameEdit.Text:=UserDBGrid.Fields[1].Text;
  UserForm.UserFormPasswdEdit1.Text:='';
  UserForm.UserFormPasswdEdit2.Text:='';
  UserForm.UserFormUserNameLabel.Caption := '�û���';
  UserForm.UserFormPasswdLabel1.Caption:='�����룺';
  UserForm.UserFormPasswdLabel2.Caption:='�����룺';
  UserForm.UserFormSureButton.Visible:=True;
  UserForm.UserFormCancleButton.Caption:='ȡ��';
  //MainForm.Visible:=False;
  UserForm.Show;
end;

// �鿴�û���Ϣ
procedure TMainForm.UserScanButtonClick(Sender: TObject);
begin
  UserForm.Caption:='�鿴�û�';
  UserForm.UserFormUserNameLabel.Caption := '�û���ţ�';
  UserForm.UserFormPasswdLabel1.Caption :='�û�����';
  UserForm.UserFormUserNameEdit.Text:=UserDBGrid.Fields[0].Text;
  UserForm.UserFormPasswdEdit1.Text:=UserDBGrid.Fields[1].Text;
  UserForm.UserFormUserNameEdit.ReadOnly := True;
  UserForm.UserFormPasswdEdit1.ReadOnly := True;

  // �����¼�ǹ���Ա����ô�Ϳ��Բ鿴�û������룬�����ܲ鿴
  if (lblLoginUserName.Caption = 'admin') or ( lblLoginUserName.Caption = 'ADMIN') then
  begin
    UserForm.UserFormPasswdLabel2.caption := '���룺';
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
  UserForm.UserFormCancleButton.Caption:='ȷ��';
  //MainForm.Visible:=False;
  UserForm.Show;
end;

// ͨ��������������û�
procedure TMainForm.UserAddButtonClick(Sender: TObject);
begin
  // �����û������û����볤��
  UserForm.UserFormUserNameEdit.MaxLength := 20;
  UserForm.UserFormPasswdEdit1.MaxLength := 20;
  UserForm.UserFormPasswdEdit2.MaxLength := 20;

  UserForm.Caption:='�����û�';
  UserForm.UserFormUserNameLabel.Caption := '�û�����';
  UserForm.UserFormPasswdLabel1.Caption :='���룺';
  UserForm.UserFormPasswdLabel2.caption := 'ȷ�����룺';
  UserForm.UserFormPasswdLabel2.Visible:=True;
  UserForm.UserFormPasswdEdit2.Visible:=True;
  UserForm.UserFormUserNameEdit.Text:='';
  UserForm.UserFormPasswdEdit1.Text:='';
  UserForm.UserFormPasswdEdit2.Text:='';
  UserForm.UserFormSureButton.Visible:=True;
  UserForm.UserFormCancleButton.Caption:='ȡ��';
  //MainForm.Visible:=False;
  UserForm.Show;
end;


//..............................................................................��������
//չʾ��������ʱ��ˢ������
procedure TMainForm.BasicSettingTabShow(Sender: TObject);
begin
  BasicSubMenuTreeView.Items.Item[0].Selected:=True;
//  with UserADOQuery do
//  begin
//    Close;
//    SQL.Clear;
//    SQL.Add('Select * from TJYFL');
//
//    Open;
//    db.TNumericField(UserADOQuery.FieldByName('TJYFL_JSF')).DisplayFormat := '0.0000000';
//    ChangedbgrXTSZTitle(Sender);
//  end;
  SelectAllBasicSetting(Sender, '���׷�������');
  BasicSettingDBGrid.Visible:= True;
end;

// ��ѯ��ť��ʱ��ˢ������
procedure TMainForm.BasicRefreshButtonClick(Sender: TObject);
begin
  BasicSubMenuOnClick(Sender);
end;

// ����༭��ť���������棬���з��ʵı༭
procedure TMainForm.BasicEditButtonClick(Sender: TObject);
begin
  if (BasicSettingDBGrid.Fields[0].Value = NULL) or (BasicSettingDBGrid.Fields[0].Value = '') then
    exit;
// �տ�ʼû�е��ѡ���֧��ʱ��Ĭ��ѡ���һ��
  if (BasicSubMenuTreeView.SelectionCount=0) then
    BasicSubMenuTreeView.Items.Item[0].Selected:=True;
  if (BasicSubMenuTreeView.Selected.Text='���׷�������') then
  begin
    JYFLForm1.show;
    JYFLForm1.Caption:='���׷��ʸ���';
    JYFLForm1.JYSCEdit.Text:=BasicSettingDBGrid.Fields[0].Value;
    JYFLForm1.JYLXEdit.Text:=BasicSettingDBGrid.Fields[1].Value;
    JYFLForm1.YHEdit.Text:=BasicSettingDBGrid.Fields[2].Text;
    JYFLForm1.JSEdit.Text:=BasicSettingDBGrid.Fields[3].Text;
    JYFLForm1.GHEdit.Text:=BasicSettingDBGrid.Fields[4].Text;
    JYFLForm1.ZGEdit.Text:=BasicSettingDBGrid.Fields[5].Text;
    JYFLForm1.YJEdit.Text:=BasicSettingDBGrid.Fields[6].Text;
    JYFLForm1.JYFLSureButton.Visible:=True;
    JYFLForm1.JYFLCancleButton.Caption:='ȡ��';

    JYFLForm1.YHEdit.Enabled := True;
    JYFLForm1.JSEdit.Enabled := True;
    JYFLForm1.GHEdit.Enabled := True;
    JYFLForm1.ZGEdit.Enabled := True;
    JYFLForm1.YJEdit.Enabled := True;

  end
  else if(BasicSubMenuTreeView.Selected.Text='������������')
       and (BasicSettingDBGrid.Fields[0].Text <> NULL)  then
  begin
    STLFForm1.show;
    STLFForm1.STLFFormKSRQDateTimePicker.Enabled := True;
    STLFForm1.STLFFormJSRQDateTimePicker.Enabled := True;
    STLFForm1.STLFFormBLJEEdit.Enabled := True;
    STLFForm1.STLFFormJTTSEdit.Enabled := True;
    //���ò�ͬ����ʾ,������ͬ
    if (BasicSettingDBGrid.Fields[0].Text='��Ʒ�') or (BasicSettingDBGrid.Fields[0].Text='��Ϣ��¶��') then
    begin
      STLFForm1.Caption:=Concat(BasicSettingDBGrid.Fields[0].Text, '�޸�');

      STLFForm1.STLFFormFYLXEdit.Text:=BasicSettingDBGrid.Fields[0].Text;
      STLFForm1.STLFFormKSRQDateTimePicker.DateTime:=BasicSettingDBGrid.Fields[1].AsDateTime;
      STLFForm1.STLFFormJSRQDateTimePicker.DateTime:=BasicSettingDBGrid.Fields[2].AsDateTime;
      STLFForm1.STLFFormBLJEEdit.Text:=BasicSettingDBGrid.Fields[4].Text;
      STLFForm1.STLFFormJTTSEdit.Text:=BasicSettingDBGrid.Fields[5].Text;

      // �ָ��鿴�������޸�
      STLFForm1.STLFFormBLJELabel.Caption:='�ܽ��';
      STLFForm1.STLFFormJTTSLabel.Visible:=True;
      STLFForm1.STLFFormJTTSEdit.Visible:=True;
      STLFForm1.STLFSureButton.Visible:=True;
      STLFForm1.STLFSureButton.Caption:='ȷ��';
      STLFForm1.STLFCancleButton.Caption:='ȡ��';
    end
    else
    begin
      STLFForm1.Caption:=Concat(BasicSettingDBGrid.Fields[0].Text, '�޸�');

      STLFForm1.STLFFormFYLXEdit.Text:=BasicSettingDBGrid.Fields[0].Text;
      STLFForm1.STLFFormKSRQDateTimePicker.DateTime:=BasicSettingDBGrid.Fields[1].AsDateTime;
      STLFForm1.STLFFormJSRQDateTimePicker.DateTime:=BasicSettingDBGrid.Fields[2].AsDateTime;
      STLFForm1.STLFFormBLJEEdit.Text:=BasicSettingDBGrid.Fields[3].Text;

      // �ָ��鿴�������޸�
      STLFForm1.STLFFormBLJELabel.Caption:='�������';
      STLFForm1.STLFFormJTTSLabel.Visible:=False;
      STLFForm1.STLFFormJTTSEdit.Visible:=False;
      STLFForm1.STLFSureButton.Visible:=True;
      STLFForm1.STLFCancleButton.Caption:='ȡ��';
    end;
  end
  else if(BasicSubMenuTreeView.Selected.Text='����·������') then
  begin
    JKLJForm1.show;
    JKLJForm1.Caption:='�޸Ľ���·��';
    JKLJForm1.JKLJFormJKBHEdit.Text:=BasicSettingDBGrid.Fields[1].Value;
    JKLJForm1.JKLJFormJKMCEdit.Text:=BasicSettingDBGrid.Fields[0].Value;
    JKLJForm1.JKLJFormWJMCEdit.Text:=BasicSettingDBGrid.Fields[3].Value;
    if (BasicSettingDBGrid.Fields[2].Value <> Null) then
      JKLJForm1.JKLJFormWJLJEdit.Text:=BasicSettingDBGrid.Fields[2].Value;

    // �ָ����鿴ʱ����ȡ����ť�� caption Ϊȷ��������ȷ����ť
    JKLJForm1.JKLJFormWJLJChooseButton.Visible:=True;
    JKLJForm1.JKLJSureButton.Visible:=True;
    JKLJForm1.JKLJCancleButton.Caption:='ȡ��';

    JKLJForm1.JKLJFormJKMCEdit.Enabled := True;
    JKLJForm1.JKLJFormWJMCEdit.Enabled := True;
    JKLJForm1.JKLJFormWJLJEdit.Enabled := True;
  end
  else if(BasicSubMenuTreeView.Selected.Text='֤ȯ��Ϣ����') then
  begin
    if (BasicSettingDBGrid.Fields[2].Value='��Ʊ') then
    begin
      ZQXXGPForm1.Show;
      ZQXXGPForm1.Caption:='֤ȯ��Ϣ��Ʊ-�޸�';
      ZQXXGPForm1.ZQXXGPZQDMEdit.Text:=BasicSettingDBGrid.Fields[0].Value;
      ZQXXGPForm1.ZQXXGPJYSCEdit.Text:=BasicSettingDBGrid.Fields[1].Value;
      ZQXXGPForm1.ZQXXGPZQMCEdit.Text:=BasicSettingDBGrid.Fields[3].Value;
      ZQXXGPForm1.dtpZQXXGPFXRQ.DateTime:=BasicSettingDBGrid.Fields[6].AsDateTime;
      ZQXXGPForm1.ZQXXGPZGBEdit.Text:=BasicSettingDBGrid.Fields[4].Text;
      ZQXXGPForm1.ZQXXGPMGMZEdit.Text:=BasicSettingDBGrid.Fields[5].Text;

      //�޸ı��ı������
      ZQXXGPForm1.ZQXXGPSureButton.Visible:=True;
      ZQXXGPForm1.ZQXXGPCancleButton.Caption:='ȡ��';

      // ���ò��ɸ���
      ZQXXGPForm1.ZQXXGPZQLXComboBox.Enabled := False;
      ZQXXGPForm1.ZQXXGPZQDMEdit.Enabled := False;
      ZQXXGPForm1.ZQXXGPJYSCEdit.Enabled := False;
      ZQXXGPForm1.ZQXXGPZQMCEdit.Enabled := True;
      ZQXXGPForm1.dtpZQXXGPFXRQ.Enabled := True;
      ZQXXGPForm1.ZQXXGPZGBEdit.Enabled := True;
      ZQXXGPForm1.ZQXXGPMGMZEdit.Enabled := True;
    end
    // TODO ֤ȯ��Ϣ�Ĳ�ͬ������ͬ�Ĵ���
    else if (BasicSettingDBGrid.Fields[2].Value='ծȯ') then
    begin
      ZQXXZQForm1.Show;
      ZQXXZQForm1.Caption:='֤ȯ��Ϣծȯ-�޸�';
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

      //�޸ı��ı������
      ZQXXZQForm1.ZQXXZQSureButton.Visible:=True;
      ZQXXZQForm1.ZQXXZQCancleButton.Caption:='ȡ��';

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
    else if (BasicSettingDBGrid.Fields[2].Value='�ع�') then
    begin
      ZQXXHGForm1.Show;
      ZQXXHGForm1.Caption:='֤ȯ��Ϣ�ع�-�޸�';
      ZQXXHGForm1.ZQXXHGZQDMEdit.Text:=BasicSettingDBGrid.Fields[0].Value;
      ZQXXHGForm1.ZQXXHGJYSCEdit.Text:=BasicSettingDBGrid.Fields[1].Value;
      ZQXXHGForm1.ZQXXHGZQMCEdit.Text:=BasicSettingDBGrid.Fields[3].Value;
      ZQXXHGForm1.dtpZQXXHGFXRQ.DateTime:=BasicSettingDBGrid.Fields[6].AsDateTime;
      if (BasicSettingDBGrid.Fields[11].Value <> NULL) then
        ZQXXHGForm1.ZQXXHGHGTSEdit.Text:=BasicSettingDBGrid.Fields[11].Value;

      //�޸ı��ı������
      ZQXXHGForm1.ZQXXHGSureButton.Visible:=True;
      ZQXXHGForm1.ZQXXHGCancleButton.Caption:='ȡ��';

      ZQXXHGForm1.ZQXXHGZQLXComboBox.Enabled := False;
      ZQXXHGForm1.ZQXXHGZQDMEdit.Enabled := False;
      ZQXXHGForm1.ZQXXHGJYSCEdit.Enabled := False;
      ZQXXHGForm1.ZQXXHGZQMCEdit.Enabled := False;
      ZQXXHGForm1.dtpZQXXHGFXRQ.Enabled := False;
      ZQXXHGForm1.ZQXXHGHGTSEdit.Enabled := False;
    end
    else
      showMessage('��ʱ�������޸ģ�');
  end
  else if(BasicSubMenuTreeView.Selected.Text='��ƿ�Ŀ����') then
  begin
    if (BasicSettingDBGrid.Fields[0].Value <> NULL) then
    begin
      KJKMForm1.show;
      KJKMForm1.Caption:='��ƿ�Ŀ-�༭';

      KJKMForm1.KJKMKMDMEdit.Text:=BasicSettingDBGrid.Fields[0].Value;
      KJKMForm1.KJKMKMMCEdit.Text:=BasicSettingDBGrid.Fields[1].Value;
      KJKMForm1.cbbKJKMJDFX.Text:=BasicSettingDBGrid.Fields[2].Value;

      KJKMForm1.KJKMSureButton.Visible:=True;
      KJKMForm1.KJKMCancleButton.Caption:='ȡ��';

      KJKMForm1.KJKMKMDMEdit.Enabled := False;
      KJKMForm1.KJKMKMMCEdit.Enabled := True;
      KJKMForm1.cbbKJKMJDFX.Enabled := True;
    end;

  end;
end;


// ѡ��� TreeView ��ͬʱ�����еĲ�����ͬ
procedure TMainForm.BasicScanButtonClick(Sender: TObject);
begin
  if (BasicSettingDBGrid.Fields[0].Value = NULL) or (BasicSettingDBGrid.Fields[0].Value = '') then
    exit;
  // �տ�ʼû�е��ѡ���֧��ʱ��Ĭ��ѡ���һ��
  if (BasicSubMenuTreeView.SelectionCount=0) then
    BasicSubMenuTreeView.Items.Item[0].Selected:=True;
  if (BasicSubMenuTreeView.Selected.Text='���׷�������') then
  begin
    JYFLForm1.show;
    JYFLForm1.Caption:='���׷��ʲ鿴';

    JYFLForm1.JYSCEdit.Text:=BasicSettingDBGrid.Fields[0].Value;
    JYFLForm1.JYLXEdit.Text:=BasicSettingDBGrid.Fields[1].Value;
    JYFLForm1.YHEdit.Text:=BasicSettingDBGrid.Fields[2].Text;
    JYFLForm1.JSEdit.Text:=BasicSettingDBGrid.Fields[3].Text;
    JYFLForm1.GHEdit.Text:=BasicSettingDBGrid.Fields[4].Text;
    JYFLForm1.ZGEdit.Text:=BasicSettingDBGrid.Fields[5].Text;
    JYFLForm1.YJEdit.Text:=BasicSettingDBGrid.Fields[6].Text;

    JYFLForm1.JYFLSureButton.Visible:=False;
    JYFLForm1.JYFLCancleButton.Caption:='ȷ��';

    JYFLForm1.YHEdit.Enabled := False;
    JYFLForm1.JSEdit.Enabled := False;
    JYFLForm1.GHEdit.Enabled := False;
    JYFLForm1.ZGEdit.Enabled := False;
    JYFLForm1.YJEdit.Enabled := False;
  end
  else if(BasicSubMenuTreeView.Selected.Text='������������')
          and (BasicSettingDBGrid.Fields[0].Text <> NULL) then
  begin
    STLFForm1.show;
    STLFForm1.STLFFormKSRQDateTimePicker.Enabled := False;
    STLFForm1.STLFFormJSRQDateTimePicker.Enabled := False;
    STLFForm1.STLFFormBLJEEdit.Enabled := False;
    STLFForm1.STLFFormJTTSEdit.Enabled := False;
    if (BasicSettingDBGrid.Fields[0].Text='��Ʒ�') or (BasicSettingDBGrid.Fields[0].Text='��Ϣ��¶��') then
    begin
      STLFForm1.Caption:=Concat(BasicSettingDBGrid.Fields[0].Text, '�鿴');
      STLFForm1.STLFFormBLJELabel.Caption:='�ܽ��';
      STLFForm1.STLFFormFYLXEdit.Text:=BasicSettingDBGrid.Fields[0].Text;
      STLFForm1.STLFFormKSRQDateTimePicker.DateTime:=BasicSettingDBGrid.Fields[1].AsDateTime;
      STLFForm1.STLFFormJSRQDateTimePicker.DateTime:=BasicSettingDBGrid.Fields[2].AsDateTime;
      STLFForm1.STLFFormBLJEEdit.Text:=BasicSettingDBGrid.Fields[4].Text;
      STLFForm1.STLFFormJTTSEdit.Text:=BasicSettingDBGrid.Fields[5].Text;
      //�ָ��鿴�������޸�
      STLFForm1.STLFFormJTTSLabel.Visible:=True;
      STLFForm1.STLFFormJTTSEdit.Visible:=True;
      STLFForm1.STLFSureButton.Visible:=False;
      STLFForm1.STLFCancleButton.Caption:='ȷ��';
    end
    else
    begin
      STLFForm1.Caption:=Concat(BasicSettingDBGrid.Fields[0].Text, '�鿴');
      STLFForm1.STLFFormBLJELabel.Caption:='�������';
      STLFForm1.STLFFormFYLXEdit.Text:=BasicSettingDBGrid.Fields[0].Text;
      STLFForm1.STLFFormKSRQDateTimePicker.DateTime:=BasicSettingDBGrid.Fields[1].AsDateTime;
      STLFForm1.STLFFormJSRQDateTimePicker.DateTime:=BasicSettingDBGrid.Fields[2].AsDateTime;
      STLFForm1.STLFFormBLJEEdit.Text:=BasicSettingDBGrid.Fields[3].Text;
      //�ָ��鿴�������޸�
      STLFForm1.STLFFormJTTSLabel.Visible:=False;
      STLFForm1.STLFFormJTTSEdit.Visible:=False;
      STLFForm1.STLFSureButton.Visible:=False;
      STLFForm1.STLFCancleButton.Caption:='ȷ��';
    end;
  end
  else if(BasicSubMenuTreeView.Selected.Text='����·������') then
  begin
    JKLJForm1.show;
    JKLJForm1.Caption:='�鿴����·��';
    JKLJForm1.JKLJFormJKBHEdit.Text:=BasicSettingDBGrid.Fields[1].Value;
    JKLJForm1.JKLJFormJKMCEdit.Text:=BasicSettingDBGrid.Fields[0].Value;
    JKLJForm1.JKLJFormWJMCEdit.Text:=BasicSettingDBGrid.Fields[3].Value;
    if (BasicSettingDBGrid.Fields[2].Value<>Null) then
      JKLJForm1.JKLJFormWJLJEdit.Text:=BasicSettingDBGrid.Fields[2].Value;

    // �鿴ʱ���Ľ����޸�
    JKLJForm1.JKLJFormWJLJChooseButton.Visible:=False;
    JKLJForm1.JKLJSureButton.Visible:=False;
    JKLJForm1.JKLJCancleButton.Caption:='ȷ��';

    JKLJForm1.JKLJFormJKMCEdit.Enabled := False;
    JKLJForm1.JKLJFormWJMCEdit.Enabled := False;
    JKLJForm1.JKLJFormWJLJEdit.Enabled := False;
  end
  else if(BasicSubMenuTreeView.Selected.Text='֤ȯ��Ϣ����') then
  begin
    if (BasicSettingDBGrid.Fields[2].Value='��Ʊ') then
    begin
      ZQXXGPForm1.Show;
      ZQXXGPForm1.Caption:='֤ȯ��Ϣ��Ʊ-�鿴';
      ZQXXGPForm1.ZQXXGPZQDMEdit.Text:=BasicSettingDBGrid.Fields[0].Value;
      ZQXXGPForm1.ZQXXGPJYSCEdit.Text:=BasicSettingDBGrid.Fields[1].Value;
      ZQXXGPForm1.ZQXXGPZQMCEdit.Text:=BasicSettingDBGrid.Fields[3].Value;
      ZQXXGPForm1.dtpZQXXGPFXRQ.DateTime:=BasicSettingDBGrid.Fields[6].AsDateTime;
      ZQXXGPForm1.ZQXXGPZGBEdit.Text:=BasicSettingDBGrid.Fields[4].Text;
      ZQXXGPForm1.ZQXXGPMGMZEdit.Text:=BasicSettingDBGrid.Fields[5].Text;

      //�޸ı��ı������
      ZQXXGPForm1.ZQXXGPSureButton.Visible:=False;
      ZQXXGPForm1.ZQXXGPCancleButton.Caption:='ȷ��';

      // ���� �����޸�
      ZQXXGPForm1.ZQXXGPZQLXComboBox.Enabled := False;
      ZQXXGPForm1.ZQXXGPZQDMEdit.Enabled := False;
      ZQXXGPForm1.ZQXXGPJYSCEdit.Enabled := False;
      ZQXXGPForm1.ZQXXGPZQMCEdit.Enabled := False;
      ZQXXGPForm1.dtpZQXXGPFXRQ.Enabled := False;
      ZQXXGPForm1.ZQXXGPZGBEdit.Enabled := False;
      ZQXXGPForm1.ZQXXGPMGMZEdit.Enabled := False;

    end
    // TODO �E��֤ȯ��Ϣ�Ĳ�ͬ������ͬ�Ĵ���
    else if (BasicSettingDBGrid.Fields[2].Value='ծȯ') then
    begin
      ZQXXZQForm1.Show;
      ZQXXZQForm1.Caption:='֤ȯ��Ϣծȯ-�鿴';
      ZQXXZQForm1.ZQXXZQZQDMEdit.Text:=BasicSettingDBGrid.Fields[0].Value;
      ZQXXZQForm1.ZQXXZQJYSCEdit.Text:=BasicSettingDBGrid.Fields[1].Value;
      ZQXXZQForm1.ZQXXZQZQMCEdit.Text:=BasicSettingDBGrid.Fields[3].Value;
      ZQXXZQForm1.ZQXXZQMGMZEdit.Text:=BasicSettingDBGrid.Fields[5].Value;
      ZQXXZQForm1.ZQXXZQKSRQDate.DateTime:=BasicSettingDBGrid.Fields[6].AsDateTime;
      // �������ڣ�����ѡ�õڶ������ڶ�����������ѡ���һ��
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


      //�޸ı��ı������
      ZQXXZQForm1.ZQXXZQSureButton.Visible:=False;
      ZQXXZQForm1.ZQXXZQCancleButton.Caption:='ȷ��';

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
    else if (BasicSettingDBGrid.Fields[2].Value='�ع�') then
    begin
      ZQXXHGForm1.Show;
      ZQXXHGForm1.Caption:='֤ȯ��Ϣ�ع�-�鿴';
      ZQXXHGForm1.ZQXXHGZQDMEdit.Text:=BasicSettingDBGrid.Fields[0].Value;
      ZQXXHGForm1.ZQXXHGJYSCEdit.Text:=BasicSettingDBGrid.Fields[1].Value;
      ZQXXHGForm1.ZQXXHGZQMCEdit.Text:=BasicSettingDBGrid.Fields[3].Value;
      ZQXXHGForm1.dtpZQXXHGFXRQ.DateTime:=BasicSettingDBGrid.Fields[6].AsDateTime;
      if (BasicSettingDBGrid.Fields[11].Value <> NULL) then
        ZQXXHGForm1.ZQXXHGHGTSEdit.Text:=BasicSettingDBGrid.Fields[11].Value;

      //�޸ı��ı������
      ZQXXHGForm1.ZQXXHGSureButton.Visible:=False;
      ZQXXHGForm1.ZQXXHGCancleButton.Caption:='ȷ��';

      ZQXXHGForm1.ZQXXHGZQLXComboBox.Enabled := False;
      ZQXXHGForm1.ZQXXHGZQDMEdit.Enabled := False;
      ZQXXHGForm1.ZQXXHGJYSCEdit.Enabled := False;
      ZQXXHGForm1.ZQXXHGZQMCEdit.Enabled := True;
      ZQXXHGForm1.dtpZQXXHGFXRQ.Enabled := True;
      ZQXXHGForm1.ZQXXHGHGTSEdit.Enabled := True;
    end
    else
      showMessage('��ʱ�����Բ鿴��');
  end
  else if(BasicSubMenuTreeView.Selected.Text='��ƿ�Ŀ����') then
  begin

    if (BasicSettingDBGrid.Fields[0].Value <> NULL) then
    begin
      KJKMForm1.show;
      KJKMForm1.Caption:='��ƿ�Ŀ-�鿴';

      KJKMForm1.KJKMKMDMEdit.Text:=BasicSettingDBGrid.Fields[0].Value;
      KJKMForm1.KJKMKMMCEdit.Text:=BasicSettingDBGrid.Fields[1].Value;
      KJKMForm1.cbbKJKMJDFX.Text:=BasicSettingDBGrid.Fields[2].Value;

      KJKMForm1.KJKMSureButton.Visible:=False;
      KJKMForm1.KJKMCancleButton.Caption:='ȷ��';

      KJKMForm1.KJKMKMDMEdit.Enabled := False;
      KJKMForm1.KJKMKMMCEdit.Enabled := False;
      KJKMForm1.cbbKJKMJDFX.Enabled := False;
    end;

  end;
end;


procedure TMainForm.BasicAddButtonClick(Sender: TObject);
begin
// ���Ӱ�ť�����ã�Ĭ��Ϊ��Ʊ����ѡ���������仯ʱ���򿪱�Ĵ���
  if (BasicSubMenuTreeView.Selected.Text='֤ȯ��Ϣ����') then
  begin
    ZQXXGPForm1.Show;
    ZQXXGPForm1.Caption:='֤ȯ��Ϣ����';
    //��ձ༭�������
    ZQXXGPForm1.ZQXXGPZQDMEdit.Text:='';
    ZQXXGPForm1.ZQXXGPJYSCEdit.Text:='';
    ZQXXGPForm1.ZQXXGPZGBEdit.Text:='0.0';
    ZQXXGPForm1.ZQXXGPMGMZEdit.Text:='0.0';
    ZQXXGPForm1.ZQXXGPZQMCEdit.Text:='';
    ZQXXGPForm1.dtpZQXXGPFXRQ.DateTime:=dtpMainForm.DateTime;

    // ����Ϊ���޸�
    ZQXXGPForm1.ZQXXGPZQLXComboBox.Enabled := True;
    ZQXXGPForm1.ZQXXGPZQDMEdit.Enabled := True;
    ZQXXGPForm1.ZQXXGPJYSCEdit.Enabled := True;
    ZQXXGPForm1.ZQXXGPZQMCEdit.Enabled := True;
    ZQXXGPForm1.dtpZQXXGPFXRQ.Enabled := True;
    ZQXXGPForm1.ZQXXGPZGBEdit.Enabled := True;
    ZQXXGPForm1.ZQXXGPMGMZEdit.Enabled := True;
  end
// ���ѡ����� ��ƿ�Ŀ���õ�ʱ������
  else
  begin
    KJKMForm1.show;
    KJKMForm1.Caption:='��ƿ�Ŀ-����';

    KJKMForm1.KJKMKMDMEdit.Text:='';
    KJKMForm1.KJKMKMMCEdit.Text:='';
    KJKMForm1.cbbKJKMJDFX.Text:='';

    KJKMForm1.KJKMKMDMEdit.Enabled := True;
    KJKMForm1.KJKMKMMCEdit.Enabled := True;
    KJKMForm1.cbbKJKMJDFX.Enabled := True;
  end;
end;


// ������ť�����ã����ݲ�ͬ���Ӳ˵�ѡ�У����Խ��еĻ��ͬ
procedure TMainForm.BasicSearchButtonClick(Sender: TObject);
begin

  with UserADOQuery do
  begin
    Close;
    SQL.Clear;
    if (BasicSubMenuTreeView.Selected.Text='���׷�������') then
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
    else if (BasicSubMenuTreeView.Selected.Text='֤ȯ��Ϣ����') then
    begin
      SQL.Add('Select * from TZQXX where TZQXX_ZQDM=:a');
      Parameters.ParamByName('a').Value:=BasicSearchEdit.Text;
      Open;
    end
    else if (BasicSubMenuTreeView.Selected.Text='��ƿ�Ŀ����') then
    begin
      SQL.Add('Select * from TKJKM where TKJKM_KMDM=:a');
      Parameters.ParamByName('a').Value:=BasicSearchEdit.Text;
      Open;
    end
    else
    begin
      SQL.Add('Select * from JYFL where SCMC=:a');//TODO �ݲ�ʵ��
      Parameters.ParamByName('a').Value:=BasicSearchEdit.Text;
      Open;
    end;

    ChangedbgrXTSZTitle(Sender);
  end;
end;

// ��������TreeMenu ����������¼�
procedure TMainForm.BasicSubMenuOnClick(Sender: TObject);
begin
  MainForm.SelectAllBasicSetting(Sender, BasicSubMenuTreeView.Selected.Text);
  // ʹ ���� ��ť��֤ȯ����ComboBox����
  if (BasicSubMenuTreeView.Selected.Text='֤ȯ��Ϣ����') then
  begin
    BasicAddButton.Visible:=True;
    BasicZQLXComboBox.Visible:=True;
    BasicSearchEdit.Hint:='����֤ȯ��������';
    //��ʾ��������������ť
    BasicSearchEdit.Visible:=True;
    BasicSearchButton.Visible:=True;
    // �����Ҽ��˵���ɾ����ť�Ŀɼ���
    BasicDBGDeleteButton.Visible:=True;
  end
  else if(BasicSubMenuTreeView.Selected.Text='��ƿ�Ŀ����') then
  begin
    BasicAddButton.Visible:=True;
    BasicZQLXComboBox.Visible:=False;
    BasicSearchEdit.Hint:='���տ�Ŀ��������';
    //��ʾ��������������ť
    BasicSearchEdit.Visible:=True;
    BasicSearchButton.Visible:=True;
    // �����Ҽ��˵���ɾ����ť�Ŀɼ���
    BasicDBGDeleteButton.Visible:=True;
  end
  else
  begin
    BasicAddButton.Visible:=False;
    BasicZQLXComboBox.Visible:=False;
    //������������������ť
    BasicSearchEdit.Visible:=False;
    BasicSearchButton.Visible:=False;
    // �����Ҽ��˵���ɾ����ť�Ŀɼ���
    BasicDBGDeleteButton.Visible:=False;
  end;
end;

// ������ѡ�������͵Ļ�����Ϣ
procedure TMainForm.SelectAllBasicSetting(Sender:TObject;Szkm: String);
begin
  with UserADOQuery do
  begin
    Close;
    SQL.Clear;
    if ( Szkm='���׷�������') then
    begin
      SQL.Add('select * from TJYFL');
      Open;
      db.TNumericField(UserADOQuery.FieldByName('TJYFL_YHS')).DisplayFormat := '0.00000000';
      db.TNumericField(UserADOQuery.FieldByName('TJYFL_JSF')).DisplayFormat := '0.00000000';
      db.TNumericField(UserADOQuery.FieldByName('TJYFL_GHF')).DisplayFormat := '0.00000000';
      db.TNumericField(UserADOQuery.FieldByName('TJYFL_ZGF')).DisplayFormat := '0.00000000';
      db.TNumericField(UserADOQuery.FieldByName('TJYFL_YJ')).DisplayFormat := '0.00000000';
    end
    else if(Szkm='������������') then
    begin
      SQL.Add('select * from TSTLF');
      Open;
    end
    else if(Szkm='����·������') then
    begin
      SQL.Add('select * from TJSLJ');
      Open;
    end
    else if(Szkm='֤ȯ��Ϣ����') then
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
   // ���ú�����������
   ChangedbgrXTSZTitle(Sender);
end;

procedure TMainForm.ChangedbgrXTSZTitle(Sender:Tobject);
begin
  if ( BasicSubMenuTreeView.Selected.Text ='���׷�������') then
  begin
    with BasicSettingDBGrid do
    begin
      Columns[0].Title.Caption := '�����г�';
      Columns[0].Width := 100;
      Columns[1].Title.Caption := 'ҵ�����';
      Columns[1].Width := 100;
      Columns[2].Title.Caption := 'ӡ��˰';
      Columns[2].Width := 100;
      Columns[3].Title.Caption := '���ַ�';
      Columns[3].Width := 100;
      Columns[4].Title.Caption := '������';
      Columns[4].Width := 100;
      Columns[5].Title.Caption := '֤�ܷ�';
      Columns[5].Width := 100;
      Columns[6].Title.Caption := 'Ӷ��';
      Columns[6].Width := 100;
    end;
  end
  else if(BasicSubMenuTreeView.Selected.Text ='������������') then
  begin
    with BasicSettingDBGrid do
    begin
      Columns[0].Title.Caption := '��������';
      Columns[0].Width := 100;
      Columns[1].Title.Caption := '��ʼ����';
      Columns[1].Width := 100;
      Columns[2].Title.Caption := '��������';
      Columns[2].Width := 100;
      Columns[3].Title.Caption := '�������';
      Columns[3].Width := 100;
      Columns[4].Title.Caption := '�����ܶ�';
      Columns[4].Width := 100;
      Columns[5].Title.Caption := '�������';
      Columns[5].Width := 100;
    end;

  end
  else if(BasicSubMenuTreeView.Selected.Text ='����·������') then
  begin
    with BasicSettingDBGrid do
    begin
      Columns[0].Title.Caption := '�ӿ�����';
      Columns[0].Width := 100;
      Columns[1].Title.Caption := '�ӿڱ��';
      Columns[1].Width := 100;
      Columns[2].Title.Caption := '�ļ�·��';
      Columns[2].Width := 450;
      Columns[3].Title.Caption := '�ļ�����';
      Columns[3].Width := 100;
    end;
  end
  else if(BasicSubMenuTreeView.Selected.Text ='֤ȯ��Ϣ����') then
  begin
    with BasicSettingDBGrid do
    begin
      Columns[0].Title.Caption := '֤ȯ����';
      Columns[0].Width := 100;
      Columns[1].Title.Caption := '�����г�';
      Columns[1].Width := 100;
      Columns[2].Title.Caption := '֤ȯ���';
      Columns[2].Width := 100;
      Columns[3].Title.Caption := '֤ȯ����';
      Columns[3].Width := 100;
      Columns[4].Title.Caption := '�ܹɱ�';
      Columns[4].Width := 100;
      Columns[5].Title.Caption := 'ÿ����ֵ';
      Columns[5].Width := 100;
      Columns[6].Title.Caption := '��������';
      Columns[6].Width := 100;
      Columns[7].Title.Caption := '��Ϣ��';
      Columns[7].Width := 100;
      Columns[8].Title.Caption := '������';
      Columns[8].Width := 100;
      Columns[9].Title.Caption := '��Ϣ˰';
      Columns[9].Width := 100;
      Columns[10].Title.Caption := '��Ϣ��ʽ';
      Columns[10].Width := 100;
      Columns[11].Title.Caption := '�ع�����';
      Columns[11].Width := 100;
    end;
  end
  else
  begin
    with BasicSettingDBGrid do
    begin
      Columns[0].Title.Caption := '��Ŀ����';
      Columns[0].Width := 100;
      Columns[1].Title.Caption := '��Ŀ����';
      Columns[1].Width := 200;
      Columns[2].Title.Caption := '�������';
      Columns[2].Width := 100;
    end;
  end;
end;

// ������ѡ��Combox �����仯ʱ�����²�ѯ����
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


// �������ý����Ҽ��˵�-���
procedure TMainForm.BasicDBGScanButtonClick(Sender: TObject);
begin
  BasicScanButtonClick(Sender);
end;

// �������ý����Ҽ��˵�-�༭
procedure TMainForm.BasicDBGEditButtonClick(Sender: TObject);
begin
  BasicEditButtonClick(Sender);
end;

// �������ý����Ҽ��˵�-ɾ��
procedure TMainForm.BasicDBGDeleteButtonClick(Sender: TObject);
Var ZQDM: String;
begin
  if BasicSettingDBGrid.Fields[0].Value = NULL then Exit;
  ZQDM:=BasicSettingDBGrid.Fields[0].Value;
  with UserADOQuery do
  begin
    Close;
    SQL.Clear;
    if(BasicSubMenuTreeView.Selected.Text='֤ȯ��Ϣ����') then
    begin
      SQL.Add('delete from TZQXX where TZQXX_ZQDM=:a');
      Parameters.ParamByName('a').Value:=ZQDM;
  //    Parameters.ParamByName('a').Value:=BasicSettingDBGrid.Fields[0].Text;
      end
    else if(BasicSubMenuTreeView.Selected.Text='��ƿ�Ŀ����') then
    begin
      SQL.Add('delete from TKJKM where TKJKM_KMDM=:a');
      Parameters.ParamByName('a').Value:=ZQDM;
//      Parameters.ParamByName('a').Value:=BasicSettingDBGrid.Fields[0].Text;
    end;
    ExecSQL;
    BasicSubMenuOnClick(Sender);
  end;
end;

//..............................................................................Ȩ�湫��ά��
// ��ʼ������ά��������еĲ���
procedure TMainForm.tsDataManageShow(Sender: TObject);
begin
  dbgrdDataManage.Visible:=True;
  // moreѡ���һ����Ŀ
  tvDataManage.Items.Item[0].Selected:=True;
  // ���ó�Ȩ�Ŀ�ʼ���ںͽ�������Ϊ������ѡ�������
  dtpKSRQDataManage.Date:=dtpMainForm.DateTime;
  dtpJSRQDataManage.Date:=dtpMainForm.DateTime;

  // ���ú���ʵ�����ݵ�ˢ��
  dtpDataManageOnChange(Sender);
end;


// ���ݵ�����������ѯ����
procedure TMainForm.dtpDataManageOnChange(Sender: TObject);
begin
  with UserADOQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select thl_ywrq,thl_dzrq,thl_jysc,thl_zqdm,thl_zqmc,thl_djsl,thl_fhje,thl_qybl'+
    ' from THL where THL_YWRQ between :a and :b and THL_YWLB=''��������''');
    Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpKSRQDataManage.DateTime);
    Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpJSRQDataManage.DateTime);
    Open;

    changeDbgrdDataTitle(Sender);
  end;
end;

// ������ť���е���������֤ȯ���벻ʹ��ʱ���ж�
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


// ˢ�°�ť������
procedure TMainForm.btnFreshDataManageClick(Sender: TObject);
begin
  dtpDataManageOnChange(Sender);
end;

// �鿴��ť����
procedure TMainForm.btnScanDataManageClick(Sender: TObject);
begin
  if (dbgrdDataManage.Fields[4].Text = NULL) or (dbgrdDataManage.Fields[4].Text = '') then
    exit;
  DataManageGPForm1.Show;
  DataManageGPForm1.Caption:='��Ʊ�ֺ칫��-�鿴';

  //��������
  DataManageGPForm1.edtZQDMDataManageGP.Text:=dbgrdDataManage.Fields[3].Text;
  DataManageGPForm1.edtDMGPJYSCEdit.Text := dbgrdDataManage.Fields[2].Text;
  DataManageGPForm1.edtZQMCDataManageGP.Text:=dbgrdDataManage.Fields[4].Text;
  DataManageGPForm1.edtGHSLDataManageGP.Text:=dbgrdDataManage.Fields[5].Text;
  DataManageGPForm1.edtQYBLDataManageGP.Text:=dbgrdDataManage.Fields[7].Text;
  DataManageGPForm1.dtpKSRQDataManageGP.DateTime:=dbgrdDataManage.Fields[0].AsDateTime;
  DataManageGPForm1.dtpJSRQDataManageGP.DateTime:=dbgrdDataManage.Fields[1].AsDateTime;

  // �������
  DataManageGPForm1.btnDataMGPSure.Visible:=False;
  DataManageGPForm1.btnDataMGPCancle.Caption:='ȷ��';

  DataManageGPForm1.edtZQDMDataManageGP.Enabled := False;
  DataManageGPForm1.edtDMGPJYSCEdit.Enabled := False;
  DataManageGPForm1.edtZQMCDataManageGP.Enabled := False;
  DataManageGPForm1.edtGHSLDataManageGP.Enabled := False;
  DataManageGPForm1.edtQYBLDataManageGP.Enabled := False;
  DataManageGPForm1.dtpKSRQDataManageGP.Enabled := False;
  DataManageGPForm1.dtpJSRQDataManageGP.Enabled := False;
end;

// �༭��ť����
procedure TMainForm.btnEditDataManageClick(Sender: TObject);
begin
  if (dbgrdDataManage.Fields[4].Text = NULL) or (dbgrdDataManage.Fields[4].Text = '') then
    exit;
  DataManageGPForm1.Show;
  DataManageGPForm1.Caption:='��Ʊ�ֺ칫��-�༭';
  //��������
  DataManageGPForm1.edtZQDMDataManageGP.Text:=dbgrdDataManage.Fields[3].Text;
  DataManageGPForm1.edtDMGPJYSCEdit.Text := dbgrdDataManage.Fields[2].Text;
  DataManageGPForm1.edtZQMCDataManageGP.Text:=dbgrdDataManage.Fields[4].Text;
  DataManageGPForm1.edtGHSLDataManageGP.Text:=dbgrdDataManage.Fields[5].Text;
  DataManageGPForm1.edtQYBLDataManageGP.Text:=dbgrdDataManage.Fields[7].Text;
  DataManageGPForm1.dtpKSRQDataManageGP.DateTime:=dbgrdDataManage.Fields[0].AsDateTime;
  DataManageGPForm1.dtpJSRQDataManageGP.DateTime:=dbgrdDataManage.Fields[1].AsDateTime;

  // ��ʾ���
  DataManageGPForm1.btnDataMGPSure.Visible:=True;
  DataManageGPForm1.btnDataMGPCancle.Caption:='ȡ��';

  DataManageGPForm1.edtZQDMDataManageGP.Enabled := False;
  DataManageGPForm1.edtDMGPJYSCEdit.Enabled := False;
  DataManageGPForm1.edtZQMCDataManageGP.Enabled := True;
  DataManageGPForm1.edtGHSLDataManageGP.Enabled := True;
  DataManageGPForm1.edtQYBLDataManageGP.Enabled := True;
  DataManageGPForm1.dtpKSRQDataManageGP.Enabled := True;
  DataManageGPForm1.dtpJSRQDataManageGP.Enabled := True;
end;


// ������ť����
procedure TMainForm.btnAddDataManageClick(Sender: TObject);
begin
  DataManageGPForm1.Show;
  DataManageGPForm1.Caption:='��Ʊ�ֺ칫��-����';
  // �������е����ݣ�����Ϊ��ȡ����
  DataManageGPForm1.edtZQDMDataManageGP.Text:='';
  DataManageGPForm1.edtDMGPJYSCEdit.Text := '';
  DataManageGPForm1.edtZQMCDataManageGP.Text:='';
  DataManageGPForm1.edtGHSLDataManageGP.Text:='0';
  DataManageGPForm1.edtQYBLDataManageGP.Text:='0.0';
  DataManageGPForm1.dtpKSRQDataManageGP.Date:=dtpMainForm.DateTime;
  DataManageGPForm1.dtpJSRQDataManageGP.Date:=dtpMainForm.DateTime;

   // ��ʾ���
  DataManageGPForm1.btnDataMGPSure.Visible:=True;
  DataManageGPForm1.btnDataMGPCancle.Caption:='ȡ��';

  DataManageGPForm1.edtZQDMDataManageGP.Enabled := True;
  DataManageGPForm1.edtDMGPJYSCEdit.Enabled := True;
  DataManageGPForm1.edtZQMCDataManageGP.Enabled := True;
  DataManageGPForm1.edtGHSLDataManageGP.Enabled := True;
  DataManageGPForm1.edtQYBLDataManageGP.Enabled := True;
  DataManageGPForm1.dtpKSRQDataManageGP.Enabled := True;
  DataManageGPForm1.dtpJSRQDataManageGP.Enabled := True;
end;

// ���ı�ͷ dbgrdDataManage
procedure TMainForm.changeDbgrdDataTitle(Sender:TObject);
begin
  if (tvDataManage.Selected.Text = '��Ʊ�ֺ칫��') then
  begin
    with dbgrdDataManage do
    begin
      Columns[0].title.caption := 'ҵ������';
      columns[0].Width := 100;
      Columns[1].title.caption := '��������';
      columns[1].Width := 100;
      Columns[2].title.caption := '�����г�';
      columns[2].Width := 100;
      Columns[3].title.caption := '֤ȯ����';
      columns[3].Width := 100;
      Columns[4].title.caption := '֤ȯ����';
      columns[4].Width := 100;
      Columns[5].title.caption := '�Ǽ�����';
      columns[5].Width := 100;
      Columns[6].title.caption := '�ֺ���';
      columns[6].Width := 100;
      Columns[7].title.caption := 'Ȩ�����';
      columns[7].Width := 100;
    end;
  end;
end;

// �Ҽ��˵�-�鿴
procedure TMainForm.pmDMN1Click(Sender: TObject);
begin
  btnScanDataManageClick(Sender);
end;

// �Ҽ��˵�-�༭
procedure TMainForm.pmDMN2Click(Sender: TObject);
begin
  btnEditDataManageClick(Sender);
end;

// �Ҽ��˵�-����
procedure TMainForm.pmDMN4Click(Sender: TObject);
begin
  btnAddDataManageClick(Sender);
end;


//..............................................................................֤ȯҵ��
// ����ծȯ���׺͹�Ʊ���׵����ݲ����� Ӷ���Ӧ����Ϣ������ֱ��ʹ�� GPJY �Ĵ������
// ��Ʊ�ֺ� ����� ծȯ��Ϣ�������࣬����ֱ��ʹ�� ��Ϣ��ZQYWDXForm) ����
// ��ʼ������Ĳ���
procedure TMainForm.tsZQYWShow(Sender: TObject);
begin
  dbgrdZQYW.Visible:=True;
  // ѡ���һ����Ŀ
  tvZQYW.Items.Item[1].Selected:=True;
  // ���ó�Ȩ�Ŀ�ʼ���ںͽ�������Ϊ������ѡ�������
  dtpZQYWKSRQ.Date:=dtpMainForm.DateTime;
  dtpZQYWJSRQ.Date:=dtpMainForm.DateTime;

  // ���ú���ʵ�����ݵ�ˢ��
  dtpZQYWOnChange(Sender);
end;


// ���ݽ������ں���ѡ�ı�ǩ����ѯ���� ���Ӳ˵������仯��ʱ�򣬽����ô˺�������������ˢ��
procedure TMainForm.dtpZQYWOnChange(Sender: TObject);
begin
  with UserADOQuery do
  begin
    Close;
    SQL.Clear;
    if (tvZQYW.Selected.Text='��Ʊ����') then
    begin
      SQL.Add('select * from TGPJY where TGPJY_JYRQ between :a and :b');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else if(tvZQYW.Selected.Text='�¹���ǩ') then
    begin
      SQL.Add('select * from TXG where TXG_YWRQ between :a and :b and TXG_YWLB=''�¹���ǩ''');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else if(tvZQYW.Selected.Text='��ǩ����') then
    begin
      SQL.Add('select * from TXG where TXG_YWRQ between :a and :b and TXG_YWLB=''�¹ɽ���''');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else if(tvZQYW.Selected.Text='��ǩ�ɿ�') then
    begin
      SQL.Add('select * from TXG where TXG_YWRQ between :a and :b and TXG_YWLB=''�¹ɽɿ�''');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else if(tvZQYW.Selected.Text='�¹���ͨ') then
    begin
      SQL.Add('select * from TXG where TXG_YWRQ between :a and :b and TXG_YWLB=''�¹���ͨ''');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else if(tvZQYW.Selected.Text='������Ȩ') then
    begin
      SQL.Add('select * from THL where THL_YWRQ between :a and :b and THL_YWLB=''������Ȩ''');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else if(tvZQYW.Selected.Text='��������') then
    begin
      SQL.Add('select * from THL where THL_YWRQ between :a and :b and THL_YWLB=''��������''');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else if(tvZQYW.Selected.Text='ծȯ����') then
    begin
      SQL.Add('select * from TZQJY where TZQJY_JYRQ between :a and :b and (TZQJY_JYFX=''����'' or TZQJY_JYFX=''����'')');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else if(tvZQYW.Selected.Text='��Ϣת��') then
    begin
      SQL.Add('select * from TZQJY where TZQJY_JYRQ between :a and :b  and TZQJY_JYFX=''��Ϣת��''');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else if(tvZQYW.Selected.Text='��Ϣ����') then
    begin
      SQL.Add('select * from TZQJY where TZQJY_JYRQ between :a and :b and TZQJY_JYFX=''��Ϣ����''');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else if(tvZQYW.Selected.Text='ծȯҵ��') then
    begin
      SQL.Add('select * from TZQJY where TZQJY_JYRQ between :a and :b');
      Parameters.ParamByName('a').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWKSRQ.DateTime);
      Parameters.ParamByName('b').Value:=FormatDatetime('YYYY-MM-DD', dtpZQYWJSRQ.DateTime);
    end
    else if(tvZQYW.Selected.Text='�ع�ҵ��') then
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



// ����鿴��ť�����Ļ
procedure TMainForm.btnZQYWScanClick(Sender: TObject);
begin
  // ��� ִ��Ϊ��
  if (dbgrdZQYW.Fields[0].Text = NULL) or (dbgrdZQYW.Fields[0].Text = '') then
    exit;
  if (tvZQYW.Selected.Text='��Ʊ����') then
  begin
    ZQYWGPJYForm1.Caption:='��Ʊ����-�鿴';
    // ��������
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

    ZQYWGPJYForm1.lblGPJYSXF.Caption:='������';
    ZQYWGPJYForm1.lblGPJYYJ.Caption:='Ӷ��';
    ZQYWGPJYForm1.btnGPJYSure.Visible:=False;
    ZQYWGPJYForm1.btnGPJYCancle.Caption:='ȷ��';
    ZQYWGPJYForm1.Show;
  end
  else if(tvZQYW.Selected.Text='�¹���ǩ') or (tvZQYW.Selected.Text='��ǩ�ɿ�')
        or (tvZQYW.Selected.Text='��ǩ����')or (tvZQYW.Selected.Text='�¹���ͨ')then
  begin

    ZQYWXGForm1.Caption:='�¹�ҵ��-�鿴';
    // TODO ��������
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
    ZQYWXGForm1.btnXGCancle.Caption:='ȷ��';

    ZQYWXGForm1.Show;
  end
  else if(tvZQYW.Selected.Text='������Ȩ') then
  begin

    ZQYWDXForm1.Caption:='����ҵ��-��Ȩ-�鿴';
    // TODO ��������
    ZQYWDXForm1.edtDXZQDM.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWDXForm1.edtDXZQMC.Text:=dbgrdZQYW.Fields[5].Text;
    ZQYWDXForm1.dtpDXJYRQ.Date:=dbgrdZQYW.Fields[0].AsDateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:=dbgrdZQYW.Fields[3].Text;
    ZQYWDXForm1.edtDXZCLX.Text:=dbgrdZQYW.Fields[7].Text;

    ZQYWDXForm1.lblDXZCLX.Caption:='�ֺ���';
    ZQYWDXForm1.btnDXSure.Visible:=False;
    ZQYWDXForm1.btnDXCancle.Caption:='ȷ��';

    ZQYWDXForm1.edtDXZQDM.Enabled:= False;
    ZQYWDXForm1.edtDXZQMC.Enabled := False;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := False;
    ZQYWDXForm1.cbbDXJYSC.Enabled := False;
    ZQYWDXForm1.edtDXZCLX.Enabled := False;
    ZQYWDXForm1.Show;
  end
  else if(tvZQYW.Selected.Text='��������') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='����ҵ��-����-�鿴';
    // TODO ��������
     ZQYWDXForm1.edtDXZQDM.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWDXForm1.edtDXZQMC.Text:=dbgrdZQYW.Fields[5].Text;
    ZQYWDXForm1.dtpDXJYRQ.Date:=dbgrdZQYW.Fields[0].AsDateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:=dbgrdZQYW.Fields[3].Text;
    ZQYWDXForm1.edtDXZCLX.Text:=dbgrdZQYW.Fields[7].Text;

    ZQYWDXForm1.lblDXZCLX.Caption:='�ֺ���';
    ZQYWDXForm1.btnDXSure.Visible:=False;
    ZQYWDXForm1.btnDXCancle.Caption:='ȷ��';

    ZQYWDXForm1.edtDXZQDM.Enabled := False;
    ZQYWDXForm1.edtDXZQMC.Enabled := False;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := False;
    ZQYWDXForm1.cbbDXJYSC.Enabled := False;
    ZQYWDXForm1.edtDXZCLX.Enabled := False;
  end
  else if(tvZQYW.Selected.Text='ծȯ����') then
  begin

    ZQYWGPJYForm1.Caption:='ծȯ����-�鿴';
    // TODO ��������
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
    // ծȯ����û����Ϣ˰������ʹ��Ӷ��Ŀ���Ϊ��Ϣ˰��չʾ
    ZQYWGPJYForm1.edtGPJYSXF.Text:=dbgrdZQYW.Fields[13].Text;
    ZQYWGPJYForm1.edtGPJYYJ.Text:=dbgrdZQYW.Fields[15].Text;

    ZQYWGPJYForm1.lblGPJYSXF.Caption:='˰ǰ��Ϣ';
    ZQYWGPJYForm1.lblGPJYYJ.Caption:='��Ϣ˰';
    ZQYWGPJYForm1.btnGPJYSure.Visible:=False;
    ZQYWGPJYForm1.btnGPJYCancle.Caption:='ȷ��';
    ZQYWGPJYForm1.Show;
  end
  else if(tvZQYW.Selected.Text='��Ϣת��') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='��Ϣҵ��-ת��-�鿴';
    // TODO ��������
    ZQYWDXForm1.edtDXZQDM.Text:=dbgrdZQYW.Fields[0].Text;
    ZQYWDXForm1.edtDXZQMC.Text:=dbgrdZQYW.Fields[1].Text;
    ZQYWDXForm1.dtpDXJYRQ.Date:=dbgrdZQYW.Fields[2].AsDateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWDXForm1.edtDXZCLX.Text:=dbgrdZQYW.Fields[14].Text;

    ZQYWDXForm1.lblDXZCLX.Caption:='��Ϣ���';
    ZQYWDXForm1.btnDXSure.Visible:=False;
    ZQYWDXForm1.btnDXCancle.Caption:='ȷ��';

    ZQYWDXForm1.edtDXZQDM.Enabled := False;
    ZQYWDXForm1.edtDXZQMC.Enabled := False;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := False;
    ZQYWDXForm1.cbbDXJYSC.Enabled := False;
    ZQYWDXForm1.edtDXZCLX.Enabled := False;
  end
  else if(tvZQYW.Selected.Text='��Ϣ����') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='��Ϣҵ��-����-�鿴';
    // TODO ��������
    ZQYWDXForm1.edtDXZQDM.Text:=dbgrdZQYW.Fields[0].Text;
    ZQYWDXForm1.edtDXZQMC.Text:=dbgrdZQYW.Fields[1].Text;
    ZQYWDXForm1.dtpDXJYRQ.Date:=dbgrdZQYW.Fields[2].AsDateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWDXForm1.edtDXZCLX.Text:=dbgrdZQYW.Fields[14].Text;

    ZQYWDXForm1.lblDXZCLX.Caption:='��Ϣ���';
    ZQYWDXForm1.btnDXSure.Visible:=False;
    ZQYWDXForm1.btnDXCancle.Caption:='ȷ��';

    ZQYWDXForm1.edtDXZQDM.Enabled := False;
    ZQYWDXForm1.edtDXZQMC.Enabled := False;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := False;
    ZQYWDXForm1.cbbDXJYSC.Enabled := False;
    ZQYWDXForm1.edtDXZCLX.Enabled := False;
  end
  else if(tvZQYW.Selected.Text='�ع�ҵ��') then
  begin

    ZQYWHGForm1.Caption:='�ع�ҵ��-�鿴';
    // TODO ��������
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
    ZQYWHGForm1.btnHGCancle.Caption:='ȷ��';
    ZQYWHGForm1.Show;
  end
  else
  begin

  end;
end;

// ����༭��ť�����Ļ
procedure TMainForm.btnZQYWEditClick(Sender: TObject);
begin
  if (dbgrdZQYW.Fields[0].Text = NULL) or (dbgrdZQYW.Fields[0].Text = '') then
    exit;
  if (tvZQYW.Selected.Text='��Ʊ����') then
  begin

    ZQYWGPJYForm1.Caption:='��Ʊ����-�޸�';
    // ��������
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
           
    ZQYWGPJYForm1.lblGPJYSXF.Caption:='������';
    ZQYWGPJYForm1.lblGPJYYJ.Caption:='Ӷ��';
    ZQYWGPJYForm1.btnGPJYSure.Visible:=True;
    ZQYWGPJYForm1.btnGPJYCancle.Caption:='ȡ��';
    ZQYWGPJYForm1.Show;
  end
  else if(tvZQYW.Selected.Text='�¹���ǩ') or (tvZQYW.Selected.Text='��ǩ�ɿ�')
          or (tvZQYW.Selected.Text='��ǩ����') or (tvZQYW.Selected.Text='�¹���ͨ')then
  begin

    ZQYWXGForm1.Caption:='�¹�ҵ��-�޸�';
    // TODO ��������
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
    ZQYWXGForm1.btnXGCancle.Caption:='ȡ��';
    ZQYWXGForm1.Show;
  end
  else if(tvZQYW.Selected.Text='������Ȩ') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='����ҵ��-��Ȩ-�޸�';
    // TODO ��������
    ZQYWDXForm1.edtDXZQDM.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWDXForm1.edtDXZQMC.Text:=dbgrdZQYW.Fields[5].Text;
    ZQYWDXForm1.dtpDXJYRQ.Date:=dbgrdZQYW.Fields[0].AsDateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:=dbgrdZQYW.Fields[3].Text;
    ZQYWDXForm1.edtDXZCLX.Text:=dbgrdZQYW.Fields[7].Text;

    ZQYWDXForm1.lblDXZCLX.Caption:='�ֺ���';
    ZQYWDXForm1.btnDXSure.Visible:=True;
    ZQYWDXForm1.btnDXCancle.Caption:='ȡ��';

    ZQYWDXForm1.edtDXZQDM.Enabled := False;
    ZQYWDXForm1.edtDXZQMC.Enabled := True;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := True;
    ZQYWDXForm1.cbbDXJYSC.Enabled := False;
    ZQYWDXForm1.edtDXZCLX.Enabled := True;
  end
  else if(tvZQYW.Selected.Text='��������') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='����ҵ��-����-�޸�';
    // TODO ��������
    ZQYWDXForm1.edtDXZQDM.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWDXForm1.edtDXZQMC.Text:=dbgrdZQYW.Fields[5].Text;
    ZQYWDXForm1.dtpDXJYRQ.Date:=VarToDateTime(dbgrdZQYW.Fields[0].Text);
    ZQYWDXForm1.cbbDXJYSC.Text:=dbgrdZQYW.Fields[3].Text;
    ZQYWDXForm1.edtDXZCLX.Text:=dbgrdZQYW.Fields[7].Text;
    
    ZQYWDXForm1.lblDXZCLX.Caption:='�ֺ���';
    ZQYWDXForm1.btnDXSure.Visible:=True;
    ZQYWDXForm1.btnDXCancle.Caption:='ȡ��';

    ZQYWDXForm1.edtDXZQDM.Enabled := False;
    ZQYWDXForm1.edtDXZQMC.Enabled := True;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := True;
    ZQYWDXForm1.cbbDXJYSC.Enabled := False;
    ZQYWDXForm1.edtDXZCLX.Enabled := True;
  end
  else if(tvZQYW.Selected.Text='ծȯ����') then
  begin

    ZQYWGPJYForm1.Caption:='ծȯ����-�޸�';
    // TODO ��������
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

    // ծȯ����û����Ϣ˰������ʹ��Ӷ��Ŀ���Ϊ��Ϣ˰��չʾ  ������ ��Ϊ ˰ǰ��Ϣʹ��
    ZQYWGPJYForm1.edtGPJYSXF.Text:=dbgrdZQYW.Fields[13].Text;
    ZQYWGPJYForm1.edtGPJYYJ.Text:=dbgrdZQYW.Fields[15].Text;

    ZQYWGPJYForm1.lblGPJYSXF.Caption:='˰ǰ��Ϣ';
    ZQYWGPJYForm1.lblGPJYYJ.Caption:='��Ϣ˰';
    ZQYWGPJYForm1.btnGPJYSure.Visible:=True;
    ZQYWGPJYForm1.btnGPJYCancle.Caption:='ȡ��';
    ZQYWGPJYForm1.Show;
  end
  else if(tvZQYW.Selected.Text='��Ϣת��') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='��Ϣҵ��-ת��-�޸�';
    // TODO ��������
     ZQYWDXForm1.edtDXZQDM.Text:=dbgrdZQYW.Fields[0].Text;
    ZQYWDXForm1.edtDXZQMC.Text:=dbgrdZQYW.Fields[1].Text;
    ZQYWDXForm1.dtpDXJYRQ.Date:=dbgrdZQYW.Fields[2].AsDateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWDXForm1.edtDXZCLX.Text:=dbgrdZQYW.Fields[14].Text;

    ZQYWDXForm1.lblDXZCLX.Caption:='��Ϣ���';
    ZQYWDXForm1.btnDXSure.Visible:=True;
    ZQYWDXForm1.btnDXCancle.Caption:='ȡ��';

    ZQYWDXForm1.edtDXZQDM.Enabled := False;
    ZQYWDXForm1.edtDXZQMC.Enabled := True;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := True;
    ZQYWDXForm1.cbbDXJYSC.Enabled := False;
    ZQYWDXForm1.edtDXZCLX.Enabled := True;
  end
  else if(tvZQYW.Selected.Text='��Ϣ����') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='��Ϣҵ��-����-�޸�';
    // TODO ��������
    ZQYWDXForm1.edtDXZQDM.Text:=dbgrdZQYW.Fields[0].Text;
    ZQYWDXForm1.edtDXZQMC.Text:=dbgrdZQYW.Fields[1].Text;
    ZQYWDXForm1.dtpDXJYRQ.Date:=dbgrdZQYW.Fields[2].AsDateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:=dbgrdZQYW.Fields[4].Text;
    ZQYWDXForm1.edtDXZCLX.Text:=dbgrdZQYW.Fields[14].Text;

    ZQYWDXForm1.lblDXZCLX.Caption:='��Ϣ���';
    ZQYWDXForm1.btnDXSure.Visible:=True;
    ZQYWDXForm1.btnDXCancle.Caption:='ȡ��';

    ZQYWDXForm1.edtDXZQDM.Enabled := False;
    ZQYWDXForm1.edtDXZQMC.Enabled := True;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := True;
    ZQYWDXForm1.cbbDXJYSC.Enabled := False;
    ZQYWDXForm1.edtDXZCLX.Enabled := True;
  end
  else if(tvZQYW.Selected.Text='�ع�ҵ��') then
  begin

    ZQYWHGForm1.Caption:='�ع�ҵ��-�޸�';
    // TODO ��������
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
    ZQYWHGForm1.btnHGCancle.Caption:='ȡ��';
    ZQYWHGForm1.Show;
  end
  else exit;
end;


// ���������ť�����Ļ
procedure TMainForm.btnZQYWAddClick(Sender: TObject);
begin
  if (tvZQYW.Selected.Text='��Ʊ����') then
  begin

    ZQYWGPJYForm1.Caption:='��Ʊ����-����';
    // TODO ��������
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
    ZQYWGPJYForm1.edtGPJYSXF.Text:='0';

    ZQYWGPJYForm1.lblGPJYSXF.Caption:='������';
    ZQYWGPJYForm1.lblGPJYYJ.Caption:='Ӷ��';
    ZQYWGPJYForm1.btnGPJYSure.Visible:=True;
    ZQYWGPJYForm1.btnGPJYCancle.Caption:='ȡ��';
    ZQYWGPJYForm1.Show;
  end
  // ��δ���࣬��Ҫ����
  else if (tvZQYW.Selected.Text='�¹���ǩ') or (tvZQYW.Selected.Text='��ǩ�ɿ�')
  or (tvZQYW.Selected.Text='��ǩ����') or (tvZQYW.Selected.Text='�¹���ͨ')then
  begin

    ZQYWXGForm1.Caption:='�¹�ҵ��-����';
    // TODO ��������
    ZQYWXGForm1.edtXGZQDM.Text:='';
    ZQYWXGForm1.edtXGZQMC.Text:='';
    ZQYWXGForm1.dtpXGYWRQ.Date:= MainForm.dtpMainForm.DateTime;
    // �ֱ�����ҵ����𣬺������ҵ������֤ȯ�������ҵ����б�
    if(tvZQYW.Selected.Text='�¹���ǩ') then
      ZQYWXGForm1.cbbXGYWLB.Text:='�¹���ǩ'
    else if(tvZQYW.Selected.Text='��ǩ�ɿ�') then
      ZQYWXGForm1.cbbXGYWLB.Text:='�¹ɽɿ�'
    else if(tvZQYW.Selected.Text='��ǩ����') then
      ZQYWXGForm1.cbbXGYWLB.Text:='�¹ɽ���'
    else if(tvZQYW.Selected.Text='�¹���ͨ') then
      ZQYWXGForm1.cbbXGYWLB.Text:='�¹���ͨ';

    ZQYWXGForm1.cbbXGJYSC.Text:='';
    ZQYWXGForm1.edtXGCJSL.Text:='0';
    ZQYWXGForm1.edtXGCJJG.Text:='0';
    ZQYWXGForm1.edtXGCJJE.Text:='0';

    ZQYWXGForm1.cbbXGYWLB.Enabled:=False;

    ZQYWXGForm1.btnXGSure.Visible:=True;
    ZQYWXGForm1.btnXGCancle.Caption:='ȡ��';
    ZQYWXGForm1.Show;
  end
  else if(tvZQYW.Selected.Text='������Ȩ') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='����ҵ��-��Ȩ-����';
    // TODO ��������
    ZQYWDXForm1.edtDXZQDM.Text:='';
    ZQYWDXForm1.edtDXZQMC.Text:='';
    ZQYWDXForm1.dtpDXJYRQ.Date:=MainForm.dtpMainForm.DateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:='';
    ZQYWDXForm1.edtDXZCLX.Text:='0';

    ZQYWDXForm1.lblDXZCLX.Caption:='�ֺ���';
    ZQYWDXForm1.btnDXSure.Visible:=True;
    ZQYWDXForm1.btnDXCancle.Caption:='ȡ��';

    ZQYWDXForm1.edtDXZQDM.Enabled := True;
    ZQYWDXForm1.edtDXZQMC.Enabled := True;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := True;
    ZQYWDXForm1.cbbDXJYSC.Enabled := True;
    ZQYWDXForm1.edtDXZCLX.Enabled := True;
  end
  else if(tvZQYW.Selected.Text='��������') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='����ҵ��-����-����';
    // TODO ��������
    ZQYWDXForm1.edtDXZQDM.Text:='';
    ZQYWDXForm1.edtDXZQMC.Text:='';
    ZQYWDXForm1.dtpDXJYRQ.Date:=MainForm.dtpMainForm.DateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:='';
    ZQYWDXForm1.edtDXZCLX.Text:='0';

    ZQYWDXForm1.lblDXZCLX.Caption:='�ֺ���';
    ZQYWDXForm1.btnDXSure.Visible:=True;
    ZQYWDXForm1.btnDXCancle.Caption:='ȡ��';

    ZQYWDXForm1.edtDXZQDM.Enabled := True;
    ZQYWDXForm1.edtDXZQMC.Enabled := True;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := True;
    ZQYWDXForm1.cbbDXJYSC.Enabled := True;
    ZQYWDXForm1.edtDXZCLX.Enabled := True;
  end
  else if(tvZQYW.Selected.Text='ծȯ����') then
  begin

    ZQYWGPJYForm1.Caption:='ծȯ����-����';
    // TODO ��������
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
    // ծȯ����û����Ϣ˰������ʹ��Ӷ��Ŀ���Ϊ��Ϣ˰��չʾ
    ZQYWGPJYForm1.edtGPJYYJ.Text:='';

    ZQYWGPJYForm1.lblGPJYSXF.Caption:='˰ǰ��Ϣ';
    ZQYWGPJYForm1.lblGPJYYJ.Caption:='��Ϣ˰';
    ZQYWGPJYForm1.btnGPJYSure.Visible:=True;
    ZQYWGPJYForm1.btnGPJYCancle.Caption:='ȡ��';
    ZQYWGPJYForm1.Show;
  end
  else if(tvZQYW.Selected.Text='��Ϣת��') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='��Ϣҵ��-ת��-����';
    // TODO ��������
    ZQYWDXForm1.edtDXZQDM.Text:='';
    ZQYWDXForm1.edtDXZQMC.Text:='';
    ZQYWDXForm1.dtpDXJYRQ.Date:=MainForm.dtpMainForm.DateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:='';
    ZQYWDXForm1.edtDXZCLX.Text:='0';

    ZQYWDXForm1.lblDXZCLX.Caption:='��Ϣ���';
    ZQYWDXForm1.btnDXSure.Visible:=True;
    ZQYWDXForm1.btnDXCancle.Caption:='ȡ��';

    ZQYWDXForm1.edtDXZQDM.Enabled := True;
    ZQYWDXForm1.edtDXZQMC.Enabled := True;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := True;
    ZQYWDXForm1.cbbDXJYSC.Enabled := True;
    ZQYWDXForm1.edtDXZCLX.Enabled := True;
  end
  else if(tvZQYW.Selected.Text='��Ϣ����') then
  begin
    ZQYWDXForm1.Show;
    ZQYWDXForm1.Caption:='��Ϣҵ��-����-����';
    // TODO ��������
    ZQYWDXForm1.edtDXZQDM.Text:='';
    ZQYWDXForm1.edtDXZQMC.Text:='';
    ZQYWDXForm1.dtpDXJYRQ.Date:= MainForm.dtpMainForm.DateTime;
    ZQYWDXForm1.cbbDXJYSC.Text:='';
    ZQYWDXForm1.edtDXZCLX.Text:='';

    ZQYWDXForm1.lblDXZCLX.Caption:='��Ϣ���';
    ZQYWDXForm1.btnDXSure.Visible:=True;
    ZQYWDXForm1.btnDXCancle.Caption:='ȡ��';

    ZQYWDXForm1.edtDXZQDM.Enabled := True;
    ZQYWDXForm1.edtDXZQMC.Enabled := True;
    ZQYWDXForm1.dtpDXJYRQ.Enabled := True;
    ZQYWDXForm1.cbbDXJYSC.Enabled := True;
    ZQYWDXForm1.edtDXZCLX.Enabled := True;
  end
  else if(tvZQYW.Selected.Text='�ع�ҵ��') then
  begin

    ZQYWHGForm1.Caption:='�ع�ҵ��-����';
    // TODO ��������
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
    ZQYWHGForm1.btnHGCancle.Caption:='ȡ��';
    ZQYWHGForm1.Show;
  end
  else
  begin

  end;
end;

// �Ҽ�ɾ����ť����
procedure TMainForm.mni3Click(Sender: TObject);
begin
  dbgrdZQYW.DataSource.DataSet.Delete;
end;



// ���ˢ�°�ť�����Ļ
procedure TMainForm.btnZQYWFreshClick(Sender: TObject);
begin
  dtpZQYWOnChange(Sender);
end;


// ���������ť�����Ļ
procedure TMainForm.btnZQYWSearchClick(Sender: TObject);
begin
  with UserADOQuery do
  begin
    Close;
    SQL.Clear;
    if (tvZQYW.Selected.Text='��Ʊ����') or (tvZQYW.Selected.Text='��Ʊҵ��')then
    begin
      SQL.Add('select * from TGPJY where TGPJY_ZQDM=:a');
      Parameters.ParamByName('a').Value:=Trim(edtZQYWSearch.Text);
    end
    else if(tvZQYW.Selected.Text='�¹���ǩ') then
    begin
      SQL.Add('select * from TXG where TXG_ZQDM=:a and TXG_YWLB=''�¹���ǩ''');
      Parameters.ParamByName('a').Value:=Trim(edtZQYWSearch.Text);
    end
    else if(tvZQYW.Selected.Text='��ǩ�ɿ�') then
    begin
      SQL.Add('sselect * from TXG where TXG_ZQDM=:a and TXG_YWLB=''��ǩ�ɿ�''');
      Parameters.ParamByName('a').Value:=Trim(edtZQYWSearch.Text);
    end
    else if(tvZQYW.Selected.Text='��ǩ����') then
    begin
      SQL.Add('select * from TXG where TXG_ZQDM=:a and TXG_YWLB=''��ǩ����''');
      Parameters.ParamByName('a').Value:=Trim(edtZQYWSearch.Text);
    end
    else if(tvZQYW.Selected.Text='�¹���ͨ') then
    begin
      SQL.Add('select * from TXG where TXG_ZQDM=:a and TXG_YWLB=''�¹���ͨ''');
      Parameters.ParamByName('a').Value:=Trim(edtZQYWSearch.Text);
    end
    else if(tvZQYW.Selected.Text='������Ȩ') then
    begin
      SQL.Add('select * from THL where THL_ZQDM=:a and THL_YWLB=''������Ȩ''');
      Parameters.ParamByName('a').Value:=Trim(edtZQYWSearch.Text);
    end
    else if(tvZQYW.Selected.Text='��������') then
    begin
      SQL.Add('select * from THL where THL_ZQDM=:a and THL_YWLB=''��������''');
      Parameters.ParamByName('a').Value:=Trim(edtZQYWSearch.Text);
    end
    else if(tvZQYW.Selected.Text='ծȯ����') or (tvZQYW.Selected.Text='ծȯҵ��') then
    begin
      SQL.Add('select * from TZQJY where TZQJY_ZQDM=:a and (TZQJY_JYFX=''����'' or TZQJY_JYFX=''����''��');
      Parameters.ParamByName('a').Value:=Trim(edtZQYWSearch.Text);
    end
    else if(tvZQYW.Selected.Text='��Ϣת��') then
    begin
      SQL.Add('select * from TZQJY where TZQJY_ZQDM=:a and TZQJY_JYFX=''��Ϣת��''');
      Parameters.ParamByName('a').Value:=Trim(edtZQYWSearch.Text);
    end
    else if(tvZQYW.Selected.Text='��Ϣ����') then
    begin
      SQL.Add('select * from TZQJY where TZQJY_ZQDM=:a and TZQJY_JYFX=''��Ϣ����''');
      Parameters.ParamByName('a').Value:=Trim(edtZQYWSearch.Text);
    end
    else if(tvZQYW.Selected.Text='�ع�ҵ��') then
    begin
      SQL.Add('select * from THGJY where THGJY_ZQDM=:a');
      Parameters.ParamByName('a').Value:=Trim(edtZQYWSearch.Text);
    end;
    Open;// ʹ��ExecSQL �������ݲ�ѯ������

    // ʹ�ú����ı��ͷ
    ChangedbgrdZQYWTitle(Sender);
  end;
end;

// �ı�  dbgrdZQYW �ı�ͷ
procedure TMainForm.ChangedbgrdZQYWTitle(Sender: TObject);
begin
  with  dbgrdZQYW do
  begin
    if (tvZQYW.Selected.Text='��Ʊ����') or (tvZQYW.Selected.Text='��Ʊҵ��')then
    begin
      Columns[0].Title.Caption := '֤ȯ����';
      Columns[0].Width := 100;
      Columns[1].Title.Caption := '֤ȯ����';
      Columns[1].Width := 100;
      Columns[2].Title.Caption := '��������';
      Columns[2].Width := 100;
      Columns[3].Title.Caption := '���׷���';
      Columns[3].Width := 100;
      Columns[4].Title.Caption := '�����г�';
      Columns[4].Width := 100;
      Columns[5].Title.Caption := '�ɽ��۸�';
      Columns[5].Width := 100;
      Columns[6].Title.Caption := '�ɽ����';
      Columns[6].Width := 100;
      Columns[7].Title.Caption := '�ɽ�����';
      Columns[7].Width := 100;
      Columns[8].Title.Caption := '���ַ�';
      Columns[8].Width := 100;
      Columns[9].Title.Caption := 'ӡ��˰';
      Columns[9].Width := 100;
      Columns[10].Title.Caption := '������';
      Columns[10].Width := 100;
      Columns[11].Title.Caption := '֤�ܷ�';
      Columns[11].Width := 100;
      Columns[12].Title.Caption := 'Ӷ��';
      Columns[12].Width := 100;
    end
    else if(tvZQYW.Selected.Text='�¹���ǩ') or (tvZQYW.Selected.Text='��ǩ�ɿ�')
           or (tvZQYW.Selected.Text='��ǩ����') or (tvZQYW.Selected.Text='�¹���ͨ') then
    begin
      Columns[0].Title.Caption := '֤ȯ����';
      Columns[0].Width := 100;
      Columns[1].Title.Caption := '�����г�';
      Columns[1].Width := 100;
      Columns[2].Title.Caption := 'ҵ�����';
      Columns[2].Width := 100;
      Columns[3].Title.Caption := '�ɽ��۸�';
      Columns[3].Width := 100;
      Columns[4].Title.Caption := '�ɽ����';
      Columns[4].Width := 100;
      Columns[5].Title.Caption := '�ɽ�����';
      Columns[5].Width := 100;
      Columns[6].Title.Caption := 'ҵ������';
      Columns[6].Width := 100;
      Columns[7].Title.Caption := '֤ȯ����';
      Columns[7].Width := 100;
      Columns[8].Title.Caption := '��������';
      Columns[8].Width := 100;
    end
    else if(tvZQYW.Selected.Text='������Ȩ') or (tvZQYW.Selected.Text='��������') then
    begin
      Columns[0].title.caption := 'ҵ������';
      columns[0].Width := 100;
      Columns[1].title.caption := '��������';
      columns[1].Width := 100;
      Columns[2].title.caption := 'ҵ�����';
      columns[2].Width := 100;
      Columns[3].title.caption := '�����г�';
      columns[3].Width := 100;
      Columns[4].title.caption := '֤ȯ����';
      columns[4].Width := 100;
      Columns[5].title.caption := '֤ȯ����';
      columns[5].Width := 100;
      Columns[6].title.caption := '�Ǽ�����';
      columns[6].Width := 100;
      Columns[7].title.caption := '�ֺ���';
      columns[7].Width := 100;
      Columns[8].title.caption := 'Ȩ�����';
      columns[8].Width := 100;
    end
    else if(tvZQYW.Selected.Text='ծȯ����') or (tvZQYW.Selected.Text='��Ϣת��')
         or (tvZQYW.Selected.Text='��Ϣ����') or (tvZQYW.Selected.Text='ծȯҵ��')then
    begin
      Columns[0].Title.Caption := '֤ȯ����';
      Columns[0].Width := 100;
      Columns[1].Title.Caption := 'ծȯ����';
      Columns[1].Width := 100;
      Columns[2].Title.Caption := '��������';
      Columns[2].Width := 100;
      Columns[3].Title.Caption := '���׷���';
      Columns[3].Width := 100;
      Columns[4].Title.Caption := '�����г�';
      Columns[4].Width := 100;
      Columns[5].Title.Caption := '�ɽ��۸�';
      Columns[5].Width := 100;
      Columns[6].Title.Caption := '�ɽ����';
      Columns[6].Width := 100;
      Columns[7].Title.Caption := '�ɽ�����';
      Columns[7].Width := 100;
      Columns[8].Title.Caption := '���ַ�';
      Columns[8].Width := 100;
      Columns[9].Title.Caption := 'ӡ��˰';
      Columns[9].Width := 100;
      Columns[10].Title.Caption := '������';
      Columns[10].Width := 100;
      Columns[11].Title.Caption := '֤�ܷ�';
      Columns[11].Width := 100;
      Columns[12].Title.Caption := 'Ӷ��';
      Columns[12].Width := 100;
      Columns[13].Title.Caption := '˰ǰ��Ϣ';
      Columns[13].Width := 100;
      Columns[14].Title.Caption := '˰����Ϣ';
      Columns[14].Width := 100;
      Columns[15].Title.Caption := '��Ϣ˰';
      Columns[15].Width := 100;
      Columns[16].Title.Caption := 'ҵ������';
      Columns[16].Width := 100;
    end
    else if(tvZQYW.Selected.Text='�ع�ҵ��') then
    begin
      Columns[0].Title.Caption := '֤ȯ����';
      Columns[0].Width := 100;
      Columns[1].Title.Caption := '�ع�����';
      Columns[1].Width := 100;
      Columns[2].Title.Caption := '�ع�����';
      Columns[2].Width := 100;
      Columns[3].Title.Caption := '�ɽ�����';
      Columns[3].Width := 100;
      Columns[4].Title.Caption := '��������';
      Columns[4].Width := 100;
      Columns[5].Title.Caption := '�ع�����';
      Columns[5].Width := 100;
      Columns[6].Title.Caption := '�����г�';
      Columns[6].Width := 100;
      Columns[7].Title.Caption := '�ɽ����';
      Columns[7].Width := 100;
      Columns[8].Title.Caption := '������';
      Columns[8].Width := 100;
    end
    else exit;
  end;

end;

// �������������������������������������������������������������������������������ճ�����

// ������ʾ TAB ʱ���в���
procedure TMainForm.tsRCCZShow(Sender: TObject);
begin
  // ͬ��ҵ������
  dtpRCCZYWRQ.DateTime := dtpMainForm.DateTime;
  // ���ú���ʵ�����ݵ�ˢ��
  tvRCCZOnChange(Sender);

end;

//  ����ѡ��� ��Ŀ���в�ͬ�������ʾ
procedure TMainForm.tvRCCZOnChange(Sender: TObject);
var TItem:Tlistitem;
    stringDate, stringDateNoYear,fileRealPath, fileRealName: String;
begin
    // ���ý�������label ���ɼ�
     lblRCCZCLJD.Caption := '��������';
     lblRCCZCLJD.Visible := False;
     lblRCCZCLJD.Update;
    // ��ȡ�ַ������͵����ڸ�ʽ�������������ļ����ļ���ƴ��
    stringDate := FileOperation.getStringOfDate(dtpRCCZYWRQ.DateTime);
    stringDateNoYear := FileOperation.getStringOfDateNoYear(dtpRCCZYWRQ.DateTime);
      // ����listviewͷ��
    lvRCCZ.Clear;
    lvRCCZ.Columns.Clear;
    lvRCCZ.Columns.Add;
    lvRCCZ.Columns.Add;
    lvRCCZ.Columns.Add;
    lvRCCZ.Columns.Add;
    lvRCCZ.Columns.Items[0].Caption:='״̬';
    lvRCCZ.Columns.Items[1].Caption:='�ӿ�����';
    lvRCCZ.Columns.Items[2].Caption:='·��';
    lvRCCZ.Columns.Items[3].Caption:='�ļ���';
    lvRCCZ.Columns.Items[0].Width:=80;
    lvRCCZ.Columns.Items[1].Width:=150;
    lvRCCZ.Columns.Items[2].Width:=400;
    lvRCCZ.Columns.Items[3].Width:=lvRCCZ.Width - 400 - 150 - 85;
    lvRCCZ.ViewStyle:=vsReport;
    lvRCCZ.GridLines:=True;

    lvRCCZ.Items.Clear;

    with UserADOQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from TJSLJ');
      Open;

      // ��ѯ���ݿ���������ݣ������������Ӧ�����ݲ��뵽 listView
      while not Eof do
      begin
        TItem:=lvRCCZ.Items.Add;
        TItem.Caption:='True';
        TItem.SubItems.Add(FieldByName('TJSLJ_JKMC').Value);
        // ��ȡ�ļ�����ʵ·������ʵ����
        fileRealPath := FieldByName('TJSLJ_WJLJ').Value + stringDate + '\';
        if(FieldByName('TJSLJ_WJMC').Value = 'cpxx*.txt') then
          fileRealName := 'cpxx' + stringDateNoYear + '.txt'
        else if (FieldByName('TJSLJ_WJMC').Value = 'securities_*.xml') then
          fileRealName := 'securities_' + StringDate + '.xml'
        else if (FieldByName('TJSLJ_WJMC').Value = 'mktdt00.txt') then
          fileRealName := 'mktdt00.txt'
        else if (FieldByName('TJSLJ_WJMC').Value = 'cashsecurityclosemd_*.xml') then
          fileRealName := 'cashsecurityclosemd_' + StringDate + '.xml'
        else if (FieldByName('TJSLJ_WJMC').Value = 'GH*.dbf') then
          fileRealName := 'GH32562.dbf'
        else if (FieldByName('TJSLJ_WJMC').Value = 'SJSMX1*.dbf') then
          fileRealName := 'SJSMX1' + StringDateNoYear + '.dbf'
        else if (FieldByName('TJSLJ_WJMC').Value = 'JSMX*.dbf') then
          fileRealName := 'JSMX'+ 'jsmr1' + '.dbf'
        else if (FieldByName('TJSLJ_WJMC').Value = 'ZQBD*.dbf') then
          fileRealName := 'ZQBD' + 'jsmr1' + '.dbf'
        else if (FieldByName('TJSLJ_WJMC').Value = 'SJSFX*.dbf') then
          fileRealName := 'SJSFX' + StringDateNoYear +'.dbf'
        else if (FieldByName('TJSLJ_WJMC').Value = 'SJSJG*.dbf') then
          fileRealName := 'SJSJG'+ StringDateNoYear + '.dbf';

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

// �Լ�������� listView �ĺ��������ÿһ�� Item �� Caption ΪTrue��Ҳ�����ļ�����
// ��ô�ͽ�������һ�еı�ˢ�����Ϊ ��ɫ
procedure TMainForm.customerDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
var DefaultDraw: Boolean );
begin
  if( Item.Caption = 'False') then
  begin
    Sender.Canvas.Font.Color :=clRed;
  end;
end;

// �������㰴ť������
procedure TMainForm.btnRZQSClick(Sender: TObject);
Var i:Integer;
    Titem2:Tlistitem;
begin
  // ����listView �е����ݽ��д���
  lblRCCZCLJD.Caption := '���ڴ���';
  lblRCCZCLJD.Visible :=True;
  pbRCCZ.Visible :=True;
  pbRCCZ.Min := 0;
  pbRCCZ.Max := 10;
  pbRCCZ.Position := pbRCCZ.Min;
  lblRCCZCLJD.Update;
  for i := 0 to lvRCCZ.Items.Count-1 do
  begin
    Titem2 := lvRCCZ.Items.Item[i];
    lblRCCZCLJD.Caption :=  Titem2.subItems.Strings[0];
    lblRCCZCLJD.Update;
    if( Titem2.Caption = 'True') then
      FileOperation.jkFileToDataBase(Titem2.subItems.Strings[0],
        Titem2.subItems.Strings[1],Titem2.subItems.Strings[2], dtpRCCZYWRQ.DateTime);
    pbRCCZ.Position := pbRCCZ.Position + 1;
  end;
  pbRCCZ.Position := pbRCCZ.Max;
  pbRCCZ.Visible :=False;
  lblRCCZCLJD.Caption := '�����ѵ��룬���ڽ��д�����';
  lblRCCZCLJD.Update;

//   TODO ���ô洢���̽���ҵ�����
  with UserADOQuery do
  begin
    Close;
    SQL.Clear;
//     ���ô洢���̽�����������
    SQL.Add('begin rzqs(:a); end;');
    Parameters.ParamByName('a').Value:= FormatDatetime('YYYY/MM/DD', dtpRCCZYWRQ.DateTime);
    ExecSQL;
  end;

  ShowMessage('���������Ѿ���ɣ���鿴��');
  lblRCCZCLJD.Caption := '������ɣ�';
  lblRCCZCLJD.Update;
end;

// �ָ���ť�����ã�ɾ���������еĽӿ�����
procedure TMainForm.btnRCCZRecoverClick(Sender: TObject);
begin
  if Application.MessageBox('ȷ��Ҫ�ָ�������','��ʾ',MB_YESNO)=ID_Yes then
  begin
    with UserADOQuery do
    begin
      Close;
      SQL.Clear;
      // ���ô洢���̽�������ɾ��
      SQL.Add('begin recoveryData(:a); end;');
      Parameters.ParamByName('a').Value:= FormatDatetime('YYYY/MM/DD', dtpRCCZYWRQ.DateTime);
      ExecSQL;
    end;
    ShowMessage('�����Ѿ��ָ���');
  end;

end;
// ����ƾ֤������ֱ�ӵ��ô洢����
procedure TMainForm.btnRCCZSCPZClick(Sender: TObject);
begin
  lblRCCZCLJD.Caption := '��������ƾ֤�����Ե�...';
  lblRCCZCLJD.Update;
  with UserADOQuery do
  begin
    Close;
    SQL.Clear;
    // ���ô洢���̽�������ƾ֤
    SQL.Add('begin scpz(:a); end;');
    Parameters.ParamByName('a').Value:= FormatDatetime('YYYY/MM/DD', dtpRCCZYWRQ.DateTime);
    ExecSQL;
  end;

  ShowMessage('ƾ֤�Ѿ����ɣ���鿴��');

  lblRCCZCLJD.Visible := False;
  lblRCCZCLJD.Update;
end;

//���ɹ�ֵ��
procedure TMainForm.Button1Click(Sender: TObject);
begin
  // ���ô洢�������ɹ�ֵ��
    with UserADOQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tkjkmye where tkjkmye_ywrq=:a');
      Parameters.ParamByName('a').Value:= FormatDatetime('YYYY/MM/DD', dtpRCCZYWRQ.DateTime);
      Open;
      if (RecordCount > 0) then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from tgz where tgz_ywrq=:a');
        Parameters.ParamByName('a').Value:= FormatDatetime('YYYY/MM/DD', dtpRCCZYWRQ.DateTime-1);
        Open;
        if (RecordCount > 0) then
        begin
          Close;
          SQL.Clear;
          SQL.Add('begin scgzb(:a); end;');
          Parameters.ParamByName('a').Value:= FormatDatetime('YYYY/MM/DD', dtpRCCZYWRQ.DateTime);
          ExecSQL;
        end
        else
        begin
          showmessage('ǰһ���ֵ��û�����ɣ��޷����ɵ��չ�ֵ��������');
          lblRCCZCLJD.Visible := False;
          exit;
        end
      end
      else
      begin
        showmessage('�������ɽ���Ļ�ƿ�Ŀ����������');
        lblRCCZCLJD.Visible := False;
        exit;
      end;
    end;

    if Application.MessageBox('��ֵ���Ѿ����ɣ�����ȥ�鿴��','��ʾ',MB_YESNO)=ID_Yes then
    begin
      PageControl1.ActivePage := tsBBCK;
      tvBBCKMenu.Items.Item[1].Selected := True;
      dtpBBCKYWRQ.DateTime  := dtpRCCZYWRQ.DateTime;
      tvBBCKOnChange(Sender);

    end;

    lblRCCZCLJD.Visible := False;
end;

// ���ɻ�ƿ�Ŀ����
procedure TMainForm.Button2Click(Sender: TObject);
begin
  // ���ô洢�������ɻ�ƿ�Ŀ����
    with UserADOQuery do
    begin
      {Close;          //�ж�T-1�ջ�ƿ�Ŀ�����Ƿ����
      SQL.Clear;
      SQL.Add('select * from tkjkmye where tkjkmye_ywrq=:a');
      Parameters.ParamByName('a').Value:= FormatDatetime('YYYY/MM/DD', dtpRCCZYWRQ.DateTime-1);
      Open;
      if (RecordCount > 0) then
      begin  }
        Close;
        SQL.Clear;
        SQL.Add('begin sckjkmyeb(:a); end;');
        Parameters.ParamByName('a').Value:= FormatDatetime('YYYY/MM/DD', dtpRCCZYWRQ.DateTime);
        ExecSQL;
      {end
      else
      begin
        showmessage('ǰһ���ƿ�Ŀ����û�����ɣ��޷����ɵ��ջ�ƿ�Ŀ����������');
        lblRCCZCLJD.Visible := False;
        exit;
      end; }
    end;
    if Application.MessageBox('��ƿ�Ŀ�����Ѿ����ɣ�����ȥ�鿴��','��ʾ',MB_YESNO)=ID_Yes then
    begin
      // ���� ActivePage ֮�� onshow ���������ã����е�ҳ������Ѿ�������
      PageControl1.ActivePage := tsBBCK;
      // ѡ����Ҫ�Ĺ���
      tvBBCKMenu.Items.Item[2].Selected := True;
      // ˢ�½���
      dtpBBCKYWRQ.DateTime  := dtpRCCZYWRQ.DateTime;
      tvBBCKOnChange(Sender);

    end;
    lblRCCZCLJD.Visible := False;
end;

// ƾ֤�����ť����
procedure TMainForm.btnPZLLClick(Sender: TObject);
begin
  PageControl1.ActivePage := tsBBCK;
  tvBBCKMenu.Items.Item[0].Selected := True;
  dtpBBCKYWRQ.DateTime  := dtpRCCZYWRQ.DateTime;
  tvBBCKOnChange(Sender);
end;

//�����������������������������������������������������������������������������������鿴����
procedure TMainForm.tsBBCKShow(Sender: TObject);
begin
//  if (tvBBCKMenu.Selected.Text = '') then
    tvBBCKMenu.Items.Item[0].Selected:=True;
  // ͬ��ҵ������
  dtpBBCKYWRQ.DateTime := dtpMainForm.DateTime;
  // ���ú���ʵ�����ݵ�ˢ��
  tvBBCKOnChange(Sender);

  tvBBCKMenu.HideSelection := False;

end;

procedure TMainForm.tvBBCKOnChange(Sender: TObject);
begin
  with UserADOQUery do
  begin
    Close;
    SQL.Clear;
    if (tvBBCKMenu.Selected.Text = 'ƾ֤�鿴') then
    begin
      lblBCKTitle.Caption := 'ƾ֤�鿴';
      SQL.Add('select tpzmx_flbh,tpzmx_kmdm,tpzmx_kmmc,tpzmx_ywlb,tpzmx_ywzy,tpzmx_je,'+
              'tpzmx_sl,tpzmx_jdfx from tpzmx where tpzmx_pzrq=:a order by tpzmx_flbh');
      Parameters.ParamByName('a').Value := FormatDatetime('YYYY/MM/DD', dtpBBCKYWRQ.DateTime);
      Open;

      // Ҳ������ ��ѯ��������� �����ķ�ʽ�ﵽ��������Ч��
//       ���ñ�ͷ
      dbgrdBBCK.Columns[0].Title.caption := '��Ŀ����';
      dbgrdBBCK.Columns[0].Width := 30;
      dbgrdBBCK.Columns[1].Title.caption := '��Ŀ����';
      dbgrdBBCK.Columns[1].Width := 100;
      dbgrdBBCK.Columns[2].Title.caption := '��Ŀ����';
      dbgrdBBCK.Columns[2].Width := 250;
      dbgrdBBCK.Columns[3].Title.caption := 'ҵ�����';
      dbgrdBBCK.Columns[3].Width := 125;
      dbgrdBBCK.Columns[4].Title.caption := 'ҵ��ժҪ';
      dbgrdBBCK.Columns[4].Width := 250;
      dbgrdBBCK.Columns[5].Title.caption := '���';
      dbgrdBBCK.Columns[5].Width := 75;
      dbgrdBBCK.Columns[6].Title.caption := '����';
      dbgrdBBCK.Columns[6].Width := 50;
      dbgrdBBCK.Columns[7].Title.caption := '�������';
      dbgrdBBCK.Columns[7].Width := 60;

//      ShowScrollBar(dbgrdBBCK.Handle, SB_HORZ, False); //���غ��������

    end
    else if(tvBBCKMenu.Selected.Text = '��ֵ���鿴') then
    begin
      lblBCKTitle.Caption := '��ֵ���鿴';

      SQL.Add('select tgz_kmdm,tgz_kmmc,tgz_sl,tgz_dwcb,tgz_zcb,'+
      'tgz_cbzjz,tgz_sj,tgz_zsz,tgz_szzjz,tgz_gzzz ' +
      'from tgz where tgz_ywrq=:a');

      Parameters.ParamByName('a').Value := FormatDatetime('YYYY/MM/DD', dtpBBCKYWRQ.DateTime);
      Open;

      // Ҳ������ ��ѯ��������� �����ķ�ʽ�ﵽ��������Ч��
//       ���ñ�ͷ
      dbgrdBBCK.Columns[0].Title.caption := '��Ŀ����';
      dbgrdBBCK.Columns[0].Width := 100;
      dbgrdBBCK.Columns[1].Title.caption := '��Ŀ����';
      dbgrdBBCK.Columns[1].Width := 120;
      dbgrdBBCK.Columns[2].Title.caption := '����';
      dbgrdBBCK.Columns[2].Width := 75;
      dbgrdBBCK.Columns[3].Title.caption := '��λ�ɱ�';
      dbgrdBBCK.Columns[3].Width := 75;
      dbgrdBBCK.Columns[4].Title.caption := '�ܳɱ�';
      dbgrdBBCK.Columns[4].Width := 100;
      dbgrdBBCK.Columns[5].Title.caption := '�ɱ�ռ��ֵ';
      dbgrdBBCK.Columns[5].Width := 75;
      dbgrdBBCK.Columns[6].Title.caption := '�м�';
      dbgrdBBCK.Columns[6].Width := 75;
      dbgrdBBCK.Columns[7].Title.caption := '����ֵ';
      dbgrdBBCK.Columns[7].Width := 100;
      dbgrdBBCK.Columns[8].Title.caption := '��ֵռ��ֵ';
      dbgrdBBCK.Columns[8].Width := 120;
      dbgrdBBCK.Columns[9].Title.caption := '��ֵ��ֵ';
      dbgrdBBCK.Columns[9].Width := 120;

//      ShowScrollBar(dbgrdBBCK.Handle, SB_HORZ, False); //���غ��������

    end
    else
    begin
      lblBCKTitle.Caption := '��ƿ�Ŀ�����鿴';

      SQL.Add('select tkjkmye_kmdm,tkjkmye_kmmc,tkjkmye_jdfx,tkjkmye_jffsje,'+
      'tkjkmye_dffsje,tkjkmye_ye from tkjkmye where tkjkmye_ywrq=:a');

      Parameters.ParamByName('a').Value := FormatDatetime('YYYY/MM/DD', dtpBBCKYWRQ.DateTime);
      Open;

      // Ҳ������ ��ѯ��������� �����ķ�ʽ�ﵽ��������Ч��
//       ���ñ�ͷ
      dbgrdBBCK.Columns[0].Title.caption := '��Ŀ����';
      dbgrdBBCK.Columns[0].Width := 120;
      dbgrdBBCK.Columns[1].Title.caption := '��Ŀ����';
      dbgrdBBCK.Columns[1].Width := 220;
      dbgrdBBCK.Columns[2].Title.caption := '�������';
      dbgrdBBCK.Columns[2].Width := 75;
      dbgrdBBCK.Columns[3].Title.caption := '�跽�������';
      dbgrdBBCK.Columns[3].Width := 150;
      dbgrdBBCK.Columns[4].Title.caption := '�����������';
      dbgrdBBCK.Columns[4].Width := 150;
      dbgrdBBCK.Columns[5].Title.caption := '���';
      dbgrdBBCK.Columns[5].Width := 150;

//      ShowScrollBar(dbgrdBBCK.Handle, SB_HORZ, False); //���غ��������
    end;
  end;

end;

// ��������
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

// ��������Ϊ�� ��ô���滻Ϊ 0
procedure TMainForm.EditBumberLeave(Sender: TObject);
begin
  if Trim(TEdit(Sender).text) = '' then  TEdit(Sender).text := '0';
end;


// �����ֹ����¼�
procedure TMainForm.OnMouseWheel(Var Msg : TMsg; Var Handled : Boolean);
begin
  try //ע�⣬����ʹ���ݴ�������Ŀ�������ο�������Ĵ���
  if (Msg.message = WM_MouseWheel)
      and (Screen.ActiveForm.ActiveControl.ClassName='TDBGrid')
      {or (Screen.ActiveForm.ActiveControl.ClassName='TDBGridInplaceEdit')}
      then
  begin
    if Msg.wParam > 0 then
      SendMessage(Screen.ActiveForm.ActiveControl.Handle,
      WM_VSCROLL,
      SB_LINEUP, //SB_PAGEUP��ҳ�Ϲ���SB_LINEUP�����Ϲ�
      0)
    else
      SendMessage(Screen.ActiveForm.ActiveControl.Handle,
      WM_VSCROLL,
      SB_LINEDOWN, //SB_PAGEDOWN��ҳ�¹���SB_LINEDOWN�����¹�
      0);
    Handled:= True;
  end;
  except
  end;
end;






end.














