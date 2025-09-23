class SessionsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:login, :create]
    skip_before_action :user_has_profile?
    # Skip authentication for login and create actions

    def login
        # Render the login form
    end

    def destroy
        session[:user_id] = nil
        redirect_to login_path, notice: "Logged out successfully."
        # Clear the session and redirect to the login page
    end

    def create
        
        @user = User.find_by(email: params[:session][:email])

        if @user.present? && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Logged in successfully."
        else
            redirect_to login_path, alert: "Invalid email or password."
            # Redirect to the login page with an error message if authentication fails
        end
    end
end
