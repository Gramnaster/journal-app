require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @category = categories(:one)
  end

  test "should get index" do
    get categories_path
    assert_response :success
  end

  test "should get new category" do
    get new_category_path
    assert_response :success
  end

  test "should create a category" do
    assert_difference("Category.count", 1) do
      post categories_path, params: { category: { title: "test123" } }
    end

    assert Category.exists?(title: "test123")
  end

  test "should show category" do
    get category_path(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_path(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_path(@category), params: { category: { title: "Updated Title" } }

    @category.reload
    assert_equal "Updated Title", @category.title
    assert_redirected_to category_path(@category)
  end

  test "should destroy category" do
    category_to_delete = @user.categories.create!(title: "Delete category")

    assert_difference("Category.count", -1) do
      delete category_path(category_to_delete)
    end

    assert_redirected_to categories_path
  end
end
