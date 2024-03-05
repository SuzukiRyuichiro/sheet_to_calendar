Shift.destroy_all
Staff.destroy_all
ShiftType.destroy_all
Location.destroy_all

scooter = Staff.create!(name: 'Ryuichiro', slug: :scooter)

shift_types = [
  { acronym: 'MO', name: 'Morning', start_at: '08:00', end_at: '16:00' },
  { acronym: 'EV', name: 'Evening', start_at: '16:00', end_at: '00:00', overnight: true },
  { acronym: 'AM', name: 'Early', start_at: '06:00', end_at: '14:00' },
  { acronym: 'PM', name: 'Late', start_at: '14:00', end_at: '22:00' },
  { acronym: 'OV', name: 'Overnight', start_at: '22:00', end_at: '08:00', overnight: true },
  { acronym: 'MID', name: 'Mid shift (Mgr only)', start_at: '11:00', end_at: '19:00' },
  { acronym: 'FST', name: 'Fire Safety Training (Mgr)', start_at: '09:00', end_at: '13:00' },
  { acronym: 'AMA', name: 'Early (HB/GE→AE)', start_at: '07:00', end_at: '15:00' },
  { acronym: 'APM', name: 'Late (AE→HB/GE)', start_at: '15:00', end_at: '23:00' },
  { acronym: 'OR', name: 'Orientation', start_at: '10:00', end_at: '14:00' }
]
shift_types.each do |shift_type|
  ShiftType.create!(shift_type)
end

locations = [{ name: 'Section L Ginza East', address: '1-14-5 Shintomi-cho Chuo-ku' },
             { name: 'Section L Hatchobori', address: '中央区入船1−9−10' },
             { name: 'Section L Tsukiji', address: '中央区築地6-26-5' },
             { name: 'Section L Kuramae', address: '台東区駒形1-2-7' },
             { name: 'Section L Hamamatsucho', address: '港区浜松町1-16-11' },
             { name: 'Section L Ueno-Hirokoji', address: '台東区上野 3-18-11' },
             { name: 'Section L Yushima', address: '3-25-2 Yushima, Bunkyo-ku' },
             { name: 'Section L Asakusa East', address: '墨田区東駒形４丁目１３−６' },
             { name: 'Section L Residence Ginza', address: '中央区銀座7-10-5' }]

locations.each do |location|
  Location.create!(location)
end

next_month_start = Time.zone.today.at_beginning_of_month.next_month
next_month_end = Time.zone.today.at_end_of_month.next_month
(next_month_start..next_month_end).each do |date|
  shift_types = ShiftType.where(acronym: %w[AM PM])
  scooter.shifts.create!(date: date, shift_type: shift_types.sample)
end
