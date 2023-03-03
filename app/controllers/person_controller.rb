class PersonController < ApplicationController
  def create
    person = Person.create(person_params)

    redirect_to address_book_path
  end

  def read
  end

  def update
  end

  def delete
    @person = Person.find(params[:id])
    @person.delete

    redirect_to address_book_path
  end

  def person_params

    params.permit(:salutation, :firstName, :lastName, :middleName, :ssn, :birthDate, :comment)
  end
end
