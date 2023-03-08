require "test_helper"

class EmailControllerTest < ActionDispatch::IntegrationTest
  test "should post create" do
    sign_in_helper
    
    person = Person.new
    person.salutation = "Mr."
    person.firstName = "John"    
    person.lastName = "Doe"
    person.save

    post email_create_path person, params: {
      emailAddress: "johndoe@gmail.com",      
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

    email = Email.new
    email.emailAddress = "johndoe@google.com"
    email.comment = "Lorem ipsum dolor sit amet"
    email.person_id = person.id
    email.save

    get email_read_path email
    assert_response :success
  end

  test "should put update" do
    sign_in_helper    
    person = Person.new
    person.salutation = "Mr."
    person.firstName = "John"    
    person.lastName = "Doe"
    person.save

    email = Email.new
    email.emailAddress = "johndoe@google.com"
    email.comment = "Lorem ipsum dolor sit amet"
    email.person_id = person.id
    email.save

    put '/email', params: {
      id: email.id,            
      emailAddress: "johndoe@gmail.com",
      comment: "Lorem ipsum dolor sit amet" 
    }
    assert_response :success
  end

  test "should delete email" do
    person = Person.new
    person.salutation = "Mr."
    person.firstName = "John"    
    person.lastName = "Doe"
    person.save

    email = Email.new
    email.emailAddress = "johndoe@google.com"
    email.comment = "Lorem ipsum dolor sit amet"
    email.person_id = person.id
    email.save

    sign_in_helper
    delete email_delete_path email
    assert_redirected_to person_emails_path(id: email.person_id)
  end
end
