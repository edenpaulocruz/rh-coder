require 'rails_helper'

feature 'Recruiter creates account' do
  scenario 'from index page' do
    visit root_path

    expect(page).to have_content('RH Coders')
    expect(page).to have_link('Recrutadores', href: recruiter_session_path)
  end

  scenario 'from index page and return to index page' do
    visit root_path
    click_on 'Recrutadores'

    expect(page).to have_link('RH Coders', href: root_path)
    expect(page).to have_link('Inscrever-se', href: new_recruiter_registration_path)

    click_on 'RH Coders'
  end
  
  scenario 'sucessfully' do
    company = Company.create!(name: 'Campus Code', cnpj: '28348439000129', 
                              adress: 'Alameda Santos, 1293, cj 73 - 7º andar, São Paulo, SP 01419-904, BR',
                              website: 'www.campuscode.com.br', facebook: 'www.facebook.com/campuscodebr',
                              instagram: 'www.instagram.com/campuscodebr', 
                              linkedin: 'www.linkedin.com/school/campus-code/', 
                              twitter: 'www.twitter.com/campuscodebr', business_line: 'Educação/Tecnologia')
    company_admin = Recruiter.create!(email: 'joao.almeida@campuscode.com.br', name: 'João Almeida',
                                      password: '123456', company_id: company[:id], admin: true)

    visit root_path
    click_on 'Recrutadores'
    click_on 'Inscrever-se'

    fill_in 'E-mail', with: 'henrique.morato@campuscode.com.br'
    fill_in 'Name', with: 'Henrique Morato'
    fill_in 'Senha', with: '654321'
    fill_in 'Password confirmation', with: '654321'
    click_on 'Sign up'

    expect(current_path).to eq(root_path)
    expect(page).to have_link('RH Coders', href: root_path)
  end
end