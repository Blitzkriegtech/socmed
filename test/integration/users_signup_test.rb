require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup info" do
    get signup_path

    assert_no_difference "User.count" do
      post users_path, params: { user: { name: "",
                                        email: "user@invalid.com",
                                        password: "foo",
                                        password_confirmation: "bar" } }
      assert_response :unprocessable_entity
      assert_template "users/new"
    end
  end

  test "check error messages from invalid signup info" do
    get signup_path

    post users_path, params: { user: { name: "",
                                       email: "user@invalid.com",
                                       password: "foo",
                                      password_confirmation: "bar" } }
    assert_select "div.bg-red-30"
    assert_select "li.error-item", count: 3
  end

  test "successful user sign up" do
    get signup_path
    assert_difference "User.count", 1 do
    post users_path, params: { user: { name: "aljun rendon",
                                       email: "aljunrendon@example.com",
                                       password: "foobar" },
                                      password_confirmation: "foobar" }
    end
    follow_redirect!

    assert_not_nil flash[:success]
    assert_select "div.alert-success", text: /Welcome to SOCMED!/
    assert_template "users/show"
    assert is_logged_in?
  end
end
