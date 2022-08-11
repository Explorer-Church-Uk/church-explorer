class WeddingsMailer < ApplicationMailer
  def new_wedding(wedding_email=params[:wedding_email],couple_nickname=params[:couple_nickname],wedding_date=params[:wedding_date],wedding_time=params[:wedding_time])
    attachments['your_proposed_wedding_date.vcs'] = self.wedding_ics_file(false)
    @couple_nickname = couple_nickname
    @wedding_date = wedding_date
    @wedding_time = wedding_time
    mail to: wedding_email,subject: 'Wedding Appointment'
  end
  def to_pastor(couple_nickname=params[:couple_nickname],wedding_phone=params[:wedding_phone],wedding_date=params[:wedding_date],wedding_time=params[:wedding_time],wedding_message=params[:wedding_message])
    attachments['proposed_wedding_date.vcs'] = self.wedding_ics_file(true )
    attachments['contact_details.vcf'] = self.couple_contact_vcard()

    @wedding_phone = wedding_phone
    @wedding_date = wedding_date
    @wedding_time = wedding_time
    @couple_nickname = couple_nickname
    @wedding_message = wedding_message

    mail to: ENV['celebrant_email'],subject: "New Wedding Appointment Needs Confirmation - #{couple_nickname}"
  end

  def couple_contact_vcard(wedding_email=params[:wedding_email],wedding_phone=params[:wedding_phone],couple_nickname=params[:couple_nickname])
    contact_vcard_directory = Vpim::DirectoryInfo.create(
      [
        Vpim::DirectoryInfo::Field.create('VERSION', '2.1')
      ], 'VCARD')

    contact_vcard = Vpim::Vcard::Maker.make2(contact_vcard_directory) do |maker|
      maker.name do |n|
        n.given = couple_nickname
      end
      maker.nickname = couple_nickname
      maker.add_tel(wedding_phone){ |telephone| telephone.location = 'home'; telephone.preferred = true }
      maker.add_email(wedding_email) do |contact_email|
        contact_email.preferred = 'yes'
        contact_email.location = 'home'
      end
    end
    return contact_vcard.to_s
  end

  def wedding_ics_file(to_pastor,wedding_date=params[:wedding_date],wedding_time=params[:wedding_time],couple_nickname=params[:couple_nickname])
    wedding_time = Time.new(wedding_time)
    wedding_datetime = DateTime.parse(wedding_date)
    wedding_datetime.change(hour:wedding_time.hour,min:wedding_time.min)
    cal = Vpim::Icalendar.create2

    cal.add_event do |e|
      e.dtstart       wedding_datetime
      e.dtend         wedding_datetime
      e.summary       to_pastor ? "Wedding Date To Confirm - #{couple_nickname}" : "Your Preferred Wedding Date"
      e.description 'A Wedding Date - To Be Confirmed'
      e.categories    [ 'APPOINTMENT' ]
      e.categories do |c| c.push 'WEDDING' end
      e.url           'https://carmelpeasdown.church'
      e.access_class  "PRIVATE"
      e.transparency  'OPAQUE'

      now = Time.now
      e.created       now
      e.lastmod       now

      # e.organizer = Vpim::Icalendar::Address.create("mailto:weddings@carmelpeasdown.church")

      attendee = Vpim::Icalendar::Address.create("mailto:#{params[:wedding_email]}")
      attendee.rsvp = false
      e.add_attendee attendee
      pastor = Vpim::Icalendar::Address.create("mailto:#{ENV['celebrant_email']}")
      pastor.rsvp = true
      e.add_attendee pastor
    end

    icsfile = File.new("#{Rails.root}/preferred_wedding_reservations/#{couple_nickname}-#{Date.parse(wedding_date).strftime('%d-%m-%Y')}-#{wedding_time.strftime('%I-%M')}.vcs",'w+')
    icsfile.write(cal.encode)
    return icsfile.read()
  end
end
