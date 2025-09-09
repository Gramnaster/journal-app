require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @task = tasks(:one)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new task" do
    get new_task_path
    assert_response :success
  end

  test "should create new task" do
    assert_difference("Task.count", 1) do
      post tasks_path, params: { task: { title: "task123", content: "task123" } }
    end
    assert Task.exists?(title: "task123", content: "task123")
  end

  test "should get edit task" do
    get edit_task_path(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_path(@task), params: { task: { title: "Updated task title", content: "Updated task content" } }

    @task.reload
    assert_equal "Updated task title", @task.title
    assert_equal "Updated task content", @task.content
    assert_redirected_to task_path(@task)
  end

  test "should destroy task" do
    task_to_delete = @user.tasks.create!(title: "Delete task")

    assert_difference("Task.count", -1) do
      delete task_path(task_to_delete)
    end

    assert_redirected_to tasks_path
  end
end
