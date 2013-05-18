require 'test_helper'

class TendersControllerTest < ActionController::TestCase
  setup do
    @tender = tenders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tenders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tender" do
    assert_difference('Tender.count') do
      post :create, tender: { app_open_date: @tender.app_open_date, app_open_place: @tender.app_open_place, app_order: @tender.app_order, app_place: @tender.app_place, app_view_date: @tender.app_view_date, app_view_place: @tender.app_view_place, doc_begin_date: @tender.doc_begin_date, doc_end_date: @tender.doc_end_date, doc_order: @tender.doc_order, doc_place: @tender.doc_place, end_app_date: @tender.end_app_date, name: @tender.name, placing_date: @tender.placing_date, registry_number: @tender.registry_number, start_app_date: @tender.start_app_date }
    end

    assert_redirected_to tender_path(assigns(:tender))
  end

  test "should show tender" do
    get :show, id: @tender
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tender
    assert_response :success
  end

  test "should update tender" do
    put :update, id: @tender, tender: { app_open_date: @tender.app_open_date, app_open_place: @tender.app_open_place, app_order: @tender.app_order, app_place: @tender.app_place, app_view_date: @tender.app_view_date, app_view_place: @tender.app_view_place, doc_begin_date: @tender.doc_begin_date, doc_end_date: @tender.doc_end_date, doc_order: @tender.doc_order, doc_place: @tender.doc_place, end_app_date: @tender.end_app_date, name: @tender.name, placing_date: @tender.placing_date, registry_number: @tender.registry_number, start_app_date: @tender.start_app_date }
    assert_redirected_to tender_path(assigns(:tender))
  end

  test "should destroy tender" do
    assert_difference('Tender.count', -1) do
      delete :destroy, id: @tender
    end

    assert_redirected_to tenders_path
  end
end
