require 'rails_helper'

feature 'Recruiter creates account' do
  scenario 'from index page' do
    visit root_path

    expect(page).to have_content('RH Coders')
    expect(page).to have_link('Recrutadores', href: recruiters_path)
  end

  scenario 'return to index page' do
    visit root_path
    click_on 'Recrutadores'

    expect(page).to have_content('RH Coders')
    expect(page).to have_content('Recrutadores')
    expect(page).to have_link('Criar conta', href: new_recruiter_path)
    expect(page).to have_link('Voltar', href: root_path)

    click_on 'Voltar'
  end
  
  scenario 'sucessfully' do
    visit root_path
    click_on 'Recrutadores'

    expect(page).to have_content('RH Coders')
    expect(page).to have_content('Recrutadores')
    expect(page).to have_link('Criar conta', href: new_recruiter_path)
    expect(page).to have_link('Voltar', href: root_path)

    click_on 'Criar conta'
    
    fill_in 'Nome', with: 'João Almeida'
    fill_in 'E-mail', with: 'joao.almeida@campusocde.com.br'
    fill_in 'Senha', with: '93hsUS'
    click_on 'Criar conta'

    expect(current_path).to eq(recruiter_path(Recruiter.last))
    expect(page).to have_content('João Almeida')
    expect(page).to have_content('joao.almeida@campusocde.com.br')
    expect(page).to have_link('Voltar')
  end
end