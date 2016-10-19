class Project < ApplicationRecord

  RATE_PER_DAY = 200.00

  has_many :project_reports, dependent: :destroy
  has_many :reports, through: :project_reports

  has_many :milestones, dependent: :destroy
  has_many :invoices, dependent: :destroy
  belongs_to :project_manager, class_name: 'User'
  belongs_to :team
  belongs_to :client

  scope :archived, -> { where(archived: true) }
  scope :live, -> { where(archived: false) }
  scope :for_team, -> (team_id) { where(team_id: team_id) }
  scope :managed_by, -> (project_manager_id) { where(project_manager_id: project_manager_id) }

  def next_milestone_from date
    return nil unless milestones.any?
    milestones.where("release_date >= ?", date).order("release_date ASC").first
  end

  def self.filtered filters
    if filters[:project_manager_id].present? && filters[:team_id].present?
      where("(team_id = ? OR project_manager_id = ?)", filters[:team_id], filters[:project_manager_id])
    elsif filters[:project_manager_id].present?
      managed_by(filters[:project_manager_id])
    elsif filters[:team_id].present?
      for_team(filters[:team_id])
    else
      all
    end
  end
end
