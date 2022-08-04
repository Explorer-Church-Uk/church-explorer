require "test_helper"

class DeaconsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deacon = deacons(:one)
  end

  test "should get index" do
    get deacons_url
    assert_response :success
  end

  test "should get new" do
    get new_deacon_url
    assert_response :success
  end

  test "should create deacon" do
    assert_difference("Deacon.count") do
      post deacons_url, params: { deacon: { member_id: @deacon.member_id } }
    end

    assert_redirected_to deacon_url(Deacon.last)
  end

  test "should show deacon" do
    get deacon_url(@deacon)
    assert_response :success
  end

  test "should get edit" do
    get edit_deacon_url(@deacon)
    assert_response :success
  end

  test "should update deacon" do
    patch deacon_url(@deacon), params: { deacon: { member_id: @deacon.member_id } }
    assert_redirected_to deacon_url(@deacon)
  end

  test "should destroy deacon" do
    assert_difference("Deacon.count", -1) do
      delete deacon_url(@deacon)
    end

    assert_redirected_to deacons_url
  end
end
