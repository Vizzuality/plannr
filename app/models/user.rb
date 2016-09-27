class User < ApplicationRecord
  has_secure_password

  has_many :projects
  has_many :rosters
  has_many :teams, through: :rosters

  scope :project_managers, -> { where(manages_projects: true).order(:name) }

  validates_uniqueness_of :email
end
