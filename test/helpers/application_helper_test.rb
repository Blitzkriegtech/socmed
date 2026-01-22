require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal "Social Media App", full_title
    assert_equal "Help | Social Media App", full_title("Help")
  end
end
