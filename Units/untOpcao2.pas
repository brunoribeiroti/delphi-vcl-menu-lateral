unit untOpcao2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfrmOpcao2 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOpcao2: TfrmOpcao2;

implementation

{$R *.dfm}
{Registrarmos a class no próprio formulário}
initialization
   RegisterClass(TfrmOpcao2)
finalization
   UnRegisterClass(TfrmOpcao2);
end.
