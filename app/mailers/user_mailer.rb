class UserMailer < ApplicationMailer

    def confirm_account
        @user = params[:user]
        @url  = 'http://localhost:3000/#{@user.token}'
        mail(to: @user.email , subject: 'Welcome to My Awesome Site')
    end
end
