class Team < ApplicationRecord
  belongs_to :project_manager, class_name: 'User'
  belongs_to :tech_lead, class_name: 'User'

  has_many :rosters
  has_many :users, through: :rosters

  scope :active, -> { where(active: true) }
end
