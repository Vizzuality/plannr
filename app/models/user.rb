class User < ApplicationRecord
  has_enumeration_for :role, with: Roles
  has_secure_password

  has_many :projects
  has_many :rosters
  has_many :teams, through: :rosters

  scope :project_managers, -> { where(role: Roles::PROJECT_MANAGER) }
  scope :tech_leads, -> { where(role: Roles::TECH_LEAD) }

  validates_uniqueness_of :email

  def display_name
    return email if !name
    s = name.split
    return s.first if s.size == 1
    "#{s[0]} #{s.last[0]}."
  end
end
