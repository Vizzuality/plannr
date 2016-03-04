class ArchivedProjectsController < ApplicationController

  def index
    @projects = Project.order(:name).archived
  end
end
