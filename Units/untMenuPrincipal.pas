unit untMenuPrincipal;

interface

uses
  SysUtils, StrUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Buttons, Vcl.ExtCtrls, Vcl.Menus, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.Themes, Vcl.Styles, Vcl.ComCtrls;

type
  TfrmMenuPrincipal = class(TForm)
    pnlMenu: TPanel;
    pnlMenuCategoria1: TPanel;
    btnMenuCategoria1: TSpeedButton;
    pnlMenuCategoria3: TPanel;
    btnMenuCategoria3: TSpeedButton;
    pnlMenuCategoria2: TPanel;
    btnMenuCategoria2: TSpeedButton;
    pnlMenuCategoria5: TPanel;
    btnMenuCategoria5: TSpeedButton;
    pnlMenuCategoria4: TPanel;
    btnMenuCategoria4: TSpeedButton;
    pnlSubMenuCategoria1: TPanel;
    btnOpcao1: TSpeedButton;
    btnOpcao2: TSpeedButton;
    btnOpcao3: TSpeedButton;
    btnOpcao5: TSpeedButton;
    btnOpcao4: TSpeedButton;
    pnlSubMenuCategoria2: TPanel;
    pnlSubMenuCategoria3: TPanel;
    pnlSubMenuCategoria4: TPanel;
    pnlSubMenuCategoria5: TPanel;
    btnCat2Op1: TSpeedButton;
    btnCat2Op2: TSpeedButton;
    btnCat2Op3: TSpeedButton;
    procedure abrirSubMenu(Sender: TObject);
    procedure abrirFormulario(Sender : TObject);
  private
  public
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;

implementation

{$R *.dfm}

procedure TfrmMenuPrincipal.abrirFormulario(Sender: TObject);
var
  Formulario  : TForm;
  FormularioClasse : TFormClass;
  NomeFormulario : string;
begin

  //Chamar a função para que menu seja fechado
  abrirSubMenu(Sender);

  NomeFormulario := StringReplace(TSpeedButton(Sender).Name, 'btn', 'Tfrm', [rfReplaceAll]);
  try
    FormularioClasse  := TFormClass(FindClass(NomeFormulario));
    Formulario  := FormularioClasse.Create(Application);

    Formulario.ShowModal;
  except
    on E: EClassNotFound do
    begin
      ShowMessage('Não foi possivel encontrar a Tela solicitada!');
    end;
  end;

end;

procedure TfrmMenuPrincipal.abrirSubMenu(Sender: TObject);
var
  NomePanelMenu, NomePanelSubMenu: string;
  i, dimensao : Integer;
begin


  // Definir qual vai ser o painel manipulado atraves do nome do SpeedButton
  NomePanelMenu := StringReplace(TSpeedButton(Sender).Name, 'btn', 'pnl', [rfReplaceAll]);
  NomePanelSubMenu := StringReplace(TSpeedButton(Sender).Name, 'btn', 'pnlSub', [rfReplaceAll]);
  dimensao := 33;

  //percorre os componentes da tela
  for i := ComponentCount - 1 downto 0 do
  begin

    //Quando encontrar um Painel Menu diferente do clicado feche
       if (Copy(TPanel(Components[i]).Name, 1, 7) = 'pnlMenu') and
          (TPanel(Components[i]).Height <> 33) and
          (TPanel(Components[i]).Name <> NomePanelMenu) then
            TPanel(Components[i]).Height := 33;

    //Calcular a dimensão que sera necessario para o painel expandir
    if Components[i].GetParentComponent = TPanel(FindComponent(NomePanelSubMenu)) then
    begin
      dimensao := dimensao + 33;
    end;

  end;

  // Setar a dimessão no componente
  if TPanel(FindComponent(NomePanelMenu)).Height = 33 then
  begin
    TPanel(FindComponent(NomePanelMenu)).Height := dimensao;
  end else
      begin
        TPanel(FindComponent(NomePanelMenu)).Height := 33;
      end;

end;

end.
