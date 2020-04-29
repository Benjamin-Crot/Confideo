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
    @timeslot.update(timeslot_params)
    redirect_to root_path
  end

  def booking_timeslot

    @timeslot = Timeslot.find(params[:id])
    @timeslot.user = current_user
    # @timeslot = Timeslot.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def booking
    @timeslot = Timeslot.find(params[:id])
    @timeslot.user = current_user


    raise
    @timeslot.save
    redirect_to profiles_path

    # raise
    # @timeslot = Timeslot.find(params[:id])
    # @timeslot.user = current_user
    # @timeslot.save
    # redirect_to profiles_path
  end

  def destroy
    # @profile = Timeslot.profile
    @timeslot = Timeslot.find(params[:id])
    @timeslot.destroy
    # redirect_to dashboard_profile_path(@profile)
  end

  private

  def timeslot_params
    params.require(:timeslot).permit(:date, :from_time, :to_time, :reason_id)
  end
end
