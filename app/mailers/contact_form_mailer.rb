class ContactFormMailer < ActionMailer::Base
  default from: "HelperNet <noreply@helpernet.org>"

  def send_email(name, email, phone, message)
    mail(to: ENV['CONTACT_EMAIL'], subject: 'Message from HelperNet: ') do |format|
      format.text do render text: %(
          #{name}
          #{email}
          #{phone}
          #{message}
        )
      end
    end
  end
end
