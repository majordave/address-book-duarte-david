class AddressController < ApplicationController
  def create
    @address = Address.create(address_params)
    response = {created: true, id: @address.id, street: @address.street, town: @address.town, zipCode: @address.zipCode, state: @address.state, country: @address.country}
    render json: response.to_json
  end

  def read
    @address = Address.find(params[:id])
    render json: @address.to_json
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)

    response = {updated: true, id: @address.id, street: @address.street, town: @address.town, zipCode: @address.zipCode, state: @address.state, country: @address.country}
    render json: response.to_json
  end

  def delete
    @address = Address.find(params[:id])
    @person_id = @address.person_id

    @address.delete

    
    redirect_to person_addresses_path(id: @person_id)
  end

  def address_params
    params.permit(:street, :town, :zipCode, :state, :country, :person_id)
  end
end
