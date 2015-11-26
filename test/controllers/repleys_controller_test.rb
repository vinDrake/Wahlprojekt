require 'test_helper'

class RepleysControllerTest < ActionController::TestCase
  setup do
    @repley = repleys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:repleys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create repley" do
    assert_difference('Repley.count') do
      post :create, repley: {  }
    end

    assert_redirected_to repley_path(assigns(:repley))
  end

  test "should show repley" do
    get :show, id: @repley
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @repley
    assert_response :success
  end

  test "should update repley" do
    patch :update, id: @repley, repley: {  }
    assert_redirected_to repley_path(assigns(:repley))
  end

  test "should destroy repley" do
    assert_difference('Repley.count', -1) do
      delete :destroy, id: @repley
    end

    assert_redirected_to repleys_path
  end
end
