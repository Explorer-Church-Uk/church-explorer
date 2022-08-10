require 'vpim/icalendar'
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
    WeddingsMailer.new_wedding(params[:couple_nickname],params[:wedding_date],params[:wedding_time],wedding_ics_file(wedding_date:params,wedding_time:string))
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

  def wedding_ics_file(to_pastor=false,wedding_date:string,wedding_time:string,couple_nickname:string)
    wedding_time = Time.new(wedding_time)
    wedding_datetime = DateTime.new(wedding_date)
    wedding_datetime.change(hour:wedding_time.hour,min:wedding_time.min)
    cal = Vpim::Icalendar.create2

    cal.add_event do |e|
      e.dtstart       wedding_datetime
      e.dtend         wedding_datetime
      e.summary       to_pastor ? "Wedding Date To Confirm" : "Your Preferred Wedding Date"
      e.description 'A Wedding Date - To Be Confirmed'
      e.categories    [ 'APPOINTMENT' ]
      e.categories do |c| c.push 'WEDDING' end
      e.url           'https://carmelpeasdown.church'
      e.access_class  "PRIVATE"
      e.transparency  'OPAQUE'

      now = Time.now
      e.created       now
      e.lastmod       now

      e.organizer do |o|
        o.cn = "Carmel Church - Peasdown"
        o.uri = "mailto:weddings@carmelpeasdown.church"
      end

      attendee = Vpim::Icalendar::Address.create("mailto:#{params[:wedding_email]}")
      attendee.rsvp = false
      e.add_attendee attendee
      pastor = Vpim::Icalendar::Address.create("mailto:m.s.cooke@btinternet.com")
      pastor.rsvp = true
      e.add_attendee pastor
    end

    icsfile = File.new("./prefered_wedding_reservatation/#{couple_nickname}-#{wedding_date}-#{wedding_time.strftime('%I-%M')}.ics",'rw')
    icsfile.write(cal.encode)
    return icsfile.read()
  end
end
