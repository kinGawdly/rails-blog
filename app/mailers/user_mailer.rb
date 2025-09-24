class UserMailer < ApplicationMailer

    def confirm_account
        @user = params[:user]
        @url  = "http://localhost:3000/confirm_email/#{@user.token}"
        mail(to: @user.email , subject: 'Welcome to My Awesome Site')
    end
end
