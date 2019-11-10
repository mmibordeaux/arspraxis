require "application_system_test_case"

class Referential::ManagersTest < ApplicationSystemTestCase
  setup do
    @referential_manager = referential_managers(:one)
  end

  test "visiting the index" do
    visit referential_managers_url
    assert_selector "h1", text: "Referential/Managers"
  end

  test "creating a Manager" do
    visit referential_managers_url
    click_on "New Referential/Manager"

    fill_in "Referential", with: @referential_manager.referential_id
    fill_in "User", with: @referential_manager.user
    click_on "Create Manager"

    assert_text "Manager was successfully created"
    click_on "Back"
  end

  test "updating a Manager" do
    visit referential_managers_url
    click_on "Edit", match: :first

    fill_in "Referential", with: @referential_manager.referential_id
    fill_in "User", with: @referential_manager.user
    click_on "Update Manager"

    assert_text "Manager was successfully updated"
    click_on "Back"
  end

  test "destroying a Manager" do
    visit referential_managers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Manager was successfully destroyed"
  end
end
