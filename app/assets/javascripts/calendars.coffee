hermes.calendar = ->
  picker = $('#calendar')

  picker.datetimepicker
    inline: true
    locale: 'pt-br'

  dp = picker.data('DateTimePicker')

  picker.on 'dp.change', ->
    throw 'Atualizar a listagem'
    date = dp.date().format('YYYY/MM/DD')
