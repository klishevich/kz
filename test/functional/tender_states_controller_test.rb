require 'test_helper'

class TenderStatesControllerTest < ActionController::TestCase
  setup do
    @tender_state = tender_states(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tender_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tender_state" do
    assert_difference('TenderState.count') do
      post :create, tender_state: { name: @tender_state.name }
    end

    assert_redirected_to tender_state_path(assigns(:tender_state))
  end

  test "should show tender_state" do
    get :show, id: @tender_state
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tender_state
    assert_response :success
  end

  test "should update tender_state" do
    put :update, id: @tender_state, tender_state: { name: @tender_state.name }
    assert_redirected_to tender_state_path(assigns(:tender_state))
  end

  test "should destroy tender_state" do
    assert_difference('TenderState.count', -1) do
      delete :destroy, id: @tender_state
    end

    assert_redirected_to tender_states_path
  end
end
