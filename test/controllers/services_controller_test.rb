require 'test_helper'

class ServicesControllerTest < ActionController::TestCase
  setup do
    @service = services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create services" do
    assert_difference('Service.count') do
      post :create, services: { [title: @service.[title, body: @service.body, header: @service.header, image_url: @service.image_url }
    end

    assert_redirected_to service_path(assigns(:services))
  end

  test "should show services" do
    get :show, id: @service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service
    assert_response :success
  end

  test "should update services" do
    patch :update, id: @service, services: { [title: @service.[title, body: @service.body, header: @service.header, image_url: @service.image_url }
    assert_redirected_to service_path(assigns(:services))
  end

  test "should destroy services" do
    assert_difference('Service.count', -1) do
      delete :destroy, id: @service
    end

    assert_redirected_to services_path
  end
end
