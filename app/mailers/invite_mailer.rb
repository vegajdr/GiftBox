class InviteMailer < ApplicationMailer

  def invite_email email
    @url  = 'http://giftbox-tiy.herokuapp.com/sign_up'
    mail(to: email, subject: 'You have been invited to Gentoo!')
  end
end
