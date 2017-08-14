require 'test_helper'

class WorksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work = works(:one)
    sign_in_as(:one)
  end

  test "should get index" do
    get works_url
    assert_response :success
  end

  test "should get new" do
    get new_work_url
    assert_response :success
  end

  test "should create work" do
    assert_difference('Work.count') do
      post works_url, params: { work: { category_id: @work.category_id, cost: @work.cost, description: @work.description, difficulty: @work.difficulty, house: @work.house, impact: @work.impact, time: @work.time, title: 'NewTitle', topic_id: @work.topic_id } }
    end

    assert_redirected_to work_url(Work.last)
  end

  test "should show work" do
    get work_url(@work)
    assert_response :success
  end

  test "should get edit" do
    get edit_work_url(@work)
    assert_response :success
  end

  test "should update work" do
    patch work_url(@work), params: { work: { category_id: @work.category_id, cost: @work.cost, description: @work.description, difficulty: @work.difficulty, house: @work.house, impact: @work.impact, time: @work.time, title: @work.title, topic_id: @work.topic_id } }
    assert_redirected_to work_url(@work)
  end

  test "should destroy work" do
    assert_difference('Work.count', -1) do
      delete work_url(@work)
    end

    assert_redirected_to works_url
  end
end
