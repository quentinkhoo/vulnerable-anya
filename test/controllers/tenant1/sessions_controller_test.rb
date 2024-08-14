require "test_helper"

class Tenant1::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get tenant1_sessions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get tenant1_sessions_destroy_url
    assert_response :success
  end
end
