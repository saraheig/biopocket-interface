require 'test_helper'

class SpeciesActionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @species_action = species_actions(:one)
  end

  test "should get index" do
    get species_actions_url
    assert_response :success
  end

  test "should get new" do
    get new_species_action_url
    assert_response :success
  end

  test "should create species_action" do
    assert_difference('SpeciesAction.count') do
      post species_actions_url, params: { species_action: { action_id: @species_action.action_id, species_id: @species_action.species_id } }
    end

    assert_redirected_to species_action_url(SpeciesAction.last)
  end

  test "should show species_action" do
    get species_action_url(@species_action)
    assert_response :success
  end

  test "should get edit" do
    get edit_species_action_url(@species_action)
    assert_response :success
  end

  test "should update species_action" do
    patch species_action_url(@species_action), params: { species_action: { action_id: @species_action.action_id, species_id: @species_action.species_id } }
    assert_redirected_to species_action_url(@species_action)
  end

  test "should destroy species_action" do
    assert_difference('SpeciesAction.count', -1) do
      delete species_action_url(@species_action)
    end

    assert_redirected_to species_actions_url
  end
end
