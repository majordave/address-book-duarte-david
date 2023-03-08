require "test_helper"

class AddressBookControllerTest < ActionDispatch::IntegrationTest
  test "if signed in should get index" do
    sign_in_helper
    get root_path
    assert_response :success
  end

  test "if not signed in should get redirected to welcome" do    
    get root_path
    assert_redirected_to :welcome
  end
end
