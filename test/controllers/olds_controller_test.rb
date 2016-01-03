require 'test_helper'

class OldsControllerTest < ActionController::TestCase
  setup do
    @old = olds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:olds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create old" do
    assert_difference('Old.count') do
      post :create, old: { articles_id: @old.articles_id, category_id: @old.category_id, content: @old.content, created_at: @old.created_at, title: @old.title, updated_at: @old.updated_at, user_id: @old.user_id }
    end

    assert_redirected_to old_path(assigns(:old))
  end

  test "should show old" do
    get :show, id: @old
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @old
    assert_response :success
  end

  test "should update old" do
    patch :update, id: @old, old: { articles_id: @old.articles_id, category_id: @old.category_id, content: @old.content, created_at: @old.created_at, title: @old.title, updated_at: @old.updated_at, user_id: @old.user_id }
    assert_redirected_to old_path(assigns(:old))
  end

  test "should destroy old" do
    assert_difference('Old.count', -1) do
      delete :destroy, id: @old
    end

    assert_redirected_to olds_path
  end
end
