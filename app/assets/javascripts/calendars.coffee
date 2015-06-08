ts = 'YYYY/MM/DD'

hermes.calendar = (date) ->
  appointments = $('#appointments')
  picker = $('#calendar')

  picker.datetimepicker
    inline: true
    locale: 'pt-br'
    defaultDate: moment(date, ts)

  picker.on 'dp.change', (ev) ->
    next = ev.date.format(ts)
    location.assign("/calendar/#{next}")
