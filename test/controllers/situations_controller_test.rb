require 'test_helper'

class SituationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @situation = situations(:one)
  end

  test "should get index" do
    get situations_url
    assert_response :success
  end

  test "should get new" do
    get new_situation_url
    assert_response :success
  end

  test "should create situation" do
    assert_difference('Situation.count') do
      post situations_url, params: { situation: { competency_id: @situation.competency_id, description: @situation.description } }
    end

    assert_redirected_to situation_url(Situation.last)
  end

  test "should show situation" do
    get situation_url(@situation)
    assert_response :success
  end

  test "should get edit" do
    get edit_situation_url(@situation)
    assert_response :success
  end

  test "should update situation" do
    patch situation_url(@situation), params: { situation: { competency_id: @situation.competency_id, description: @situation.description } }
    assert_redirected_to situation_url(@situation)
  end

  test "should destroy situation" do
    assert_difference('Situation.count', -1) do
      delete situation_url(@situation)
    end

    assert_redirected_to situations_url
  end
end
