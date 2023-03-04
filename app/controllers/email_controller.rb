class EmailController < ApplicationController
  def create
    @email= Email.create(email_params)
    response = {created: true, id: @email.id, emailAddress: @email.emailAddress, comment: @email.comment}
    render json: response.to_json
  end

  def read
    @email = Email.find(params[:id])
    render json: @email.to_json
  end

  def update
    @email = Email.find(params[:id])
    @email.update(email_params)

    response = {updated: true, id: @email.id, emailAddress: @email.emailAddress, comment: @email.comment}
    render json: response.to_json
  end

  def delete
    @email = Email.find(params[:id])
    @person_id = @email.person_id
    @email.delete

    redirect_to person_emails_path(id: @person_id)
  end

  def email_params
    params.permit(:emailAddress, :comment, :person_id)
  end
end
