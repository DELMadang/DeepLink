program DeeplinksDemo;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uDeepLink in 'uDeepLink.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
