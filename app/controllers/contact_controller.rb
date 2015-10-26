class ContactController < ApplicationController
  def new
    ContactFormMailer.send_email(
      params['name'],
      params['email'],
      params['phone'],
      params['message']
    ).deliver_later

    redirect_to :back
  end
end