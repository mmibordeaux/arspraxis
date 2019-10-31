require "application_system_test_case"

class CriticalLearningsTest < ApplicationSystemTestCase
  setup do
    @critical_learning = critical_learnings(:one)
  end

  test "visiting the index" do
    visit critical_learnings_url
    assert_selector "h1", text: "Critical Learnings"
  end

  test "creating a Critical learning" do
    visit critical_learnings_url
    click_on "New Critical Learning"

    fill_in "Competency", with: @critical_learning.competency_id
    fill_in "Description", with: @critical_learning.description
    fill_in "Level", with: @critical_learning.level_id
    fill_in "Not reached", with: @critical_learning.not_reached
    fill_in "Number", with: @critical_learning.number
    fill_in "Over reached", with: @critical_learning.over_reached
    fill_in "Partially reached", with: @critical_learning.partially_reached
    fill_in "Reached", with: @critical_learning.reached
    click_on "Create Critical learning"

    assert_text "Critical learning was successfully created"
    click_on "Back"
  end

  test "updating a Critical learning" do
    visit critical_learnings_url
    click_on "Edit", match: :first

    fill_in "Competency", with: @critical_learning.competency_id
    fill_in "Description", with: @critical_learning.description
    fill_in "Level", with: @critical_learning.level_id
    fill_in "Not reached", with: @critical_learning.not_reached
    fill_in "Number", with: @critical_learning.number
    fill_in "Over reached", with: @critical_learning.over_reached
    fill_in "Partially reached", with: @critical_learning.partially_reached
    fill_in "Reached", with: @critical_learning.reached
    click_on "Update Critical learning"

    assert_text "Critical learning was successfully updated"
    click_on "Back"
  end

  test "destroying a Critical learning" do
    visit critical_learnings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Critical learning was successfully destroyed"
  end
end
