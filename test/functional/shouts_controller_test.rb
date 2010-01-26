require 'test_helper'

class ShoutsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shouts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shout" do
    assert_difference('Shout.count') do
      post :create, :shout => { }
    end

    assert_redirected_to shout_path(assigns(:shout))
  end

  test "should show shout" do
    get :show, :id => shouts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => shouts(:one).to_param
    assert_response :success
  end

  test "should update shout" do
    put :update, :id => shouts(:one).to_param, :shout => { }
    assert_redirected_to shout_path(assigns(:shout))
  end

  test "should destroy shout" do
    assert_difference('Shout.count', -1) do
      delete :destroy, :id => shouts(:one).to_param
    end

    assert_redirected_to shouts_path
  end
end
