require "application_system_test_case"

class DeaconsTest < ApplicationSystemTestCase
  setup do
    @deacon = deacons(:one)
  end

  test "visiting the index" do
    visit deacons_url
    assert_selector "h1", text: "Deacons"
  end

  test "should create deacon" do
    visit deacons_url
    click_on "New deacon"

    fill_in "Member", with: @deacon.member_id
    click_on "Create Deacon"

    assert_text "Deacon was successfully created"
    click_on "Back"
  end

  test "should update Deacon" do
    visit deacon_url(@deacon)
    click_on "Edit this deacon", match: :first

    fill_in "Member", with: @deacon.member_id
    click_on "Update Deacon"

    assert_text "Deacon was successfully updated"
    click_on "Back"
  end

  test "should destroy Deacon" do
    visit deacon_url(@deacon)
    click_on "Destroy this deacon", match: :first

    assert_text "Deacon was successfully destroyed"
  end
end
