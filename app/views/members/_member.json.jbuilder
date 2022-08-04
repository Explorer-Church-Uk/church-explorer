json.extract! member, :id, :user_id, :name, :address1, :address2, :address3, :city, :postcode, :mobile, :home_phone, :work_phone, :created_at, :updated_at
json.url member_url(member, format: :json)
