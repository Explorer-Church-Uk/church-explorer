# Preview all emails at http://localhost:3000/rails/mailers/weddings_mailer
class WeddingsMailerPreview < ActionMailer::Preview
  def new_wedding
    WeddingsMailer.with(couple_nickname:'weeble and pepper',wedding_phone:'01225462814',wedding_date:'04/12/2022',wedding_time:'12:00',wedding_message:'this is a test',wedding_email:'JesusisLord33333@outlook.com').new_wedding
  end
  def to_pastor
    WeddingsMailer.with(couple_nickname:'weeble and pepper',wedding_phone:'01225462814',wedding_date:'04/12/2022',wedding_time:'12:00',wedding_message:'this is a test',wedding_email:'JesusisLord33333@outlook.com',wedding_message:'this is a test').to_pastor
  end
end
