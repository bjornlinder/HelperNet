class HelpRequestsController < ApplicationController
  # before_action :authenticate

  def create
    help_request = HelpRequest.new(help_request_params, status: 'new')

    help_request.user = @current_user || User.first
    help_request.save!

    redirect_to :back
    # respond_to do |format|
    #   format.js { render 'help_requests/create' }
    # end
  end

  def update
    @request = HelpRequest.find(params[:id])
    @requester = User.find(@request.user_id)

    @request.update(assigned_id: current_user.id, status: 'accepted')
    notify_task_assigned(@requester, params[:message])

    redirect_to :back
  end

  private

  def help_request_params
    params.require(:help_request).permit(:name, :description)
  end

  def current_user
    User.first
  end

  def notify_task_assigned(requester, user_message)
    $twilio_client.account.messages.create(
      from: '+14704357638',
      to: requester.phone,
      body: message(requester, user_message)
    )
  end

  def message(requester, user_message)
    "Hi #{requester.full_name}, your task has been accepted. #{'Message: ' + user_message if user_message}"
  end
end