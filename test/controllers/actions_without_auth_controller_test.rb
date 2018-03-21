require 'test_helper'

class ActionsWithoutAuthControllerTest < ActionDispatch::IntegrationTest
  test "should not get index" do
    get actions_url
    assert_redirected_to new_session_url
  end
end
