change = ->
  picker = $('div.datepicker')
  input = $("[name='appointment[begin_at]']")

  picker.datepicker
     language: 'pt-BR'
     todayHighlight: true
     todayBtn: true

  picker.on 'changeDate', ->
    input.val picker.datepicker('getDate')


$(document).on('page:change', change)
