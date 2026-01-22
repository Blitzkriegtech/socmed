require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_path
    assert_response :success
    assert_equal "Sign Up | Social Media App", full_title("Sign Up")
  end
end
