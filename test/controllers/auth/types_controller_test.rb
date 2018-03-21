require 'test_helper'

class TypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type = types(:one)
    sign_in_as(:one) # Simulated authentication of a user
  end

  test "should get index" do
    get types_url
    assert_response :success
  end

  test "should get new" do
    get new_type_url
    assert_response :success
  end

  test "should create type" do
    assert_difference('Type.count') do
      post types_url, params: { type: { title: 'NewTitle' } }
    end

    assert_redirected_to type_url(Type.last)
  end

  test "should show type" do
    get type_url(@type)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_url(@type)
    assert_response :success
  end

  test "should update type" do
    patch type_url(@type), params: { type: { title: @type.title } }
    assert_redirected_to type_url(@type)
  end

  test "should destroy type" do
    assert_difference('Type.count', -1) do
      delete type_url(@type)
    end

    assert_redirected_to types_url
  end
end
