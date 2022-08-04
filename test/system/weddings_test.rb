require "application_system_test_case"

class WeddingsTest < ApplicationSystemTestCase
  setup do
    @wedding = weddings(:one)
  end

  test "visiting the index" do
    visit weddings_url
    assert_selector "h1", text: "Weddings"
  end

  test "should create wedding" do
    visit weddings_url
    click_on "New wedding"

    fill_in "Actual wedding date", with: @wedding.actual_wedding_date
    fill_in "Mobile", with: @wedding.mobile
    fill_in "Prenuptual appointment", with: @wedding.prenuptual_appointment
    fill_in "Proposed wedding date", with: @wedding.proposed_wedding_date
    fill_in "User", with: @wedding.user_id
    click_on "Create Wedding"

    assert_text "Wedding was successfully created"
    click_on "Back"
  end

  test "should update Wedding" do
    visit wedding_url(@wedding)
    click_on "Edit this wedding", match: :first

    fill_in "Actual wedding date", with: @wedding.actual_wedding_date
    fill_in "Mobile", with: @wedding.mobile
    fill_in "Prenuptual appointment", with: @wedding.prenuptual_appointment
    fill_in "Proposed wedding date", with: @wedding.proposed_wedding_date
    fill_in "User", with: @wedding.user_id
    click_on "Update Wedding"

    assert_text "Wedding was successfully updated"
    click_on "Back"
  end

  test "should destroy Wedding" do
    visit wedding_url(@wedding)
    click_on "Destroy this wedding", match: :first

    assert_text "Wedding was successfully destroyed"
  end
end
