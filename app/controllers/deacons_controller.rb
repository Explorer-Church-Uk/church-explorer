class DeaconsController < ApplicationController
  before_action :set_deacon, only: %i[ show edit update destroy ]

  # GET /deacons or /deacons.json
  def index
    @deacons = Deacon.all
  end

  # GET /deacons/1 or /deacons/1.json
  def show
  end

  # GET /deacons/new
  def new
    @deacon = Deacon.new
  end

  # GET /deacons/1/edit
  def edit
  end

  # POST /deacons or /deacons.json
  def create
    @deacon = Deacon.new(deacon_params)

    respond_to do |format|
      if @deacon.save
        format.html { redirect_to deacon_url(@deacon), notice: "Deacon was successfully created." }
        format.json { render :show, status: :created, location: @deacon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @deacon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deacons/1 or /deacons/1.json
  def update
    respond_to do |format|
      if @deacon.update(deacon_params)
        format.html { redirect_to deacon_url(@deacon), notice: "Deacon was successfully updated." }
        format.json { render :show, status: :ok, location: @deacon }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @deacon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deacons/1 or /deacons/1.json
  def destroy
    @deacon.destroy

    respond_to do |format|
      format.html { redirect_to deacons_url, notice: "Deacon was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deacon
      @deacon = Deacon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deacon_params
      params.require(:deacon).permit(:member_id)
    end
end
