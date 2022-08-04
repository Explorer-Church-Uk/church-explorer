class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :city
      t.string :postcode
      t.string :mobile
      t.string :home_phone
      t.string :work_phone

      t.timestamps
    end
  end
end
