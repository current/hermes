hermes.appointment = ->
  ts = 'YYYY-MM-DD HH:mm:ss ZZ'

  input = $('#appointment_begin_at')
  picker = $('#calendar')

  picker.datetimepicker
    inline: true
    locale: 'pt-br'
    sideBySide: true
    stepping: 15

  dp = picker.data('DateTimePicker')

  picker.on 'dp.change', ->
    input.val dp.date().format(ts)

  if input.val() is ''
    picker.trigger 'dp.change'
  else
    dp.date moment(input.val(), ts)

hermes.appointments = (date) ->
  ts = 'YYYY/MM/DD'

  appointments = $('#appointments')
  picker = $('#calendar')

  picker.datetimepicker
    inline: true
    locale: 'pt-br'
    defaultDate: moment(date, ts)

  picker.on 'dp.change', (ev) ->
    next = ev.date.format(ts)
    Turbolinks.visit("/appointments/#{next}")
