# Menu-VCL Estilo Lateral
## Este exemplo esta focado na parte de otimização de código contem duas funções
Video explicativo
https://youtu.be/gw8XMchEBAg

### abrirFormulario:
	//Esta função faz a abertura do form, atraves do nome do botão. 
	//Não há necessidade de importar a uses, ou de fazer declaração. 
	//Como os form serão chamados sem sua prévia declaraão 	
	//sera necessario registrar cada form isso é feito no initialization de cada form.
	
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

### abrirSubMenu:
	//Esta função Manipula a abertura e fechamento do menu.
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

Ambas as funções são declaradas dentro das procedures do delphi, para que
as mesmas sejam chamadas diretamente no evento do componente sem a necessidade
de criar eventos para cada componente.

