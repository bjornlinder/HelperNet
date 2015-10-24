class HelpRequestsController < ApplicationController
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
    @request = HelpRequest.find_by(params[:id])
    @requester = User.find_by(@request.user_id)

    @request.update(assigned_id: current_user.id, status: 'accepted')
  end

  def help_request_params
    params.require(:help_request).permit(:name,:description)
  end
end
