require 'test_helper'

class WorksWithoutAuthControllerTest < ActionDispatch::IntegrationTest
  test "should not get index" do
    get works_url
    assert_redirected_to new_session_url
  end
end
