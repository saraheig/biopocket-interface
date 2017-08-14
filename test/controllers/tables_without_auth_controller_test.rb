require 'test_helper'

class TablesWithoutAuthControllerTest < ActionDispatch::IntegrationTest
  test "should not get index" do
    get tables_url
    assert_redirected_to new_session_url
  end
end
