require 'test_helper'

class InflatablesControllerTest < ActionController::TestCase
  setup do
    @inflatable = inflatables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inflatables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inflatable" do
    assert_difference('Inflatable.count') do
      post :create, inflatable: { company_id: @inflatable.company_id, description: @inflatable.description, is_active: @inflatable.is_active, name: @inflatable.name, up_to_4_hours: @inflatable.up_to_4_hours, up_to_8_hours: @inflatable.up_to_8_hours }
    end

    assert_redirected_to inflatable_path(assigns(:inflatable))
  end

  test "should show inflatable" do
    get :show, id: @inflatable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inflatable
    assert_response :success
  end

  test "should update inflatable" do
    put :update, id: @inflatable, inflatable: { company_id: @inflatable.company_id, description: @inflatable.description, is_active: @inflatable.is_active, name: @inflatable.name, up_to_4_hours: @inflatable.up_to_4_hours, up_to_8_hours: @inflatable.up_to_8_hours }
    assert_redirected_to inflatable_path(assigns(:inflatable))
  end

  test "should destroy inflatable" do
    assert_difference('Inflatable.count', -1) do
      delete :destroy, id: @inflatable
    end

    assert_redirected_to inflatables_path
  end
end
