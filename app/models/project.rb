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

  def status_for date
    return nil unless start_date
    return "underway" if !end_date && start_date <= date

    if start_date.beginning_of_month <= date && end_date.end_of_month >= date
      "underway"
    end
  end

  def self.filtered filters
    result = all
    with_or = false
    if filters[:project_manager_id].present?
      result = result.managed_by(filters[:project_manager_id])
      with_or = true
    end
    if filters[:team_id].present?
      result = if with_or
                 self.or(result.for_team(filters[:team_id]))
               else
                 result.for_team(filters[:team_id])
               end
    end
    result
  end
end
