require "application_system_test_case"

class User::EvaluationsTest < ApplicationSystemTestCase
  setup do
    @user_evaluation = user_evaluations(:one)
  end

  test "visiting the index" do
    visit user_evaluations_url
    assert_selector "h1", text: "User/Evaluations"
  end

  test "creating a Evaluation" do
    visit user_evaluations_url
    click_on "New User/Evaluation"

    fill_in "Authenticity comment", with: @user_evaluation.authenticity_comment
    check "Authenticity validated" if @user_evaluation.authenticity_validated
    fill_in "Completeness comment", with: @user_evaluation.completeness_comment
    check "Completeness validated" if @user_evaluation.completeness_validated
    fill_in "Depth comment", with: @user_evaluation.depth_comment
    check "Depth validated" if @user_evaluation.depth_validated
    fill_in "Explanation comment", with: @user_evaluation.explanation_comment
    check "Explanation validated" if @user_evaluation.explanation_validated
    fill_in "Extent comment", with: @user_evaluation.extent_comment
    check "Extent validated" if @user_evaluation.extent_validated
    fill_in "Program teacher", with: @user_evaluation.program_teacher
    fill_in "Publication", with: @user_evaluation.publication_id
    fill_in "Validity comment", with: @user_evaluation.validity_comment
    check "Validity validated" if @user_evaluation.validity_validated
    click_on "Create Evaluation"

    assert_text "Evaluation was successfully created"
    click_on "Back"
  end

  test "updating a Evaluation" do
    visit user_evaluations_url
    click_on "Edit", match: :first

    fill_in "Authenticity comment", with: @user_evaluation.authenticity_comment
    check "Authenticity validated" if @user_evaluation.authenticity_validated
    fill_in "Completeness comment", with: @user_evaluation.completeness_comment
    check "Completeness validated" if @user_evaluation.completeness_validated
    fill_in "Depth comment", with: @user_evaluation.depth_comment
    check "Depth validated" if @user_evaluation.depth_validated
    fill_in "Explanation comment", with: @user_evaluation.explanation_comment
    check "Explanation validated" if @user_evaluation.explanation_validated
    fill_in "Extent comment", with: @user_evaluation.extent_comment
    check "Extent validated" if @user_evaluation.extent_validated
    fill_in "Program teacher", with: @user_evaluation.program_teacher
    fill_in "Publication", with: @user_evaluation.publication_id
    fill_in "Validity comment", with: @user_evaluation.validity_comment
    check "Validity validated" if @user_evaluation.validity_validated
    click_on "Update Evaluation"

    assert_text "Evaluation was successfully updated"
    click_on "Back"
  end

  test "destroying a Evaluation" do
    visit user_evaluations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Evaluation was successfully destroyed"
  end
end
