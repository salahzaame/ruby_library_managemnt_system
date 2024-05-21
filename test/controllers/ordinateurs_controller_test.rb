require "test_helper"

class OrdinateursControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get ordinateurs_new_url
    assert_response :success
  end
end
