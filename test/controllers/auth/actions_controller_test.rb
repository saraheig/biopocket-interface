require 'test_helper'

class ActionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @action = actions(:one)
    sign_in_as(:one)
  end

  test "should get index" do
    get actions_url
    assert_response :success
  end

  test "should get new" do
    get new_action_url
    assert_response :success
  end

  test "should show action" do
    get action_url(@action)
    assert_response :success
  end

  test "should get edit" do
    get edit_action_url(@action)
    assert_response :success
  end

  test "should update action" do
    patch action_url(@action), params: { bioaction: { type_id: @action.type_id, cost_min: @action.cost_min, description: @action.description, investment: @action.investment, spot: @action.spot, impact: @action.impact, time_min: @action.time_min, time_unit: @action.time_unit, time_description: @action.time_description, surface_min: @action.surface_min, picture: @action.picture, importance: @action.importance, title: @action.title, theme_id: @action.theme_id } }
    assert_response :success
  end

  test "should destroy action" do
    assert_difference('Action.count', -1) do
      delete action_url(@action)
    end

    assert_redirected_to actions_url
  end
end
