require 'rails_helper'

feature 'Recruiter fills company data' do
  scenario 'but company is already registered' do
    Recruiter.create!(name: 'João Almeida', email: 'joao.almeida@campuscode.com.br', password: '93hsUS')
    Company.create!(name: 'Campus Code', cnpj: '28348439000129', 
                    adress: 'Alameda Santos, 1293, cj 73 - 7º andar, São Paulo, SP 01419-904, BR',
                    website: 'www.campuscode.com.br', facebook: 'www.facebook.com/campuscodebr',
                    instagram: 'www.instagram.com/campuscodebr', 
                    linkedin: 'www.linkedin.com/school/campus-code/',
                    twitter: 'www.twitter.com/campuscodebr', business_line: 'Escola')
    
    visit root_path
    click_on 'Recrutadores'
    click_on 'Criar conta'
    fill_in 'Nome', with: 'Henrique Morato'
    fill_in 'E-mail', with: 'henrique.morato@campuscode.com.br'
    fill_in 'Senha', with: '4dS4w2'
    click_on 'Criar conta'

    expect(current_path).to eq(recruiter_path(Recruiter.last))
    expect(page).to have_content('Henrique Morato')
    expect(page).to have_content('henrique.morato@campuscode.com.br')
    expect(page).to have_content('Recrutador vinculado à Compus Code!')
    expect(page).to have_link('Voltar')
  end

  scenario 'but company is not registered' do
    visit root_path
    click_on 'Recrutadores'
    click_on 'Criar conta'
    fill_in 'Nome', with: 'João Almeida'
    fill_in 'E-mail', with: 'joao.almeida@campusocde.com.br'
    fill_in 'Senha', with: '93hsUS'
    click_on 'Criar conta'

    expect(current_path).to eq(recruiter_path(Recruiter.last))
    expect(page).to have_content('João Almeida')
    expect(page).to have_content('joao.almeida@campuscode.com.br')
    expect(page).to have_content('Recrutador não está vinculado à empresa!')
    expect(page).to have_link('Cadastrar empresa')
    expect(page).to have_link('Voltar')
  end

  scenario 'sucessfully' do
    visit root_path
    click_on 'Recrutadores'
    click_on 'Criar conta'
    fill_in 'Nome', with: 'João Almeida'
    fill_in 'E-mail', with: 'joao.almeida@campusocde.com.br'
    fill_in 'Senha', with: '93hsUS'
    click_on 'Criar conta'
    click_on 'Cadastrar empresa'

    fill_in 'Empresa', with: 'Campus Code'
    fill_in 'CNPJ', with: '28348439000129'
    fill_in 'Endereço', with: 'Alameda Santos, 1293, cj 73 - 7º andar, São Paulo, SP 01419-904, BR'
    fill_in 'Site', with: 'www.campuscode.com.br'
    fill_in 'Facebook', with: 'www.facebook.com/campuscodebr'
    fill_in 'Instagram', with: 'www.instagram.com/campuscodebr'
    fill_in 'LinkedIn', with: 'www.linkedin.com/school/campus-code/'
    fill_in 'Twitter', with: 'www.twitter.com/campuscodebr'
    fill_in 'Segmento', with: 'Educação/Tecnologia'
    click_on 'Finalizar'
    
    expect(current_path).to eq(recruiter_path(Company.last))
    expect(page).to have_content('Campus Code')
    expect(page).to have_content('28.348.439/0001-29')
    expect(page).to have_content('Alameda Santos, 1293, cj 73 - 7º andar, São Paulo, SP 01419-904, BR')
    expect(page).to have_content('www.campuscode.com.br')
    expect(page).to have_content('www.facebook.com/campuscodebr')
    expect(page).to have_content('www.instagram.com/campuscodebr')
    expect(page).to have_content('www.linkedin.com/school/campus-code/')
    expect(page).to have_content('www.twitter.com/campuscodebr')
    expect(page).to have_content('Educação/Tecnologia')
    expect(page).to have_content('Empresa cadastrada com sucesso!')
    expect(page).to have_link('Voltar')
  end
end