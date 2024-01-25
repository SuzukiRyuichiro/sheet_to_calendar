class CreateShiftTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :shift_types do |t|
      t.time :start_at
      t.time :end_at
      t.string :acronym

      t.timestamps
    end
  end
end
