# language: pt
Funcionalidade: Compromisso

  Para lembrar os clientes
  Como gerente de um consultório
  Eu quero poder gerenciar os compromissos

  Cenário: Cadastrar um compromisso
    Dado que eu estou na página de novo compromisso
    E que eu preenchi um formulário de compromisso
    Quando eu clicar em 'Salvar'
    Então o compromisso será adicionado
