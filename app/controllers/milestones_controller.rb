class MilestonesController < ApplicationController
  before_action :set_milestone, only: [:edit, :update, :destroy]
  before_action :set_project, only: [:new, :edit, :create]


  # GET /milestones
  def index
    @milestones = Milestone.joins(:project).where(projects: {archived: false}).
      incoming.order("release_date ASC")
  end

  # GET /milestones/new
  def new
    @milestone = @project.milestones.build
  end

  # GET /milestones/1/edit
  def edit
  end

  # POST /milestones
  # POST /milestones.json
  def create
    @milestone = @project.milestones.build(milestone_params)

    respond_to do |format|
      if @milestone.save
        format.html { redirect_to @project,
                      notice: 'Milestone was successfully created.' }
        format.json { render :show, status: :created, location: @milestone }
      else
        format.html { render :new }
        format.json { render json: @milestone.errors,
                      status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /milestones/1
  # PATCH/PUT /milestones/1.json
  def update
    respond_to do |format|
      if @milestone.update(milestone_params)
        format.html { redirect_to @project,
                      notice: 'Milestone was successfully updated.' }
        format.json { render :show, status: :ok, location: @milestone }
      else
        format.html { render :edit }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /milestones/1
  # DELETE /milestones/1.json
  def destroy
    @project = @milestone.project
    @milestone.destroy
    respond_to do |format|
      format.html { redirect_to @project,
                    notice: 'Milestone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = params[:project_id] ? Project.find(params[:project_id]) :
        @milestone.project
    end

    def set_milestone
      @milestone = Milestone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def milestone_params
      params.require(:milestone).permit(:project_id, :milestone,
                                        :release_date, :name)
    end
end
