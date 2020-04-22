class AvailabilitiesController < ApplicationController
   # skip_after_action :verify_policy_scoped, only: :index

  def index
    @availabilities = current_user.availabilities
  end

  def new
    @profile = Profile.find(params[:profile_id])
    @availability = Availability.new
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @availability = Availability.new(availability_params)
    @availability.profile = @profile
    if @availability.save
      creating_slots(@availability)
    else
      render :new
    end
  end

  def creating_slots(availability)
    @profile = Profile.find(params[:profile_id])
    start_date = availability.from_date
    end_date = availability.to_date
    start_time = availability.from_time
    end_time = availability.to_time
    slots = []
    (start_date..end_date).each do |day|
      (start_time.to_i..end_time.to_i).step(availability.slot_time * 60) do |slot|
        slots << Time.at(slot)
        timeslot = Timeslot.new
        timeslot.profile = @profile
        timeslot.date = day
        timeslot.from_time = Time.at(slot)
        timeslot.to_time = Time.at(slot + ((availability.slot_time*60)-1))
        timeslot.save
      end
    end
    redirect_to dashboard_profile_path(@profile)
  end

  def edit
    @user = User.find(params[:id])
    @availability = Availability.find(params[:id])
    authorize @availability
  end

  def update
    @availability = Availability.find(params[:id])
    @availability.user = current_user
    @availability.update(availability_params)
    redirect_to availabilities_path
    authorize @availability
  end

  helper_method :creating_slots

  private

  def availability_params
    params.require(:availability).permit(:from_date, :to_date, :from_time, :to_time, :slot_time)
    # params.require(:availability).permit(:week_day, :breakfast, :lunch, :afterwork)
  end

end
