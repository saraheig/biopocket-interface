require 'test_helper'

class TasksTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tasks_task = tasks_tasks(:one)
  end

  test "should get index" do
    get tasks_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_tasks_task_url
    assert_response :success
  end

  test "should create tasks_task" do
    assert_difference('TasksTask.count') do
      post tasks_tasks_url, params: { tasks_task: { task_id: @tasks_task.task_id } }
    end

    assert_redirected_to tasks_task_url(TasksTask.last)
  end

  test "should show tasks_task" do
    get tasks_task_url(@tasks_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_tasks_task_url(@tasks_task)
    assert_response :success
  end

  test "should update tasks_task" do
    patch tasks_task_url(@tasks_task), params: { tasks_task: { task_id: @tasks_task.task_id } }
    assert_redirected_to tasks_task_url(@tasks_task)
  end

  test "should destroy tasks_task" do
    assert_difference('TasksTask.count', -1) do
      delete tasks_task_url(@tasks_task)
    end

    assert_redirected_to tasks_tasks_url
  end
end
