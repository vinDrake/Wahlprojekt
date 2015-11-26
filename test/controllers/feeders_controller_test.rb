require 'test_helper'

class FeedersControllerTest < ActionController::TestCase
  setup do
    @feeder = feeders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feeders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feeder" do
    assert_difference('Feeder.count') do
      post :create, feeder: {  }
    end

    assert_redirected_to feeder_path(assigns(:feeder))
  end

  test "should show feeder" do
    get :show, id: @feeder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feeder
    assert_response :success
  end

  test "should update feeder" do
    patch :update, id: @feeder, feeder: {  }
    assert_redirected_to feeder_path(assigns(:feeder))
  end

  test "should destroy feeder" do
    assert_difference('Feeder.count', -1) do
      delete :destroy, id: @feeder
    end

    assert_redirected_to feeders_path
  end
end
