class MissionsController < ApplicationController
  before_action :find_mission_by_id, only: %i[show edit update destroy]

  def index
    @missions = Mission.all
  end

  def show; end

  def new
    @mission = Mission.new
  end

  def edit; end

  def update
    if @mission.update(mission_params)
      redirect_to mission_path(@mission), notice: I18n.t(:update_mission, scope: :notice)
    else
      render :edit
    end
  end

  def create
    @mission = Mission.new(mission_params)

    if @mission.save
      redirect_to missions_url, notice: I18n.t(:create_mission, scope: :notice)
    else
      render :new
    end
  end

  def destroy
    @mission.destroy

    redirect_to missions_url, notice: I18n.t(:destroy_mission, scope: :notice)
  end

  private

  def find_mission_by_id
    @mission = Mission.find(params[:id])
  end

  def mission_params
    params.require(:mission).permit(:title, :description)
  end
end
