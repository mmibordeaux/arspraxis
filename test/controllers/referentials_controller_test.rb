require 'test_helper'

class ReferentialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @referential = referentials(:one)
  end

  test "should get index" do
    get referentials_url
    assert_response :success
  end

  test "should get new" do
    get new_referential_url
    assert_response :success
  end

  test "should create referential" do
    assert_difference('Referential.count') do
      post referentials_url, params: { referential: { name: @referential.name } }
    end

    assert_redirected_to referential_url(Referential.last)
  end

  test "should show referential" do
    get referential_url(@referential)
    assert_response :success
  end

  test "should get edit" do
    get edit_referential_url(@referential)
    assert_response :success
  end

  test "should update referential" do
    patch referential_url(@referential), params: { referential: { name: @referential.name } }
    assert_redirected_to referential_url(@referential)
  end

  test "should destroy referential" do
    assert_difference('Referential.count', -1) do
      delete referential_url(@referential)
    end

    assert_redirected_to referentials_url
  end
end
