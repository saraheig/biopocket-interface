require 'application_system_test_case'

class TopicsTest < ApplicationSystemTestCase
  setup do
    visit new_session_url
    assert_selector 'h1', text: 'Se connecter'

    fill_in 'pseudo', with: 'YourPseudo'
    fill_in 'password', with: 'yoursecret'

    click_button 'Se connecter'
    assert_selector '#notice', text: 'Connexion réussie'
    assert_selector 'h1', text: 'Liste des tables'

    @topic = topics(:one)
  end

  test 'visits the index' do
    click_on 'Thèmes'
    assert_selector 'h1', text: 'Table des thèmes'

    within 'table' do
      assert_selector 'td', text: @topic.title
      assert_selector 'td', text: @topic.description
    end
  end
end