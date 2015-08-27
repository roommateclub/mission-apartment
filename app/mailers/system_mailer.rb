class SystemMailer < ApplicationMailer
  def welcome
    mail to: "jeffreytradings@gmail.com", subject: "測試"
  end
end
