require "test_helper"

class EmailTest < ActiveSupport::TestCase
  test "if person exists then create valid email" do    
    person = Person.new
    person.salutation = "Mr."
    person.firstName = "John"
    person.lastName = "Doe"
    person.save

    email = Email.new
    email.emailAddress = "johndoe@google.com"
    email.comment = "Lorem ipsum dolor sit amet"
    email.person_id = person.id

    assert email.save
  end

  test "if missing person do not create email" do
    email = Email.new
    email.emailAddress = "johndoe@google.com"
    email.comment = "Lorem ipsum dolor sit amet"

    assert_not email.save
  end

  test "if missing required field do not create email" do 
    person = Person.new
    person.salutation = "Mr."
    person.firstName = "John"
    person.lastName = "Doe"
    person.save

    email = Email.new    
    email.comment = "Lorem ipsum dolor sit amet"
    email.person_id = person.id

    assert_not email.save
  end
end
