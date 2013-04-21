require 'test_helper'

class ImportagesControllerTest < ActionController::TestCase
  setup do
    @importage = importages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:importages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create importage" do
    assert_difference('Importage.count') do
      post :create, :importage => @importage.attributes
    end

    assert_redirected_to importage_path(assigns(:importage))
  end

  test "should show importage" do
    get :show, :id => @importage.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @importage.to_param
    assert_response :success
  end

  test "should update importage" do
    put :update, :id => @importage.to_param, :importage => @importage.attributes
    assert_redirected_to importage_path(assigns(:importage))
  end

  test "should destroy importage" do
    assert_difference('Importage.count', -1) do
      delete :destroy, :id => @importage.to_param
    end

    assert_redirected_to importages_path
  end
end
