require 'test_helper'

class LevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @level = levels(:one)
  end

  test "should get index" do
    get levels_url
    assert_response :success
  end

  test "should get new" do
    get new_level_url
    assert_response :success
  end

  test "should create level" do
    assert_difference('Level.count') do
      post levels_url, params: { level: { name: @level.name, number: @level.number, referential_id: @level.referential_id } }
    end

    assert_redirected_to level_url(Level.last)
  end

  test "should show level" do
    get level_url(@level)
    assert_response :success
  end

  test "should get edit" do
    get edit_level_url(@level)
    assert_response :success
  end

  test "should update level" do
    patch level_url(@level), params: { level: { name: @level.name, number: @level.number, referential_id: @level.referential_id } }
    assert_redirected_to level_url(@level)
  end

  test "should destroy level" do
    assert_difference('Level.count', -1) do
      delete level_url(@level)
    end

    assert_redirected_to levels_url
  end
end
