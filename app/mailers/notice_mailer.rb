class NoticeMailer < ApplicationMailer

  default from: ENV["SMTP_USER_NAME"]
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.buy.subject
  #
  def buy(email, sale)
    @sale = sale
    @email = email
    mail(#to: email,
        to: ENV["SMTP_USER_NAME"],
        subject: "明細"
        )
  end
  
end
