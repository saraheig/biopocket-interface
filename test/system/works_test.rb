require 'application_system_test_case'

class WorksTest < ApplicationSystemTestCase
  setup do
    visit new_session_url
    assert_selector 'h1', text: 'Se connecter'

    fill_in 'pseudo', with: 'YourPseudo'
    fill_in 'password', with: 'yoursecret'

    click_button 'Se connecter'
    assert_selector '#notice', text: 'Connexion réussie'
    assert_selector 'h1', text: 'Liste des tables'

    @work = works(:one)
  end

  test 'visits the index' do
    click_on 'Actions'
    assert_selector 'h1', text: 'Table des actions'

    within 'table' do
      assert_selector 'td', text: @work.title
      assert_selector 'td', text: @work.description
      assert_selector 'td', text: @work.impact
      assert_selector 'td', text: @work.house
      assert_selector 'td', text: @work.cost
      assert_selector 'td', text: @work.time
      assert_selector 'td', text: @work.difficulty
    end
  end
end