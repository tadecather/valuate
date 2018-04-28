program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {LoginForm},
  Unit2 in 'Unit2.pas' {MainForm},
  Unit3 in 'Unit3.pas' {UserForm},
  JYFLForm in 'JYFLForm.pas' {JYFLForm1},
  STLFForm in 'STLFForm.pas' {STLFForm1},
  JKLJForm in 'JKLJForm.pas' {JKLJForm1},
  ZQXXZQForm in 'ZQXXZQForm.pas' {ZQXXZQForm1},
  ZQXXGPForm in 'ZQXXGPForm.pas' {ZQXXGPForm1},
  ZQXXHGForm in 'ZQXXHGForm.pas' {ZQXXHGForm1},
  KJKMForm in 'KJKMForm.pas' {KJKMForm1},
  DataManageGPForm in 'DataManageGPForm.pas' {DataManageGPForm1},
  ZQYWGPJYForm in 'ZQYWGPJYForm.pas' {ZQYWGPJYForm1},
  ZQYWHGForm in 'ZQYWHGForm.pas' {ZQYWHGForm1},
  ZQYWDXForm in 'ZQYWDXForm.pas' {ZQYWDXForm1},
  ZQYWXGForm in 'ZQYWXGForm.pas' {ZQYWXGForm1},
  FileOperation in 'FileOperation.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TLoginForm, LoginForm);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TUserForm, UserForm);
  Application.CreateForm(TJYFLForm1, JYFLForm1);
  Application.CreateForm(TSTLFForm1, STLFForm1);
  Application.CreateForm(TJKLJForm1, JKLJForm1);
  Application.CreateForm(TZQXXZQForm1, ZQXXZQForm1);
  Application.CreateForm(TZQXXGPForm1, ZQXXGPForm1);
  Application.CreateForm(TZQXXHGForm1, ZQXXHGForm1);
  Application.CreateForm(TKJKMForm1, KJKMForm1);
  Application.CreateForm(TDataManageGPForm1, DataManageGPForm1);
  Application.CreateForm(TZQYWGPJYForm1, ZQYWGPJYForm1);
  Application.CreateForm(TZQYWHGForm1, ZQYWHGForm1);
  Application.CreateForm(TZQYWDXForm1, ZQYWDXForm1);
  Application.CreateForm(TZQYWXGForm1, ZQYWXGForm1);
  Application.Run;
end.
