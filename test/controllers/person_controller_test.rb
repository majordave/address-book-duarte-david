require "test_helper"

class PersonControllerTest < ActionDispatch::IntegrationTest
  test "should post create" do
    sign_in_helper
    post '/person', params: {
      salutation: "Mr.",
      firstName: "John",
      middleName: "Dee",
      lastName: "Doe",
      ssn: "12312333",
      birthDate: "2023-01-01",
      comment: "Lorem ipsum dolor sit amet" 
    }
    assert_response :success
  end
  
  test "should get read" do
    person = Person.new
    person.salutation = "Mr."
    person.firstName = "John"    
    person.lastName = "Doe"
    person.save

    sign_in_helper
    get person_read_path person
    assert_response :success
  end

  test "should put update" do
    person = Person.new
    person.salutation = "Mr."
    person.firstName = "John"    
    person.lastName = "Doe"
    person.save

    sign_in_helper
    put '/person', params: {
      id: person.id,      
      ssn: "12312333",
      birthDate: "2023-01-01",
      comment: "Lorem ipsum dolor sit amet" 
    }
    assert_response :success
  end

  test "should delete person" do
    person = Person.new
    person.salutation = "Mr."
    person.firstName = "John"    
    person.lastName = "Doe"
    person.save

    sign_in_helper
    delete person_delete_path person
    assert_redirected_to :address_book
  end
end
