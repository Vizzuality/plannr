class User < ApplicationRecord
  has_enumeration_for :role, with: Roles
  has_secure_password

  has_many :projects
  has_many :rosters
  has_many :teams, through: :rosters
  has_many :active_teams, -> { where("teams.active = true") }, through: :rosters,
    class_name: "Team", source: :team

  scope :project_managers, -> { where(role: [Roles::PROJECT_MANAGER, Roles::EXECUTIVE]) }
  scope :tech_leads, -> { where(role: Roles::TECH_LEAD) }

  validates_uniqueness_of :email

  def display_name
    return email if !name
    s = name.split
    return s.first if s.size == 1
    "#{s[0]} #{s.last[0]}."
  end

  def can_manage_projects?
    role && [Roles::PROJECT_MANAGER, Roles::EXECUTIVE].include?(role)
  end
end
