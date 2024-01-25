class RenameColumnsOfShifts < ActiveRecord::Migration[7.1]
  def change
    rename_column :shifts, :start_at, :adjusted_start_at
    rename_column :shifts, :end_at, :adjusted_end_at
  end
end
