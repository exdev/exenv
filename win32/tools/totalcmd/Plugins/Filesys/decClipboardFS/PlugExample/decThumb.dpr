library decThumb;

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Controls,
  Graphics,
  Forms,
  IniFiles,
  decThumbOptionFormUnit in 'decThumbOptionFormUnit.pas' {ThumbOptionForm};

{$E dcf}

function Min(A, B: integer): integer;
begin
  if A < B then Result := A
           else Result := B;
end;

function Max(A, B: integer): integer;
begin
  if A > B then Result := A
           else Result := B;
end;

function CalcThumbSize(SourceWidth, SourceHeight, MaxWidth, MaxHeight: integer; MaxMul: integer = 0; Stretch: boolean = false): TPoint;
begin
  with Result do begin
    X := 0;
    Y := 0;
    if (SourceWidth = 0) or (SourceHeight = 0) then exit;
    if Stretch then
      begin
        X := MaxWidth;
        Y := MaxHeight;
      end
    else
      begin
        if MaxMul > 0 then
          begin
            X := Min(Round(Sqrt(SourceWidth * MaxMul / SourceHeight)), MaxWidth);
            Y := Round(X * SourceHeight / SourceWidth);
            if Y > MaxHeight then
              begin
                Y := MaxHeight;
                X := Trunc(Y * SourceWidth / SourceHeight);
              end;
          end
        else
          begin
            X := MaxWidth;
            Y := Round(X * SourceHeight / SourceWidth);
            if Y > MaxHeight then
              begin
                Y := MaxHeight;
                X := Round(Y * SourceWidth / SourceHeight);
              end;
          end;
        if (SourceWidth < X) and (SourceHeight < Y) then
          begin
            X := SourceWidth;
            Y := SourceHeight;
          end;
      end;
  end;
end;

procedure Format2ResetOptions(AHandle: THandle); stdcall; forward;

// Инициализация
// Можно не реализовавыть
function Format2Init: THandle; stdcall;
begin
  Result := THandle(New(PSize));
  Format2ResetOptions(Result);
end;

// Уникальный GUID формата
procedure Format2GetGUID(var Guid: TGUID); stdcall;
begin
  Guid := StringToGUID('{208F9D4C-F55E-4CBD-8DF7-0A8506E23B44}');
end;

// Обрабатываемый формат
function Format2GetID(AReserved: integer): word; stdcall;
begin
  Result := CF_BITMAP;
end;

// Имя файла по умолчанию
function Format2GetFileName(AHandle: THandle; AReserved: integer; ABuff: PChar; AMax: integer): integer; stdcall;
const FN = 'Thumb.bmp'#0;
begin
  Result := Min(Length(FN), AMax);
  CopyMemory(ABuff, @FN[1], Result);
end;

// Начало чтения данных из буфера.
// AID может не совпадать со значением, возвращаемым FormatGetID
function Format2BeginRead(AHandle: THandle; AID: word): THandle; stdcall;
var M: TMemoryStream;
    B, B2: TBitmap;
    S: TPoint;
begin
  M := TMemoryStream.Create;
  Result := THandle(M);
  try
    B := TBitmap.Create;
    try
      B.LoadFromClipboardFormat(AID, GetClipboardData(AID), GetClipboardData(CF_PALETTE));
      B2 := TBitmap.Create;
      try
        with B2 do begin
          PixelFormat := B2.PixelFormat;
          S := CalcThumbSize(B.Width, B.Height, PSize(AHandle).cx, PSize(AHandle).cy);
          Width  := S.X;
          Height := S.Y;
          Canvas.StretchDraw(Canvas.ClipRect, B);
          B2.SaveToStream(M);
        end;
      finally
        B2.Free;
      end;
    finally
      B.Free;
    end;
  except
    M.Size := 0;
  end;
  M.Position := 0;
end;

// Размер данных
// Если не известен, возвратите -1 или не реализовывайте
function Format2GetDataLength(AHandle: THandle; AData: THandle): integer; stdcall;
begin
  Result := TMemoryStream(AData).Size;
end;

// Получение очередной порции данных
// ABuff - адрес буфера, ASize - размер буфера
// Возвращается количество реально переданных байт
// Данные закончились - верните ноль.
function Format2GetData(AHandle: THandle; AData: THandle; ABuff: Pointer; ASize: integer): integer; stdcall;
begin
  with TMemoryStream(AData) do begin
    Result := Min(ASize, Size - Position);
    CopyMemory(ABuff, pointer(integer(Memory) + Position), Result);
    Position := Position + Result;
  end;
end;

// Окончание чтения данных
procedure Format2EndRead(AHandle: THandle; AData: THandle); stdcall;
begin
  TMemoryStream(AData).Free;
end;

// Показ окна 'Optinos'
// Можно не реализовавыть
procedure Format2ShowOptions(AHandle: THandle; AOwnerCenter: TPoint; AMainWin: THandle); stdcall;
begin
  try
    try
      Application.Handle := AMainWin;
      with TThumbOptionForm.Create(Application) do
        try
          Icon.Handle := SendMessage(AMainWin, WM_GETICON, ICON_SMALL2, 0);
          Width := PSize(AHandle).cx;
          Height := PSize(AHandle).cx;
          Left := AOwnerCenter.X - Width div 2;
          Top := AOwnerCenter.Y - Height div 2;
          if ShowModal = mrOk then
            begin
              PSize(AHandle).cx := Width;
              PSize(AHandle).cx := Height;
            end;
        finally
          Free;
        end;
    finally
      Application.Handle := 0; // !!! Иначе Total вылетает
    end;
  except
  end;
end;

const
  SSection = 'decThumb';
  SWidth   = 'Width';
  SHeight  = 'Height';

// Получение дополнительных параметров для сохранения
// Размер буфера = FormatGetOptionsSize
// Можно не реализовавыть
procedure Format2LoadOptions(AHandle: THandle; AFileName: PChar); stdcall;
var Ini: TIniFile;
begin
  Format2ResetOptions(AHandle);
  Ini := TIniFile.Create(AFileName);
  try
    PSize(AHandle).cx := Ini.ReadInteger(SSection, SWidth, PSize(AHandle).cx);
    PSize(AHandle).cy := Ini.ReadInteger(SSection, SHeight, PSize(AHandle).cy);
  finally
    Ini.Free;
  end;
end;

// Передача количеста байт дополнительных пвраметров
// Размер буфера = FormatGetOptionsSize
// Можно не реализовавыть
procedure Format2SaveOptions(AHandle: THandle; AFileName: PChar); stdcall;
var Ini: TIniFile;
begin
  Ini := TIniFile.Create(AFileName);
  try
    Ini.WriteInteger(SSection, SWidth, PSize(AHandle).cx);
    Ini.WriteInteger(SSection, SHeight, PSize(AHandle).cy);
  finally
    Ini.Free;
  end;
end;

procedure Format2ResetOptions(AHandle: THandle); stdcall;
begin
  PSize(AHandle).cx := 256;
  PSize(AHandle).cy := 192;
end;

const FS_EXEC_OK       =  0;
      FS_EXEC_ERROR    =  1;
      FS_EXEC_YOURSELF = -1;
      FS_EXEC_SYMLINK  = -2;

// Запуск
// Можно не реализовавыть
function Format2ExecuteFile(AHandle: THandle; ABuff: Pointer; ASize: integer; MainWin: THandle; RemoteName, Verb: PChar): integer; stdcall;
begin
  Result := FS_EXEC_YOURSELF;
end;

const FS_ICONFLAG_SMALL         = 1;
      FS_ICONFLAG_BACKGROUND    = 2;
      FS_ICON_USEDEFAULT        = 0;
      FS_ICON_EXTRACTED         = 1;
      FS_ICON_EXTRACTED_DESTROY = 2;
      FS_ICON_DELAYED           = 3;

// Получение иконки файла
// ABuff - адрес буфер с данными, ASize - размер буфера с данными
// Можно не реализовавыть
function Format2ExtractCustomIcon(AHandle: THandle; ABuff: Pointer; ASize: integer; RemoteName: PChar; ExtractFlags: integer; var TheIcon: hicon): integer; stdcall;
begin
  Result := FS_ICON_USEDEFAULT;
end;

// Финализация
// Можно не реализовавыть
procedure Format2Done(AHandle: THandle); stdcall;
begin
  Dispose(PSize(AHandle));
end;

exports
  Format2Init,
  Format2GetGUID,
  Format2GetID,
  Format2GetFileName,
  Format2BeginRead,
  Format2GetDataLength,
  Format2GetData,
  Format2EndRead,
  Format2ShowOptions,
  Format2LoadOptions,
  Format2saveOptions,
  Format2ResetOptions,
  Format2ExecuteFile,
  Format2ExtractCustomIcon,
  Format2Done;

begin



end.
