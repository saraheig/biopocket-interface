require 'application_system_test_case'

class ActionsTest < ApplicationSystemTestCase
  setup do
    visit new_session_url
    assert_selector 'h1', text: 'Se connecter'

    fill_in 'pseudo', with: 'YourPseudo'
    fill_in 'password', with: 'yoursecret'

    click_button 'Se connecter'
    assert_selector '#notice', text: 'Connexion réussie'
    assert_selector 'h1', text: 'Liste des tables'

    @action = actions(:one)
  end

  test 'visits the index' do
    click_link 'Actions'
    click_on 'Voir les actions'
    assert_selector 'h1', text: 'Table des actions'

    within 'table' do
      assert_selector 'td', text: @action.title
      assert_selector 'td', text: @action.description
      assert_selector 'td', text: @action.impact
      assert_selector 'td', text: @action.spot
      assert_selector 'td', text: @action.cost_min
      assert_selector 'td', text: @action.time_min
      assert_selector 'td', text: @action.time_unit
      assert_selector 'td', text: @action.time_description
      assert_selector 'td', text: @action.surface_min
      assert_selector 'td', text: @action.investment
      assert_selector 'td', text: @action.picture
      assert_selector 'td', text: @action.importance
    end
  end
end