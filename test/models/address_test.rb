require "test_helper"

class AddressTest < ActiveSupport::TestCase
  test "if person exists then create valid address" do    
    person = Person.new
    person.salutation = "Mr."
    person.firstName = "John"
    person.lastName = "Doe"
    person.save

    address = Address.new
    address.street = "Wall Street 123"
    address.town = "Smallville"
    address.zipCode = "72712"
    address.state = "Texas"
    address.country = "United States"
    address.person_id = person.id

    assert address.save
  end

  test "if missing person do not create address" do
    address = Address.new
    address.street = "Wall Street 123"
    address.town = "Smallville"
    address.zipCode = "72712"
    address.country = "United States"  

    assert_not address.save
  end

  test "if missing required field do not create address" do 
    person = Person.new
    person.salutation = "Mr."
    person.firstName = "John"
    person.lastName = "Doe"
    person.save

    address = Address.new
    address.street = "Wall Street 123"
    address.zipCode = "72712"
    address.country = "United States"
    address.person_id = person.id

    assert_not address.save
  end
end
