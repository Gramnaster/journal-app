require "test_helper"

class CategoriesTasksControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = users(:one)
    sign_in @user
    # @categoryTask = categories(:one)
    @category = categories(:one)
    @task = tasks(:one)
  end

  test "should get category task" do
    get category_tasks_path
    assert_response :success
  end

  test "should get new category task" do
    get new_category_task_path
    assert_response :success
  end

  test "should create a category task" do
    new_task = @users.task.create!(title: "test title 123", content: "test content 123")

    assert_difference("CategoryTask.count", 1) do
      post category_tasks_path, params: { category_task: {
        category_id: @category.id,
        task_id: new_task.id
      }
    }
    end

    assert CategoryTask.exists?(category_id: @category.id, task_id: new_task.id)
  end
end
