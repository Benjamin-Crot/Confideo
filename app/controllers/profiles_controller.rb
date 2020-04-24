class ProfilesController < ApplicationController


  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save
      redirect_to dashboard_profile_path(@profile)
    else
      render :new
    end
  end

  def show
    @profile = Profile.find(params[:id])
    @user = User.find(@profile.user_id)
    @timeslots = @profile.timeslots.where(user_id: nil)
    today = Date.today
  end


  def index
    if params[:query].present?
      @profiles = Profile.where("profession ILIKE ?", "%#{params[:query]}%")
    else
      @profiles= Profile.all
    end
  end

  def dashboard
    @profile = Profile.find(params[:id])
    @timeslots = @profile.timeslots
    @user = User.find(@profile.user_id)
    @reasons = Reason.where(profile_id: @profile.id)
    @timeslots_free = @profile.timeslots.where(user_id: nil)
    @timeslots_booked = @profile.timeslots.where.not(user_id: nil)
  end

  def calendar
    @profile = Profile.find(params[:id])
    @timeslots = @profile.timeslots
  end

  private

  def profile_params
    params.require(:profile).permit(:profession, :description)
  end
end
