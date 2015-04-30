# language: pt
Funcionalidade: Notificação por SMS

  Para lembrar um cliente de uma consulta
  Como gerente de um consultório
  Eu quero que a aplicação notifique o cliente via SMS

  Cenário: Notificar um cliente em um determinado horário por SMS
    Dado que há uma notificação para às "14:00"
    E que a notificação será por SMS
    Quando for "14:01"
    Então o cliente foi notificado via SMS
