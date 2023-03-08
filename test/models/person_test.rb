require "test_helper"

class PersonTest < ActiveSupport::TestCase
  test "create valid person" do    
    person = Person.new
    person.salutation = "Mr."
    person.firstName = "John"
    person.middleName = "Dee"
    person.lastName = "Doe"
    person.ssn = "12312333"
    person.birthDate = "2023-01-01"
    person.comment  = "Lorem ipsum dolor sit amet" 

    assert person.save
  end

  test "if missing required field do not create person" do 
    person = Person.new
    person.salutation = "Mr."    
    person.middleName = "Dee"
    person.lastName = "Doe"

    assert_not person.save
  end
end
