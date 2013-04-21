require 'test_helper'

class MixesControllerTest < ActionController::TestCase
  setup do
    @mix = mixes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mixes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mix" do
    assert_difference('Mix.count') do
      post :create, :mix => @mix.attributes
    end

    assert_redirected_to mix_path(assigns(:mix))
  end

  test "should show mix" do
    get :show, :id => @mix.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mix.to_param
    assert_response :success
  end

  test "should update mix" do
    put :update, :id => @mix.to_param, :mix => @mix.attributes
    assert_redirected_to mix_path(assigns(:mix))
  end

  test "should destroy mix" do
    assert_difference('Mix.count', -1) do
      delete :destroy, :id => @mix.to_param
    end

    assert_redirected_to mixes_path
  end
end
