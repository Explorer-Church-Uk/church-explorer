class WeddingsMailer < ApplicationMailer
  def new_wedding(wedding_email,couple_nickname,wedding_date,wedding_time,ics_file)
    attachments['your_proposed_wedding_date.ics'] = ics_file
    @couple_nickname = couple_nickname
    @wedding_date = wedding_date
    @wedding_time = wedding_time
    mail to: wedding_email,subject: 'Wedding Appointment'
  end
  def to_pastor(couple_nickname,wedding_phone,wedding_date,wedding_time,ics_file,vcard)
    attachments['proposed_wedding_date.ics'] = ics_file
    attachments['contact_details.ics'] = vcard

    @wedding_phone = wedding_phone
    @wedding_date = wedding_date
    @wedding_time = wedding_time
    @couple_nickname = couple_nickname

    mail to:'m.s.cooke@btinternet.com',subject: "New Wedding Appointment Needs Confirmation - #{couple_nickname}"
  end
end
