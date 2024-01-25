class Shift < ApplicationRecord
  belongs_to :staff
  # belongs_to :location

  enum type: {
    mid: :mid,
    fst: :fst,
    ama: :ama,
    apm: :apm,
    or: :or
  }, _suffix: :shift
end
