class CreateShifts < ActiveRecord::Migration[7.1]
  def change
    create_table :shifts do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.string :type
      t.references :staff, null: false, foreign_key: true

      t.timestamps
    end
  end
end
