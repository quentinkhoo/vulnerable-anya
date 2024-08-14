require "test_helper"

class Tenant2::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tenant2_dashboard_index_url
    assert_response :success
  end
end
