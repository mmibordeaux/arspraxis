require "application_system_test_case"

class ReferentialsTest < ApplicationSystemTestCase
  setup do
    @referential = referentials(:one)
  end

  test "visiting the index" do
    visit referentials_url
    assert_selector "h1", text: "Referentials"
  end

  test "creating a Referential" do
    visit referentials_url
    click_on "New Referential"

    fill_in "Name", with: @referential.name
    click_on "Create Referential"

    assert_text "Referential was successfully created"
    click_on "Back"
  end

  test "updating a Referential" do
    visit referentials_url
    click_on "Edit", match: :first

    fill_in "Name", with: @referential.name
    click_on "Update Referential"

    assert_text "Referential was successfully updated"
    click_on "Back"
  end

  test "destroying a Referential" do
    visit referentials_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Referential was successfully destroyed"
  end
end
