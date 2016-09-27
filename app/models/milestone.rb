class Milestone < ApplicationRecord
  has_enumeration_for :milestone, required: true, with: Milestones
  belongs_to :project

  scope :incoming, -> { where("release_date >= ?", Date.today) }
end
