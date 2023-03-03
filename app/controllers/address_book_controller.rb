class AddressBookController < ApplicationController
  def index
    @people = Person.all
  end
end
