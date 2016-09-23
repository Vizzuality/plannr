class Roster < ApplicationRecord
  belongs_to :user
  belongs_to :team

  scope :active, -> { joins(:team).where(teams: { active: true }) }
end
