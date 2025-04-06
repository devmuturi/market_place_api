require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user with valid email should be valid" do
    user = User.new(email: "test@example.com", password_digest: "password")
    assert user.valid?
  end

  test "user with invalid email should be invalid" do
    user = User.new(email: "invalid_email", password_digest: "password")
    assert_not user.valid?
  end

  test "user with duplicate email should be invalid" do
    other_user = users(:one)
    user = User.new(email: other_user.email, password_digest: "password")
    assert_not user.valid?
  end
end
