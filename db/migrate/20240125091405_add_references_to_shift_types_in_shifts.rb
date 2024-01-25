class AddReferencesToShiftTypesInShifts < ActiveRecord::Migration[7.1]
  def change
    add_reference :shifts, :shift_type, null: false, foreign_key: true
  end
end
