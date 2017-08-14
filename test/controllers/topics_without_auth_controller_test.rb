require 'test_helper'

class TopicsWithoutAuthControllerTest < ActionDispatch::IntegrationTest
  test "should not get index" do
    get topics_url
    assert_redirected_to new_session_url
  end
end
