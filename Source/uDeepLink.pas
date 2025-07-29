unit uDeepLink;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Win.Registry,
  System.NetEncoding,
  System.StrUtils;

type
  DeepLink = record
  public
    class function  Extract(const AURI, AProtocol: string): string; static;
    class procedure &Register(const AProtocol, AAppName, APath: string); static;
  end;

implementation

class procedure DeepLink.&Register(const AProtocol, AAppName, APath: string);
begin
  var LReg := TRegistry.Create;
  try
    LReg.RootKey := HKEY_CURRENT_USER;

    if LReg.OpenKey('\Software\Classes\' + AProtocol, True) then
    begin
      LReg.WriteString('', 'URL:' + AProtocol);
      LReg.WriteString('URL Protocol', '');
      LReg.CloseKey;
    end;

    if LReg.OpenKey('\Software\Classes\' + AProtocol + '\shell', True) then
    begin
      LReg.CloseKey;
    end;

    if LReg.OpenKey('\Software\Classes\' + AProtocol + '\shell\open', True) then
    begin
      LReg.CloseKey;
    end;

    if LReg.OpenKey('\Software\Classes\' + AProtocol + '\shell\open\command', True) then
    begin
      LReg.WriteString('', '"' + APath + '" "%1"');
      LReg.CloseKey;
    end;
  finally
    LReg.Free;
  end;
end;

class function DeepLink.Extract(const AURI, AProtocol: string): string;
begin
  var LDelimiter := AProtocol + '://';
  var LIndex := Pos(LDelimiter, AURI);

  Result := '';
  if (LIndex > 0) then
  begin
    Result := Copy(AURI, LIndex + Length(LDelimiter), MaxInt);
    Result := TNetEncoding.URL.Decode(Result);
  end;
end;

end.
