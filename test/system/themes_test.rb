require 'application_system_test_case'

class ThemesTest < ApplicationSystemTestCase
  setup do
    visit new_session_url
    assert_selector 'h1', text: 'Se connecter'

    fill_in 'pseudo', with: 'YourPseudo'
    fill_in 'password', with: 'yoursecret'

    click_button 'Se connecter'
    assert_selector '#notice', text: 'Connexion réussie'
    assert_selector 'h1', text: 'Liste des tables'

    @theme = themes(:one)
  end

  test 'visits the index' do
    click_link 'Thèmes'
    click_on 'Voir les thèmes'
    assert_selector 'h1', text: 'Table des thèmes'

    within 'table' do
      assert_selector 'td', text: @theme.title
      assert_selector 'td', text: @theme.description
      assert_selector 'td', text: @theme.picture
    end
  end
end