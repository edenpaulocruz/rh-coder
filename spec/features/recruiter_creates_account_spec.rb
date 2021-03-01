require 'rails_helper'

feature 'Recruiter creates account' do
  scenario 'from index page' do
    visit root_path

    expect(page).to have_content('RH Coders')
    expect(page).to have_link('Recrutadores', href: recruiter_session_path)
  end

  scenario 'return to index page' do
    visit root_path
    click_on 'Recrutadores'

    expect(page).to have_link('RH Coders', href: root_path)
    expect(page).to have_link('Inscrever-se', href: new_recruiter_registration_path)

    click_on 'RH Coders'
  end
  
  scenario 'sucessfully' do
    visit root_path
    click_on 'Recrutadores'
    click_on 'Inscrever-se'

    fill_in 'E-mail', with: 'joao.almeida@campuscode.com.br'
    fill_in 'Senha', with: '93hsUS'
    fill_in 'Password confirmation', with: '93hsUS'
    click_on 'Sign up'

    expect(current_path).to eq(recruiter_session_path(Recruiter.last))
    expect(page).to have_link('RH Coders', href: root_path)
    expect(page).to have_content('joao.almeida@campuscode.com.br')
  end
end