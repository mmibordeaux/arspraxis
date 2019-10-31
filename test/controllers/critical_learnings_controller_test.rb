require 'test_helper'

class CriticalLearningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @critical_learning = critical_learnings(:one)
  end

  test "should get index" do
    get critical_learnings_url
    assert_response :success
  end

  test "should get new" do
    get new_critical_learning_url
    assert_response :success
  end

  test "should create critical_learning" do
    assert_difference('CriticalLearning.count') do
      post critical_learnings_url, params: { critical_learning: { competency_id: @critical_learning.competency_id, description: @critical_learning.description, level_id: @critical_learning.level_id, not_reached: @critical_learning.not_reached, number: @critical_learning.number, over_reached: @critical_learning.over_reached, partially_reached: @critical_learning.partially_reached, reached: @critical_learning.reached } }
    end

    assert_redirected_to critical_learning_url(CriticalLearning.last)
  end

  test "should show critical_learning" do
    get critical_learning_url(@critical_learning)
    assert_response :success
  end

  test "should get edit" do
    get edit_critical_learning_url(@critical_learning)
    assert_response :success
  end

  test "should update critical_learning" do
    patch critical_learning_url(@critical_learning), params: { critical_learning: { competency_id: @critical_learning.competency_id, description: @critical_learning.description, level_id: @critical_learning.level_id, not_reached: @critical_learning.not_reached, number: @critical_learning.number, over_reached: @critical_learning.over_reached, partially_reached: @critical_learning.partially_reached, reached: @critical_learning.reached } }
    assert_redirected_to critical_learning_url(@critical_learning)
  end

  test "should destroy critical_learning" do
    assert_difference('CriticalLearning.count', -1) do
      delete critical_learning_url(@critical_learning)
    end

    assert_redirected_to critical_learnings_url
  end
end
