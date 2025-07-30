class UsersController < ApplicationController
    skip_before_action :authenticate_user!, only: [:new, :create]
    
    
    def new
        @user = User.new
        # Initialize a new user object for the signup form
    end

    def index
        @users = User.all
        # Fetch all users to display in the index view
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "User was successfully created."
            # Redirect to the articles index page after successful user creation
        else
            render :new, status: :unprocessable_entity
            # Render the new template if validation fails
        end
    end

    private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end 

end
