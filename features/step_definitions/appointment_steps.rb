Dado(/^que eu estou na página de novo compromisso$/) do
  visit '/appointments/new'
end

Dado(/^que eu preenchi um formulário de compromisso$/) do
  within('#new_appointment') do
    fill_in 'Nome', with: 'Jane Doe'
    fill_in 'DDD', with: '11'
    fill_in 'Telefone', with: '987654321'
    find_by_id('appointment_begin_at').set(3.days.from_now)
  end
end

Quando(/^eu clicar em 'Salvar'$/) do
  click_button 'Salvar'
end

Então(/^o compromisso será adicionado$/) do
  expect(page).to have_content('Compromisso adicionado')
end
