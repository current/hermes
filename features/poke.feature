# language: pt
Funcionalidade: Notificação

  Para lembrar um cliente de uma consulta
  Como gerente de um consultório
  Eu quero que a aplicação notifique o cliente

  Cenário: Notificar um cliente em um determinado horário
    Dado que há uma notificação para às "14:00"
    Quando for "14:01"
    Então o cliente foi notificado
