class CreateOverseers < ActiveRecord::Migration[7.0]
  def change
    create_table :overseers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :bio

      t.timestamps
    end
  end
end
