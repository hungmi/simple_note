require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    user = users(:one)
    assert user.valid?, user.errors.full_messages
  end
end
