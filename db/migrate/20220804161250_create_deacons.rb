class CreateDeacons < ActiveRecord::Migration[7.0]
  def change
    create_table :deacons do |t|
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
