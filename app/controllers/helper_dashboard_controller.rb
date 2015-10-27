class HelperDashboardController < ApplicationController
  # include Authenticable

  before_action :authenticate
  layout 'helper'

  def index
    @help_requests = HelpRequest.order(status: :desc).limit(10)
    # @my_help_requests = @current_user.help_requests
    # @help_request = HelpRequest.new()
  end

  private

  def authenticate
    @current_user = User.first
  end

end