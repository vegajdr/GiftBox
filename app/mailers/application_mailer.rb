class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@gentoo.app'
  layout 'mailer'
end
