class TimeslotsController < ApplicationController
  def new
    @profile = Profile.find(params[:profile_id])
    @timeslot = Timeslot.new
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @timeslot = Timeslot.new(timeslot_params)
    @timeslot.profile = @profile
    if @timeslot.save
      redirect_to dashboard_profile_path(@profile)
    else
      raise
      render :new
    end
  end

  private

  def timeslot_params
    params.require(:timeslot).permit(:date, :from_time, :to_time)
  end
end
