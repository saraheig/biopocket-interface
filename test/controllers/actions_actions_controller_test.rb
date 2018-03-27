require 'test_helper'

class ActionsActionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @actions_action = actions_actions(:one)
  end

  test "should get index" do
    get actions_actions_url
    assert_response :success
  end

  test "should get new" do
    get new_actions_action_url
    assert_response :success
  end

  test "should create actions_action" do
    assert_difference('ActionsAction.count') do
      post actions_actions_url, params: { actions_action: { action_id: @actions_action.action_id } }
    end

    assert_redirected_to actions_action_url(ActionsAction.last)
  end

  test "should show actions_action" do
    get actions_action_url(@actions_action)
    assert_response :success
  end

  test "should get edit" do
    get edit_actions_action_url(@actions_action)
    assert_response :success
  end

  test "should update actions_action" do
    patch actions_action_url(@actions_action), params: { actions_action: { action_id: @actions_action.action_id } }
    assert_redirected_to actions_action_url(@actions_action)
  end

  test "should destroy actions_action" do
    assert_difference('ActionsAction.count', -1) do
      delete actions_action_url(@actions_action)
    end

    assert_redirected_to actions_actions_url
  end
end
