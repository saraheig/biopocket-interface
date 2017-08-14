require 'test_helper'

class TablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in_as(:one)
  end

  test "should get index" do
    get tables_url
    assert_response :success
  end

end
