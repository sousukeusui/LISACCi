class UserMailer < ApplicationMailer
    def registration_mail(tentative_user)
        @tentative_user = tentative_user
        mail(to: @tentative_user.mail, subject: 'メールタイトル')
    end
end
