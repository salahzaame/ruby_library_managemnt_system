require "test_helper"

class EmpruntsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get emprunts_new_url
    assert_response :success
  end
end
