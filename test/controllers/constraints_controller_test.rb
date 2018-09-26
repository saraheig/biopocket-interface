require 'test_helper'

class ConstraintsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @constraint = constraints(:one)
  end

  test "should get index" do
    get constraints_url
    assert_response :success
  end

  test "should get new" do
    get new_constraint_url
    assert_response :success
  end

  test "should create constraint" do
    assert_difference('Constraint.count') do
      post constraints_url, params: { constraint: { description: @constraint.description, task_id: @constraint.task_id, title: @constraint.title } }
    end

    assert_redirected_to constraint_url(Constraint.last)
  end

  test "should show constraint" do
    get constraint_url(@constraint)
    assert_response :success
  end

  test "should get edit" do
    get edit_constraint_url(@constraint)
    assert_response :success
  end

  test "should update constraint" do
    patch constraint_url(@constraint), params: { constraint: { description: @constraint.description, task_id: @constraint.task_id, title: @constraint.title } }
    assert_redirected_to constraint_url(@constraint)
  end

  test "should destroy constraint" do
    assert_difference('Constraint.count', -1) do
      delete constraint_url(@constraint)
    end

    assert_redirected_to constraints_url
  end
end
