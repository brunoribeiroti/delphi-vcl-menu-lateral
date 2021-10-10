# Menu-VCL Estilo Lateral
## Este exemplo esta focado na parte de otimização de código contem duas funções

### abrirFormulario:
	//Esta função faz a abertura do form, atraves do nome do botão. 
	//Não há necessidade de importar a uses, ou de fazer declaração. 
	//Como os form serão chamados sem sua prévia declaraão 	
	//sera necessario registrar cada form isso é feito no initialization de cada form.
	
	procedure TfrmMenuPrincipal.abrirFormulario(Sender: TObject);
	var
	  Formulario  : TForm;
	  FormularioClasse : TFormClass;
	  NewTabSheet : TTabSheet;
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
	  i, j, k: Integer;
	  dimensao: Double;
	begin

	  // Definir qual vai ser o painel manipulado araves do nome do SpeedButton
	  NomePanelMenu := StringReplace(TSpeedButton(Sender).Name, 'btn', 'pnl',
	    [rfReplaceAll]);
	  NomePanelSubMenu := StringReplace(TSpeedButton(Sender).Name, 'btn', 'pnlSub',
	    [rfReplaceAll]);
	  dimensao := 33;

	  // Encontrar PanelMenu
	  for i := ComponentCount - 1 downto 0 do
	  begin

	    if (Copy(TPanel(Components[i]).Name, 1, 7) = 'pnlMenu') and
	      (TPanel(Components[i]).Name <> NomePanelMenu) then
	    begin
	      TPanel(Components[i]).Height := 33;
	    end;

	    if TPanel(Components[i]).Name = NomePanelMenu then
	    begin

	      // Encontrar PanelSubMenu
	      for j := ComponentCount - 1 downto 0 do
	      begin
		if TPanel(Components[j]).Name = NomePanelSubMenu then
		begin
		  dimensao := 33;
		  // Calcular a dimenssão
		  for k := ComponentCount - 1 downto 0 do
		  begin
		    if Components[k].GetParentComponent = TPanel(Components[j]) then
		    begin
		      dimensao := dimensao + 33;
		    end;
		  end;

		  // Setar a dimessão no componente
		  if TPanel(Components[i]).Height = 33 then
		  begin
		    TPanel(Components[i]).Height := Trunc(dimensao);
		  end
		  else
		  begin
		    TPanel(Components[i]).Height := 33;
		  end;
		end;
	      end;
	    end;
	  end;
	end;

Ambas as funções são declaradas dentro das procedures do delphi, para que
as mesmas sejam chamadas diretamente no evento do componente sem a necessidade
de criar eventos para cada componente.

