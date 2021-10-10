program MenuVCL;

uses
  Vcl.Forms,
  untMenuPrincipal in 'Units\untMenuPrincipal.pas' {frmMenuPrincipal},
  untOpcao1 in 'Units\untOpcao1.pas' {frmOpcao1},
  untOpcao2 in 'Units\untOpcao2.pas' {frmOpcao2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  Application.CreateForm(TfrmOpcao1, frmOpcao1);
  Application.CreateForm(TfrmOpcao2, frmOpcao2);
  Application.Run;
end.
