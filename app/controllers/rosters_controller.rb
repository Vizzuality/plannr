class RostersController < ApplicationController
  before_action :set_user, only: [:new, :create]
  before_action :set_roster, only: [:destroy]
  before_action :set_teams, only: [:new]

  def new
    @roster = @user.rosters.new
  end

  def create
    @roster = @user.rosters.new(roster_params)

    respond_to do |format|
      if @roster.save
        format.html { redirect_to users_url,
                      notice: "#{@user.name} successfully added to #{@roster.team.name}." }
        format.json { render :show, status: :created, location: @team }
      else
        format.html {
          set_teams
          render :new
        }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @roster.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Roster was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_roster
    @roster = Roster.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_teams
    @teams = Team.order(:name).active
  end

  def roster_params
    params.require(:roster).permit(:user_id, :team_id, :percentage)
  end
end
