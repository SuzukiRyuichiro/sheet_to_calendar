class CreateShiftTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :shift_types do |t|
      t.string :start_at
      t.string :end_at
      t.string :acronym

      t.timestamps
    end
  end
end
