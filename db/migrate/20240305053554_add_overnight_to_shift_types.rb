class AddOvernightToShiftTypes < ActiveRecord::Migration[7.1]
  def change
    add_column :shift_types, :overnight, :boolean, null: false, default: false
  end
end
