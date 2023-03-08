require "test_helper"

class AddressControllerTest < ActionDispatch::IntegrationTest
  test "should post create" do
    sign_in_helper
    
    person = Person.new
    person.salutation = "Mr."
    person.firstName = "John"    
    person.lastName = "Doe"
    person.save

    post address_create_path person, params: {
      street: "Wall Street 123",
      town: "Smallville",
      zipCode: "72712",   
      country: "United States"
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

    address = Address.new
    address.street = "Wall Street 123"
    address.town = "Smallville"
    address.zipCode = "72712"
    address.country = "United States"
    address.person_id = person.id
    address.save

    get address_read_path address
    assert_response :success
  end

  test "should put update" do
    sign_in_helper    
    person = Person.new
    person.salutation = "Mr."
    person.firstName = "John"    
    person.lastName = "Doe"
    person.save

    address = Address.new
    address.street = "Wall Street 123"
    address.town = "Smallville"
    address.zipCode = "72712"
    address.country = "United States"
    address.person_id = person.id
    address.save

    put '/address', params: {
      id: address.id,            
      state: "Texas"      
    }
    assert_response :success
  end

  test "should delete address" do
    person = Person.new
    person.salutation = "Mr."
    person.firstName = "John"    
    person.lastName = "Doe"
    person.save

    address = Address.new
    address.street = "Wall Street 123"
    address.town = "Smallville"
    address.zipCode = "72712"
    address.country = "United States"
    address.person_id = person.id
    address.save

    sign_in_helper
    delete address_delete_path address
    assert_redirected_to person_addresses_path(id: address.person_id)
  end
end
