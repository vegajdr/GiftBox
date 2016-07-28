class InviteMailer < ApplicationMailer

  def invite_email email, user
    @user = user
    @url  = 'https://gentoo-2e54b.firebaseapp.com/#/sign-up'
    mail(to: email, subject: 'You have been invited to Gentoo!')
  end
end
