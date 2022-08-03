require "test_helper"

class OverseersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @overseer = overseers(:one)
  end

  test "should get index" do
    get overseers_url
    assert_response :success
  end

  test "should get new" do
    get new_overseer_url
    assert_response :success
  end

  test "should create overseer" do
    assert_difference("Overseer.count") do
      post overseers_url, params: { overseer: { bio: @overseer.bio, user_id: @overseer.user_id } }
    end

    assert_redirected_to overseer_url(Overseer.last)
  end

  test "should show overseer" do
    get overseer_url(@overseer)
    assert_response :success
  end

  test "should get edit" do
    get edit_overseer_url(@overseer)
    assert_response :success
  end

  test "should update overseer" do
    patch overseer_url(@overseer), params: { overseer: { bio: @overseer.bio, user_id: @overseer.user_id } }
    assert_redirected_to overseer_url(@overseer)
  end

  test "should destroy overseer" do
    assert_difference("Overseer.count", -1) do
      delete overseer_url(@overseer)
    end

    assert_redirected_to overseers_url
  end
end
