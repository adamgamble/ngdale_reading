require 'test_helper'

class DailyReadingsControllerTest < ActionController::TestCase
  setup do
    @daily_reading = daily_readings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:daily_readings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create daily_reading" do
    assert_difference('DailyReading.count') do
      post :create, daily_reading: @daily_reading.attributes
    end

    assert_redirected_to daily_reading_path(assigns(:daily_reading))
  end

  test "should show daily_reading" do
    get :show, id: @daily_reading.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @daily_reading.to_param
    assert_response :success
  end

  test "should update daily_reading" do
    put :update, id: @daily_reading.to_param, daily_reading: @daily_reading.attributes
    assert_redirected_to daily_reading_path(assigns(:daily_reading))
  end

  test "should destroy daily_reading" do
    assert_difference('DailyReading.count', -1) do
      delete :destroy, id: @daily_reading.to_param
    end

    assert_redirected_to daily_readings_path
  end
end
