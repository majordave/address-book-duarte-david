require "test_helper"

class AddressBookControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get address_book_index_url
    assert_response :success
  end
end
