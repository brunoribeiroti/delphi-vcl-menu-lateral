# Menu-VCL

Menu estilo Lateral

Este exemplo esta focado na parte de otimização de código contem duas funções

abrirFormulario:
	Esta função faz a abertura do form, atraves do nome do botão.
	Não há necessidade de importar a uses, ou de fazer declaração.
	Como os form serão chamados sem sua prévia declaraão sera necessario
	registrar cada form isso é feito no initialization de cada form.
	
abrirSubMenu:
	Esta função Manipula a abertura e fechamento do menu.
	

Ambas as funções são declaradas dentro das procedures do delphi, para que
as mesmas sejam chamadas diretamente no evento do componente sem a necessidade
de criar eventos para cada componente.

