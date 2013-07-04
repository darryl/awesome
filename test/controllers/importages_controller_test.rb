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
      post :create, importage: {  }
    end

    assert_redirected_to importage_path(assigns(:importage))
  end

  test "should show importage" do
    get :show, id: @importage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @importage
    assert_response :success
  end

  test "should update importage" do
    patch :update, id: @importage, importage: {  }
    assert_redirected_to importage_path(assigns(:importage))
  end

  test "should destroy importage" do
    assert_difference('Importage.count', -1) do
      delete :destroy, id: @importage
    end

    assert_redirected_to importages_path
  end
end
