require 'test_helper'

class Referential::ManagersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @referential_manager = referential_managers(:one)
  end

  test "should get index" do
    get referential_managers_url
    assert_response :success
  end

  test "should get new" do
    get new_referential_manager_url
    assert_response :success
  end

  test "should create referential_manager" do
    assert_difference('Referential::Manager.count') do
      post referential_managers_url, params: { referential_manager: { referential_id: @referential_manager.referential_id, user: @referential_manager.user } }
    end

    assert_redirected_to referential_manager_url(Referential::Manager.last)
  end

  test "should show referential_manager" do
    get referential_manager_url(@referential_manager)
    assert_response :success
  end

  test "should get edit" do
    get edit_referential_manager_url(@referential_manager)
    assert_response :success
  end

  test "should update referential_manager" do
    patch referential_manager_url(@referential_manager), params: { referential_manager: { referential_id: @referential_manager.referential_id, user: @referential_manager.user } }
    assert_redirected_to referential_manager_url(@referential_manager)
  end

  test "should destroy referential_manager" do
    assert_difference('Referential::Manager.count', -1) do
      delete referential_manager_url(@referential_manager)
    end

    assert_redirected_to referential_managers_url
  end
end
