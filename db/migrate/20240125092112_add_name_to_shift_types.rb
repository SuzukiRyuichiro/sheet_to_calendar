class AddNameToShiftTypes < ActiveRecord::Migration[7.1]
  def change
    add_column :shift_types, :name, :string
  end
end
