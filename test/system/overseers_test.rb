require "application_system_test_case"

class OverseersTest < ApplicationSystemTestCase
  setup do
    @overseer = overseers(:one)
  end

  test "visiting the index" do
    visit overseers_url
    assert_selector "h1", text: "Overseers"
  end

  test "should create overseer" do
    visit overseers_url
    click_on "New overseer"

    fill_in "Bio", with: @overseer.bio
    fill_in "User", with: @overseer.user_id
    click_on "Create Overseer"

    assert_text "Overseer was successfully created"
    click_on "Back"
  end

  test "should update Overseer" do
    visit overseer_url(@overseer)
    click_on "Edit this overseer", match: :first

    fill_in "Bio", with: @overseer.bio
    fill_in "User", with: @overseer.user_id
    click_on "Update Overseer"

    assert_text "Overseer was successfully updated"
    click_on "Back"
  end

  test "should destroy Overseer" do
    visit overseer_url(@overseer)
    click_on "Destroy this overseer", match: :first

    assert_text "Overseer was successfully destroyed"
  end
end
