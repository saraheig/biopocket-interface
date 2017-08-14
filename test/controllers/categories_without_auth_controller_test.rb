require 'test_helper'

class CategoriesWithoutAuthControllerTest < ActionDispatch::IntegrationTest
  test "should not get index" do
    get categories_url
    assert_redirected_to new_session_url
  end
end
