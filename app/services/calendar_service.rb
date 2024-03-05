# frozen_string_literal: true

class CalendarService
  def initialize(shifts)
    @shifts = shifts
  end

  def call
    cal = Icalendar::Calendar.new

    @shifts.each do |shift|
      # Assuming shift.date is the date of the shift,
      # and shift.shift_type.start_at/end_at are the times.
      start_datetime = combine_date_and_time(shift.date, shift.shift_type.start_at)
      end_datetime = combine_date_and_time(shift.date, shift.shift_type.end_at, shift.shift_type.overnight?)

      cal.event do |e|
        e.dtstart = Icalendar::Values::DateTime.new(start_datetime, 'tzid' => 'JST')
        e.dtend = Icalendar::Values::DateTime.new(end_datetime, 'tzid' => 'JST')
        e.summary = shift.shift_type.name
        e.description = 'Details about the shift'
      end
    end

    cal
  end

  private

  def combine_date_and_time(date, time, overnight = false)
    # Parse the time to get hour and minute
    parsed_time = Time.zone.parse(time.to_s)
    datetime = DateTime.new(date.year, date.month, date.day, parsed_time.hour, parsed_time.min)

    # If the shift is overnight and the time is for end_at, add 1 day to the date
    datetime += 1.day if overnight && parsed_time.hour < 12 # Assuming end_at < 12 means it's the next day

    datetime
  end
end
