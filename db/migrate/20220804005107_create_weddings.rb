class CreateWeddings < ActiveRecord::Migration[7.0]
  def change
    create_table :weddings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :mobile
      t.datetime :proposed_wedding_date
      t.datetime :actual_wedding_date
      t.datetime :prenuptual_appointment

      t.timestamps
    end
  end
end
