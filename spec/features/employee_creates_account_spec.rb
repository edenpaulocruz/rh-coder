require 'rails_helper'

feature 'Employee creates account' do
  scenario 'from index page' do
    visit root_path

    expect(page).to have_content('RH Coders')
    expect(page).to have_link('Ver vagas', href: jobs_path)
    expect(page).to have_link('Quero contratar', href: employers_path)
    expect(page).to have_link('Entrar', href: candidates_path)
    expect(page).to have_link('Criar conta', href: candidates_new)
  end
  
  scenario 'sucessfully' do
    visit root_path
    click_on 'Quero contratar'

    expect(page).to have_content('RH Coders')
    expect(page).to have_content('Contrate desenvolvedores')
    
    fill_in 'Nome', with: 'João Almeida'
    fill_in 'E-mail', with: 'joao.almeida@campusocde.com.br'
    fill_in 'Empresa', with: 'Campus Code'
    fill_in 'CNPJ', with: '28348439000129'
    fill_in 'Endereço', with: 'Alameda Santos, 1293, cj 73 - 7º andar, São Paulo, SP 01419-904, BR'
    fill_in 'Site', with: 'www.campuscode.com.br'
    fill_in 'Facebook', with: 'www.facebook.com/campuscodebr'
    fill_in 'Instagram', with: 'www.instagram.com/campuscodebr'
    fill_in 'LinkedIn', with: 'www.linkedin.com/school/campus-code/'
    fill_in 'Twitter', with: 'www.twitter.com/campuscodebr'
    fill_in 'Segmento', with: 'Educação/Tecnologia'
    fill_in 'Criar conta'

    expect(current_path).to eq(employer_path(Employer.last))
    expect(page).to have_content('João Almeida')
    expect(page).to have_content('joao.almeida@campusocde.com.br')
    expect(page).to have_content('Campus Code')
    expect(page).to have_content('28.348.439/0001-29')
    expect(page).to have_content('Alameda Santos, 1293, cj 73 - 7º andar, São Paulo, SP 01419-904, BR')
    expect(page).to have_content('www.campuscode.com.br')
    expect(page).to have_content('www.facebook.com/campuscodebr')
    expect(page).to have_content('www.instagram.com/campuscodebr')
    expect(page).to have_content('www.linkedin.com/school/campus-code/')
    expect(page).to have_content('www.twitter.com/campuscodebr')
    expect(page).to have_content('Educação/Tecnologia')
  end
end