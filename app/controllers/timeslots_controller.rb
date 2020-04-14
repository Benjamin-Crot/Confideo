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

  def index
    @timeslot = Timeslot.all
  end

  def update
    @timeslot = Timeslot.find(params[:id])
    @timeslot.user = current_user
    @timeslot.update
    # redirect_to availabilities_path
  end

  def booking
    @timeslot = Timeslot.find(params[:id])
    @timeslot.user = current_user
    @timeslot.save
    redirect_to profiles_path
  end

  private

  def timeslot_params
    params.require(:timeslot).permit(:date, :from_time, :to_time)
  end
end