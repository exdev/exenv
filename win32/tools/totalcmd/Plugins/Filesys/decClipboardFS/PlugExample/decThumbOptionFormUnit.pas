unit decThumbOptionFormUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls;

type
  TThumbOptionForm = class(TForm)
    OkButton: TButton;
    CancelButton: TButton;
    procedure FormResize(Sender: TObject);
  end;

implementation

{$R *.dfm}

procedure TThumbOptionForm.FormResize(Sender: TObject);
begin
  Caption := Format('Thumb size: %dx%d', [Width, Height]);

end;

end.
