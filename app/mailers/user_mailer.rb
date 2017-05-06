class UserMailer < ApplicationMailer
  def message_to_reviewer(from, to, subject, body)
    @sender = from
    @receiver = to
    @subject = subject
    @body = body
    mail(from: from, to: to, subject: subject)
  end
end
