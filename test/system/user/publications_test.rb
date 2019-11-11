require "application_system_test_case"

class User::PublicationsTest < ApplicationSystemTestCase
  setup do
    @user_publication = user_publications(:one)
  end

  test "visiting the index" do
    visit user_publications_url
    assert_selector "h1", text: "User/Publications"
  end

  test "creating a Publication" do
    visit user_publications_url
    click_on "New User/Publication"

    fill_in "Content", with: @user_publication.content
    fill_in "Group", with: @user_publication.group_id
    fill_in "Published", with: @user_publication.published
    fill_in "Title", with: @user_publication.title
    fill_in "User", with: @user_publication.user_id
    click_on "Create Publication"

    assert_text "Publication was successfully created"
    click_on "Back"
  end

  test "updating a Publication" do
    visit user_publications_url
    click_on "Edit", match: :first

    fill_in "Content", with: @user_publication.content
    fill_in "Group", with: @user_publication.group_id
    fill_in "Published", with: @user_publication.published
    fill_in "Title", with: @user_publication.title
    fill_in "User", with: @user_publication.user_id
    click_on "Update Publication"

    assert_text "Publication was successfully updated"
    click_on "Back"
  end

  test "destroying a Publication" do
    visit user_publications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Publication was successfully destroyed"
  end
end
