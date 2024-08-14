require "test_helper"

class Tenant1::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tenant1_dashboard_index_url
    assert_response :success
  end
end
