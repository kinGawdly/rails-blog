class MaquillajesController < ApplicationController
  before_action :set_maquillaje, only: %i[ show edit update destroy ]

  # GET /maquillajes or /maquillajes.json
  def index
    @maquillajes = Maquillaje.all
  end

  # GET /maquillajes/1 or /maquillajes/1.json
  def show
  end

  # GET /maquillajes/new
  def new
    @maquillaje = Maquillaje.new
  end

  # GET /maquillajes/1/edit
  def edit
  end

  # POST /maquillajes or /maquillajes.json
  def create
    @maquillaje = Maquillaje.new(maquillaje_params)

    respond_to do |format|
      if @maquillaje.save
        format.html { redirect_to @maquillaje, notice: "Maquillaje was successfully created." }
        format.json { render :show, status: :created, location: @maquillaje }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maquillaje.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maquillajes/1 or /maquillajes/1.json
  def update
    respond_to do |format|
      if @maquillaje.update(maquillaje_params)
        format.html { redirect_to @maquillaje, notice: "Maquillaje was successfully updated." }
        format.json { render :show, status: :ok, location: @maquillaje }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maquillaje.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maquillajes/1 or /maquillajes/1.json
  def destroy
    @maquillaje.destroy!

    respond_to do |format|
      format.html { redirect_to maquillajes_path, status: :see_other, notice: "Maquillaje was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maquillaje
      @maquillaje = Maquillaje.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def maquillaje_params
      params.require(:maquillaje).permit(:name, :description, :price)
    end
end
