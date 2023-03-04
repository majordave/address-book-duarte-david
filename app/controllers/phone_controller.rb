class PhoneController < ApplicationController
  def create
    @phone= Phone.create(phone_params)
    response = {created: true, id: @phone.id, phoneNumber: @phone.phoneNumber, comment: @phone.comment}
    render json: response.to_json
  end

  def read
    @phone = Phone.find(params[:id])
    render json: @phone.to_json
  end

  def update
    @phone = Phone.find(params[:id])
    @phone.update(phone_params)

    response = {updated: true, id: @phone.id, phoneNumber: @phone.phoneNumber, comment: @phone.comment}
    render json: response.to_json
  end

  def delete
    @phone = Phone.find(params[:id])
    @person_id = @phone.person_id
    @phone.delete

    redirect_to person_phones_path(id: @person_id)
  end

  def phone_params
    params.permit(:phoneNumber, :comment, :person_id)
  end
end
