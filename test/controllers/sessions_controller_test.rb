require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "if user does not exist then redirect to itself" do
    post '/login', params: {username: '', password_digest: ''}
    assert_redirected_to :login
  end

  test "user exists redirect to address_book" do
    sign_in_helper
    assert_redirected_to :address_book
  end

  test "welcome" do
    get '/welcome'
    assert_response :success
  end

end