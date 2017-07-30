require 'test_helper'

class TablesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tables_url
    assert_response :success
  end

end
