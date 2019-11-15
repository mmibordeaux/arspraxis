require "application_system_test_case"

class User::StudentsTest < ApplicationSystemTestCase
  setup do
    @user_student = user_students(:one)
  end

  test "visiting the index" do
    visit user_students_url
    assert_selector "h1", text: "User/Students"
  end

  test "creating a Student" do
    visit user_students_url
    click_on "New User/Student"

    check "Confirmed" if @user_student.confirmed
    fill_in "Program group", with: @user_student.program_group_id
    fill_in "User", with: @user_student.user_id
    click_on "Create Student"

    assert_text "Student was successfully created"
    click_on "Back"
  end

  test "updating a Student" do
    visit user_students_url
    click_on "Edit", match: :first

    check "Confirmed" if @user_student.confirmed
    fill_in "Program group", with: @user_student.program_group_id
    fill_in "User", with: @user_student.user_id
    click_on "Update Student"

    assert_text "Student was successfully updated"
    click_on "Back"
  end

  test "destroying a Student" do
    visit user_students_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student was successfully destroyed"
  end
end
