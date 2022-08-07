class WeddingsController < ApplicationController
  before_action :set_wedding, only: %i[ show edit update destroy ]

  # GET /weddings or /weddings.json
  def index
    @weddings = Wedding.all
  end

  # GET /weddings/1 or /weddings/1.json
  def show
  end

  # GET /weddings/new
  def new
    @wedding = Wedding.new
  end

  # GET /weddings/1/edit
  def edit
  end

  # POST /weddings or /weddings.json
  def create
    @wedding = Wedding.new(wedding_params)

    respond_to do |format|
      if @wedding.save
        format.html { redirect_to wedding_url(@wedding), notice: "Wedding was successfully created." }
        format.json { render :show, status: :created, location: @wedding }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wedding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weddings/1 or /weddings/1.json
  def update
    respond_to do |format|
      if @wedding.update(wedding_params)
        format.html { redirect_to wedding_url(@wedding), notice: "Wedding was successfully updated." }
        format.json { render :show, status: :ok, location: @wedding }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wedding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weddings/1 or /weddings/1.json
  def destroy
    @wedding.destroy

    respond_to do |format|
      format.html { redirect_to weddings_url, notice: "Wedding was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def request_wedding

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wedding
      @wedding = Wedding.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wedding_params
      params.require(:wedding).permit(:user_id, :mobile, :proposed_wedding_date, :actual_wedding_date, :prenuptual_appointment)
    end
end
