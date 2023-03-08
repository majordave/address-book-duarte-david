require "test_helper"

class PhoneControllerTest < ActionDispatch::IntegrationTest
  test "should post create" do
    sign_in_helper
    
    person = Person.new
    person.salutation = "Mr."
    person.firstName = "John"    
    person.lastName = "Doe"
    person.save

    post phone_create_path person, params: {
      phoneNumber: "5551234479",      
      comment: "Lorem ipsum dolor sit amet" 
    }
    assert_response :success
  end
  
  test "should get read" do    
    sign_in_helper    
    person = Person.new
    person.salutation = "Mr."
    person.firstName = "John"    
    person.lastName = "Doe"
    person.save

    phone = Phone.new
    phone.phoneNumber = "5551234479"
    phone.comment = "Lorem ipsum dolor sit amet"
    phone.person_id = person.id
    phone.save

    get phone_read_path phone
    assert_response :success
  end

  test "should put update" do
    sign_in_helper    
    person = Person.new
    person.salutation = "Mr."
    person.firstName = "John"    
    person.lastName = "Doe"
    person.save

    phone = Phone.new
    phone.phoneNumber = "5551234479"
    phone.comment = "Lorem ipsum dolor sit amet"
    phone.person_id = person.id
    phone.save

    put '/phone', params: {
      id: phone.id,            
      phoneNumber: "5551234490",
      comment: "Lorem ipsum dolor sit amet" 
    }
    assert_response :success
  end

  test "should delete phone" do
    person = Person.new
    person.salutation = "Mr."
    person.firstName = "John"    
    person.lastName = "Doe"
    person.save

    phone = Phone.new
    phone.phoneNumber = "5551234479"
    phone.comment = "Lorem ipsum dolor sit amet"
    phone.person_id = person.id
    phone.save

    sign_in_helper
    delete phone_delete_path phone
    assert_redirected_to person_phones_path(id: phone.person_id)
  end
end
