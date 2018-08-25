require 'test_helper'

class CoffeeStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coffee_status = coffee_statuses(:one)
  end

  test "should get index" do
    get coffee_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_coffee_status_url
    assert_response :success
  end

  test "should create coffee_status" do
    assert_difference('CoffeeStatus.count') do
      post coffee_statuses_url, params: { coffee_status: { available: @coffee_status.available, user_updated_last: @coffee_status.user_updated_last } }
    end

    assert_redirected_to coffee_status_url(CoffeeStatus.last)
  end

  test "should show coffee_status" do
    get coffee_status_url(@coffee_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_coffee_status_url(@coffee_status)
    assert_response :success
  end

  test "should update coffee_status" do
    patch coffee_status_url(@coffee_status), params: { coffee_status: { available: @coffee_status.available, user_updated_last: @coffee_status.user_updated_last } }
    assert_redirected_to coffee_status_url(@coffee_status)
  end

  test "should destroy coffee_status" do
    assert_difference('CoffeeStatus.count', -1) do
      delete coffee_status_url(@coffee_status)
    end

    assert_redirected_to coffee_statuses_url
  end
end
