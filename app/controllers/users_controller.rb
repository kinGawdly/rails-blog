class UsersController < ApplicationController
    skip_before_action :authenticate_user!, only: [:new, :create, :confirm_email]
    before_action :set_user, only: %i[show edit update destroy] 
    
    def index
        @users = User.all
        # Fetch all users to display in the index view
    end

    def show
    end
    
    def new
        @user = User.new
        # Initialize a new user object for the signup form
    end

    def edit
        # This action is used to render the edit user form
        # The @user instance variable is set by the before_action :set_user
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user), notice: "User was successfully updated."
            # Redirect to the user's show page after successful update
        else
            render :edit, status: :unprocessable_entity
            # Render the edit template if validation fails
        end
    end

    def destroy
    
        session[:user_id] = nil if current_user == @user
        @user.destroy
        redirect_to users_path, notice: "User was successfully deleted."
        # Redirect to the users index page after successful deletion
    end

    def confirm_email
        user = User.find_by(token: params[:token])
        user.update!(is_confirmed?: true)
        redirect_to login_path, notice: "Your email has been confirmed. Please log in."
    end

    # This action handles user signup
    # It creates a new user and logs them in if successful


    def create
        @user = User.new(user_params)
        if @user.save
            UserMailer.with(user: @user).confirm_account.deliver_later
            redirect_to login_path, notice: "An email was sent to your account to confirm your email address."
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

    def set_user
        @user = User.find(params[:id])
        # Find the user by ID for actions that require a specific user
    end 

end
