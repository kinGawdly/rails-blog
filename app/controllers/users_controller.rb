class UsersController < ApplicationController
    def new
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
      params.require(:session).permit(:email, :password, :password_confirmation)
    end 

end
