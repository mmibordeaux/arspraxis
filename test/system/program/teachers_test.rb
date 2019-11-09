require "application_system_test_case"

class Program::TeachersTest < ApplicationSystemTestCase
  setup do
    @program_teacher = program_teachers(:one)
  end

  test "visiting the index" do
    visit program_teachers_url
    assert_selector "h1", text: "Program/Teachers"
  end

  test "creating a Teacher" do
    visit program_teachers_url
    click_on "New Program/Teacher"

    fill_in "Details", with: @program_teacher.details
    fill_in "Program", with: @program_teacher.program_id
    fill_in "Role", with: @program_teacher.role
    fill_in "User", with: @program_teacher.user_id
    click_on "Create Teacher"

    assert_text "Teacher was successfully created"
    click_on "Back"
  end

  test "updating a Teacher" do
    visit program_teachers_url
    click_on "Edit", match: :first

    fill_in "Details", with: @program_teacher.details
    fill_in "Program", with: @program_teacher.program_id
    fill_in "Role", with: @program_teacher.role
    fill_in "User", with: @program_teacher.user_id
    click_on "Update Teacher"

    assert_text "Teacher was successfully updated"
    click_on "Back"
  end

  test "destroying a Teacher" do
    visit program_teachers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Teacher was successfully destroyed"
  end
end
