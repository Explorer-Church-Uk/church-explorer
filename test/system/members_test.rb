require "application_system_test_case"

class MembersTest < ApplicationSystemTestCase
  setup do
    @member = members(:one)
  end

  test "visiting the index" do
    visit members_url
    assert_selector "h1", text: "Members"
  end

  test "should create member" do
    visit members_url
    click_on "New member"

    fill_in "Address1", with: @member.address1
    fill_in "Address2", with: @member.address2
    fill_in "Address3", with: @member.address3
    fill_in "City", with: @member.city
    fill_in "Home phone", with: @member.home_phone
    fill_in "Mobile", with: @member.mobile
    fill_in "Name", with: @member.name
    fill_in "Postcode", with: @member.postcode
    fill_in "User", with: @member.user_id
    fill_in "Work phone", with: @member.work_phone
    click_on "Create Member"

    assert_text "Member was successfully created"
    click_on "Back"
  end

  test "should update Member" do
    visit member_url(@member)
    click_on "Edit this member", match: :first

    fill_in "Address1", with: @member.address1
    fill_in "Address2", with: @member.address2
    fill_in "Address3", with: @member.address3
    fill_in "City", with: @member.city
    fill_in "Home phone", with: @member.home_phone
    fill_in "Mobile", with: @member.mobile
    fill_in "Name", with: @member.name
    fill_in "Postcode", with: @member.postcode
    fill_in "User", with: @member.user_id
    fill_in "Work phone", with: @member.work_phone
    click_on "Update Member"

    assert_text "Member was successfully updated"
    click_on "Back"
  end

  test "should destroy Member" do
    visit member_url(@member)
    click_on "Destroy this member", match: :first

    assert_text "Member was successfully destroyed"
  end
end
