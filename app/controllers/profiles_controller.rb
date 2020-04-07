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
  end

  def dashboard
    @profile = Profile.find(params[:id])
    @user = User.find(@profile.user_id)
  end

  private

  def profile_params
    params.require(:profile).permit(:profession, :description)
  end
end
