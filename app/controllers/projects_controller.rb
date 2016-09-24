class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :archive]
  before_action :set_project_managers, only: [:new, :edit, :index]
  before_action :set_teams, only: [:new, :edit, :index]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.order(:name).
      includes([:milestones, :invoices, :project_manager]).live.
      filter_with(index_filters)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        set_project_managers
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        set_project_managers
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1/archive
  def archive
    @project.update_attribute(:archived, archive_params)
    if archive_params == "true"
      redirect_to projects_url(index_filters)
    else
      redirect_to archived_projects_url
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def set_project_managers
      @project_managers = User.project_managers
    end

    def set_teams
      @teams = Team.active.order(:name)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :budget, :start_date, :end_date,
                                      :project_manager_id, :team_id, :score)
    end

    def archive_params
      params.require(:archived)
    end

    def index_filters
      params.permit(:team_id, :project_manager_id)
    end
end
