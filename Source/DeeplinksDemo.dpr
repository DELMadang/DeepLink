program DeeplinksDemo;

uses
  Vcl.Forms,
  FormMain_u in 'D:\OpenSource\delphi\delphi-vcl-deeplinks-demo\Forms\FormMain_u.pas' {FormMain},
  UtilDeeplinks in 'D:\OpenSource\delphi\delphi-vcl-deeplinks-demo\Utils\UtilDeeplinks.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
