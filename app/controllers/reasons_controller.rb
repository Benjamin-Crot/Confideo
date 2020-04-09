class ReasonsController < ApplicationController

  def index
    @profile = Profile.find(params[:profile_id])
    @reasons = Reasons.where(profile_id: @profile)
  end

  def new
    @profile = Profile.find(params[:profile_id])
    @reason = Reason.new
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @reason = Reason.new(reason_params)
    @reason.profile = @profile
    if @reason.save
      redirect_to dashboard_profile_path(@profile)
    else
      render :new
    end
  end

  def edit
    @reason = Reason.find(params[:id])
  end

  def update
    @reason = Reason.find(params[:id])
    @profile = Profile.find(@reason.profile_id)
    @reason.update(reason_params)
    redirect_to dashboard_profile_path(@profile)
  end

  def destroy
    @reason = Reason.find(params[:id])
    @profile = Profile.find(@reason.profile_id)
    @reason.destroy
    redirect_to dashboard_profile_path(@profile)
  end

  private

  def reason_params
    params.require(:reason).permit(:name, :price)
  end
end
