class ShiftsController < ApplicationController
  def index
    staff = Staff.find_by(slug: params[:slug])

    @shifts = staff.shifts
  end

  def import; end
end
