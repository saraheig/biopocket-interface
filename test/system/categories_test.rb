require 'application_system_test_case'

class CategoriesTest < ApplicationSystemTestCase
  setup do
    visit new_session_url
    assert_selector 'h1', text: 'Se connecter'

    fill_in 'pseudo', with: 'YourPseudo'
    fill_in 'password', with: 'yoursecret'

    click_button 'Se connecter'
    assert_selector '#notice', text: 'Connexion réussie'
    assert_selector 'h1', text: 'Liste des tables'

    @category = categories(:one)
  end

  test 'visits the index' do
    click_on 'Types d\'action'
    assert_selector 'h1', text: 'Table des types d\'action'

    within 'table' do
      assert_selector 'td', text: @category.title
    end
  end
end