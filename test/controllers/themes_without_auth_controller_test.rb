require 'test_helper'

class ThemesWithoutAuthControllerTest < ActionDispatch::IntegrationTest
  test "should not get index" do
    get themes_url
    assert_redirected_to new_session_url
  end
end
