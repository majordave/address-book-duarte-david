require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user creation works" do
    user = User.new
    user.username = "myUser"
    user.password_digest = "ENCRYPTEDPASSWORDIGEST"
    assert user.save
  end
end
