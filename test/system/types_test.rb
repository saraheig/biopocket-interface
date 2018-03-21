require 'application_system_test_case'

class TypesTest < ApplicationSystemTestCase
  driven_by :poltergeist, options: { phantomjs: Phantomjs.path }
  
  setup do
    visit new_session_url
    assert_selector 'h1', text: 'Se connecter'

    fill_in 'pseudo', with: 'YourPseudo'
    fill_in 'password', with: 'yoursecret'

    click_button 'Se connecter'
    assert_selector '#notice', text: 'Connexion réussie'
    assert_selector 'h1', text: 'Liste des tables'

    @type = types(:one)
  end

  test 'visits the index' do
    click_link 'Types d\'action'
    click_on 'Voir les types d\'action'
    assert_selector 'h1', text: 'Table des types d\'action'

    within 'table' do
      assert_selector 'td', text: @type.title
      assert_selector 'td', text: @type.description
    end
  end
end