# frozen_string_literal: true

class ShiftType < ApplicationRecord
  validates :start_at, presence: true
  validates :end_at, presence: true
  validate :validate_time_based_on_overnight

  private

  def validate_time_based_on_overnight
    if overnight? && end_at > start_at # When overnight and end is later than start (i.e. start 10:00 end 22:00)
      errors.add(:end_at, 'must be smaller thatn start_at for overnight shifts')
    elsif !overnight? && start_at > end_at # When day shift but start is later than end
      # When overnight is false, end_at should be later in the day than start_at.
      errors.add(:end_at, 'must be after start_at for non-overnight shifts')
    end
  end
end
