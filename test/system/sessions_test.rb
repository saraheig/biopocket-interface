class SessionsTest < ApplicationSystemTestCase
  test 'can sign in and sign out as user' do
    visit new_session_url
    assert_selector 'h1', text: 'Se connecter'
    
    fill_in 'pseudo', with: 'YourPseudo'
    fill_in 'password', with: 'yoursecret'
    
    click_button 'Se connecter'
    assert_selector '#notice', text: 'Connexion réussie'
    assert_selector 'h1', text: 'Liste des tables'
    
    click_on 'Se déconnecter (YourPseudo)'
    assert_selector '#notice', text: 'Déconnexion réussie'
    assert_selector 'h1', text: 'Se connecter'
  end

  test 'can not sign in as user' do
    visit new_session_url
    assert_selector 'h1', text: 'Se connecter'
    
    fill_in 'pseudo', with: 'WrongPseudo'
    fill_in 'password', with: 'WrongPassword'
    
    click_button 'Se connecter'
    assert_selector '#notice', text: 'Pseudo ou mot de passe invalide'
    assert_selector 'h1', text: 'Se connecter'
  end
end