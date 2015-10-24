class TwilioHelpRequestsController < ActionController::Base
  protect_from_forgery with: :null_session

  def create
    @content = params[:Body].split(%r{[;\/]})
    load_or_create_user

    create_help_request

    render 'request_received.xml.erb', content_type: 'text/xml'
  end

  private

  def load_or_create_user
    from = params.require(:From).sub('+1', '')
    name = load_name

    @user = User.find_or_create_by(phone: from, full_name: name, user_type: 'client')
  end

  def load_name
    if @content.length == 3
      @format_is_correct = true
      @content[0]
    end
  end

  def create_help_request
    if @format_is_correct
      title = @content[1]
      description = @content[2]
    else
      description = @content[0]
    end

    HelpRequest.create!(user: @user, name: title, description: description, status: 'new')
  end

end
