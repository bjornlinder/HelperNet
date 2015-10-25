class AdminDashboardController < ApplicationController
  # include Authenticable

  before_action :authenticate
  layout 'admin'

  def tasks
    @help_requests = HelpRequest.all
    @my_help_requests = @current_user.help_requests
    @help_request = HelpRequest.new()
  end

  def index
  end

  def account
    @help_requests = @current_user.help_requests

    @user = User.first
  end

  private

  def authenticate
    @current_user = User.first
  end

end