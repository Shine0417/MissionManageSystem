class MissionsController < ApplicationController
  def index
    @missions = Mission.all
  end

  def show
  end

  def new
    @mission = Mission.new
  end

  def edit
  end
end
