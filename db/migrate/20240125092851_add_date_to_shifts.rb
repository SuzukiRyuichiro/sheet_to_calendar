class AddDateToShifts < ActiveRecord::Migration[7.1]
  def change
    add_column :shifts, :date, :date
  end
end
