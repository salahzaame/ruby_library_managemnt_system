require "test_helper"

class EmpruntControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get emprunt_new_url
    assert_response :success
  end

  test "should get create" do
    get emprunt_create_url
    assert_response :success
  end
end
