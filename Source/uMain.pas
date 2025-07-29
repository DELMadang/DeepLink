unit uMain;

interface

uses
  System.SysUtils,
  System.Classes,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    Memo1: TMemo;
  private
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  uDeepLink;

constructor TfrmMain.Create(AOwner: TComponent);
begin
  inherited;

  DeepLink.Register('myapp', 'Deeplinks Demo', ParamStr(0));

  if ParamCount < 1 then
    Exit;

  var LPayload := DeepLink.Extract(ParamStr(1), 'myapp');

  ShowMessage(LPayload);
end;

end.
