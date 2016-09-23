class Project < ApplicationRecord

  RATE_PER_DAY = 200.00

  has_many :project_reports, dependent: :destroy
  has_many :reports, through: :project_reports

  has_many :milestones, dependent: :destroy
  has_many :invoices, dependent: :destroy
  belongs_to :project_manager, class_name: 'User'
  belongs_to :team

  scope :archived, -> { where(archived: true) }
  scope :live, -> { where(archived: false) }

  def status_for date
    return nil unless start_date
    return "underway" if !end_date && start_date <= date

    if start_date.beginning_of_month <= date && end_date.end_of_month >= date
      "underway"
    end
  end

  def self.filter_with filters
    s = all
    if filters[:team_id].present?
      s = s.where(team_id: filters[:team_id])
    end
    if filters[:project_manager_id].present?
      s = s.where(project_manager_id: filters[:project_manager_id])
    end
    s
  end
end
