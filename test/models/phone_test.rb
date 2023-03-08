require "test_helper"

class PhoneTest < ActiveSupport::TestCase
  test "if person exists then create valid phone" do    
    person = Person.new
    person.salutation = "Mr."
    person.firstName = "John"
    person.lastName = "Doe"
    person.save

    phone = Phone.new
    phone.phoneNumber = "5551234479"
    phone.comment = "Lorem ipsum dolor sit amet"
    phone.person_id = person.id

    assert phone.save
  end

  test "if missing person do not create phone" do
    phone = Phone.new
    phone.phoneNumber = "5551234479"
    phone.comment = "Lorem ipsum dolor sit amet"

    assert_not phone.save
  end

  test "if missing required field do not create phone" do 
    person = Person.new
    person.salutation = "Mr."
    person.firstName = "John"
    person.lastName = "Doe"
    person.save

    phone = Phone.new    
    phone.comment = "Lorem ipsum dolor sit amet"
    phone.person_id = person.id

    assert_not phone.save
  end
end
