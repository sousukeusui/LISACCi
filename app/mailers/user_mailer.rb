class UserMailer < ApplicationMailer
    def registration_mail
        @tentative_user = params[:tentative_user]
        mail(to: @tentative_user.mail, subject: 'メールタイトル')
    end
end
