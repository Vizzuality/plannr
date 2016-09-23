class User < ApplicationRecord
  has_many :projects

  scope :project_managers, -> { where(manages_projects: true).order(:name) }
end
