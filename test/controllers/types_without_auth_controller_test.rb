require 'test_helper'

class TypesWithoutAuthControllerTest < ActionDispatch::IntegrationTest
  test "should not get index" do
    get types_url
    assert_redirected_to new_session_url
  end
end
