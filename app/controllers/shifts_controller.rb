class ShiftsController < ApplicationController
  def index
    staff = Staff.find_by_slug params[:slug]

    shifts = staff.shifts
  end
end
