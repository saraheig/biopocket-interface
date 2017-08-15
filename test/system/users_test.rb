require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  test 'can sign up as new user' do
    visit new_session_url
    assert_selector 'h1', text: 'Se connecter'
    
    click_on 'Pas encore de compte ? S\'enregistrer'
    assert_selector 'h1', text: 'S\'enregistrer'
    
    fill_in 'user_firstname', with: 'Toto'
    fill_in 'user_lastname', with: 'Tutu'
    fill_in 'user_email', with: 'tototutu@gmail.com'
    fill_in 'user_pseudo', with: 'tototutu'
    fill_in 'user_password', with: 'tototutu'
    
    click_button 'S\'enregistrer'
    assert_selector '#notice', text: 'Enregistrement effectué avec succès'
    assert_selector 'h1', text: 'Liste des tables'
  end
end