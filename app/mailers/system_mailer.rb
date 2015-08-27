class SystemMailer < ApplicationMailer
  def welcome(email, token, username)
    @token = token
    @username = username
    
    mail to: email, subject: "歡迎申請試用 Mission-Apartment"
  end
end
