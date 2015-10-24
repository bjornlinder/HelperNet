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

  def help_request_params
    params.require(:help_request).permit(:name,:description)
  end
end
