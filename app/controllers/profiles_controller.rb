class ProfilesController < ApplicationController
  skip_before_action :user_has_profile?, only: %i[new create]
  before_action :set_profile, only: %i[ show edit update destroy ]
 

  # GET /profiles or /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1 or /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles or /profiles.json
  def create
    @profile = current_user.build_profile(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: "Profile was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: "Profile was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1 or /profiles/1.json
  def destroy
    @profile.destroy!

    respond_to do |format|
      format.html { redirect_to profiles_path, status: :see_other, notice: "Profile was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:name, :city, :country, :birth, :gender, :role)
    end
end
