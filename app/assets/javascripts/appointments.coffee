ts = 'YYYY-MM-DD HH:mm:ss ZZ'

hermes.appointment = ->
  input = $('#appointment_begin_at')
  picker = $('#calendar')

  picker.datetimepicker
    inline: true
    locale: 'pt-br'
    sideBySide: true
    stepping: 15

  dp = picker.data('DateTimePicker')

  if input.val() is ''
    picker.trigger 'db.change'
  else
    dp.date moment(input.val(), ts)

  picker.on 'dp.change', ->
    input.val dp.date().format(ts)
