require 'test_helper'

class User::EvaluationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_evaluation = user_evaluations(:one)
  end

  test "should get index" do
    get user_evaluations_url
    assert_response :success
  end

  test "should get new" do
    get new_user_evaluation_url
    assert_response :success
  end

  test "should create user_evaluation" do
    assert_difference('User::Evaluation.count') do
      post user_evaluations_url, params: { user_evaluation: { authenticity_comment: @user_evaluation.authenticity_comment, authenticity_validated: @user_evaluation.authenticity_validated, completeness_comment: @user_evaluation.completeness_comment, completeness_validated: @user_evaluation.completeness_validated, depth_comment: @user_evaluation.depth_comment, depth_validated: @user_evaluation.depth_validated, explanation_comment: @user_evaluation.explanation_comment, explanation_validated: @user_evaluation.explanation_validated, extent_comment: @user_evaluation.extent_comment, extent_validated: @user_evaluation.extent_validated, program_teacher: @user_evaluation.program_teacher, publication_id: @user_evaluation.publication_id, validity_comment: @user_evaluation.validity_comment, validity_validated: @user_evaluation.validity_validated } }
    end

    assert_redirected_to user_evaluation_url(User::Evaluation.last)
  end

  test "should show user_evaluation" do
    get user_evaluation_url(@user_evaluation)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_evaluation_url(@user_evaluation)
    assert_response :success
  end

  test "should update user_evaluation" do
    patch user_evaluation_url(@user_evaluation), params: { user_evaluation: { authenticity_comment: @user_evaluation.authenticity_comment, authenticity_validated: @user_evaluation.authenticity_validated, completeness_comment: @user_evaluation.completeness_comment, completeness_validated: @user_evaluation.completeness_validated, depth_comment: @user_evaluation.depth_comment, depth_validated: @user_evaluation.depth_validated, explanation_comment: @user_evaluation.explanation_comment, explanation_validated: @user_evaluation.explanation_validated, extent_comment: @user_evaluation.extent_comment, extent_validated: @user_evaluation.extent_validated, program_teacher: @user_evaluation.program_teacher, publication_id: @user_evaluation.publication_id, validity_comment: @user_evaluation.validity_comment, validity_validated: @user_evaluation.validity_validated } }
    assert_redirected_to user_evaluation_url(@user_evaluation)
  end

  test "should destroy user_evaluation" do
    assert_difference('User::Evaluation.count', -1) do
      delete user_evaluation_url(@user_evaluation)
    end

    assert_redirected_to user_evaluations_url
  end
end
