# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
namespace :shift_types do
  namespace :setup do
    # Define a master task to run all setups
    desc 'Run all shift type setups'
    task all: %w[mo ev am pm ov mid fst ama apm or]

    # Define tasks for each shift type
    desc 'Setup for Morning Shift'
    task mo: :environment do
      setup_shift_type('MO', 'Morning', '06:00', '14:00')
    end

    desc 'Setup for Evening Shift'
    task ev: :environment do
      setup_shift_type('EV', 'Evening', '14:00', '22:00')
    end

    # Task for AM (Early) Shift
    desc 'Setup for Early Shift'
    task am: :environment do
      setup_shift_type('AM', 'Early', '04:00', '12:00')
    end

    # Task for PM (Late) Shift
    desc 'Setup for Late Shift'
    task pm: :environment do
      setup_shift_type('PM', 'Late', '12:00', '20:00')
    end

    # Task for OV (Overnight) Shift
    desc 'Setup for Overnight Shift'
    task ov: :environment do
      setup_shift_type('OV', 'Overnight', '21:45', '07:00')
    end

    # Task for MID (Mid shift, Manager only)
    desc 'Setup for Mid Shift (Manager Only)'
    task mid: :environment do
      setup_shift_type('MID', 'Mid shift (Mgr only)', '11:00', '19:00')
    end

    # Task for FST (Fire Safety Training, Manager)
    desc 'Setup for Fire Safety Training (Manager)'
    task fst: :environment do
      setup_shift_type('FST', 'Fire Safety Training (Mgr)', '09:00', '17:00')
    end

    desc 'Setup for AMA Shift'
    task ama: :environment do
      setup_shift_type('AMA', 'Early (HB/GE→AE)', '05:00', '13:00')
    end

    # Task for APM (Late, AE→HB/GE)
    desc 'Setup for APM Shift'
    task apm: :environment do
      setup_shift_type('APM', 'Late (AE→HB/GE)', '13:00', '21:00')
    end

    # Task for OR (Orientation)
    desc 'Setup for Orientation Shift'
    task or: :environment do
      setup_shift_type('OR', 'Orientation', '10:00', '18:00')
    end

    def setup_shift_type(acronym, name, start_at, end_at)
      shift_type = ShiftType.find_or_initialize_by(acronym: acronym)
      shift_type.update(name: name, start_at: start_at, end_at: end_at)
      puts "Shift type #{acronym} (#{name}) setup completed."
    end
  end
end

# rubocop:enable Metrics/BlockLength
