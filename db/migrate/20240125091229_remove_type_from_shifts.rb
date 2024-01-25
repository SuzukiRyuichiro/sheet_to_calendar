class RemoveTypeFromShifts < ActiveRecord::Migration[7.1]
  def change
    remove_column :shifts, :type
  end
end
