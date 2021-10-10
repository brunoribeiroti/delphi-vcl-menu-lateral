unit untOpcao1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfrmOpcao1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOpcao1: TfrmOpcao1;

implementation

{$R *.dfm}
{Registrarmos a class no próprio formulário}
initialization
   RegisterClass(TfrmOpcao1)
finalization
   UnRegisterClass(TfrmOpcao1);
end.
