class MissionsController < ApplicationController
  before_action :find_mission_by_id, only: %i[show edit update destroy]

  def index
    @missions = Mission.title_like(search_title).status(search_status).order(sort)
  end

  def show; end

  def new
    @mission = Mission.new
  end

  def edit; end

  def update
    if @mission.update(mission_params)
      if params[:redirect]
        redirect_to({ action: params[:redirect] }, notice: I18n.t(:update_mission, scope: :notice))
      else
        redirect_to mission_path(@mission), notice: I18n.t(:update_mission, scope: :notice)
      end
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
    params.require(:mission).permit(:title, :description, :due_date, :status, :priority)
  end

  def sort_by
    @sort_by = (Mission.column_names.include? params[:sort]) ? params[:sort] : 'created_at'
  end

  def sort_dir
    @sort_dir = params[:reverse].nil? ? 'ASC' : 'DESC'
  end

  def sort
    @sort = { sort_by => sort_dir }
  end

  def search_title
    @search_title ||= (params[:title] || '')
  end

  def search_status
    @search_status ||= (params[:status] || 'All')
  end
end
