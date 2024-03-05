# frozen_string_literal: true

class ShiftsController < ApplicationController
  def index
    staff = Staff.find_by!(slug: params[:slug])
    @shifts = staff.shifts

    cal = CalendarService.new(@shifts).call

    headers['Content-Type'] = 'text/calendar; charset=UTF-8'
    render plain: cal.to_ical
  end

  def import; end
end
