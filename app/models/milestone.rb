class Milestone < ApplicationRecord
  has_enumeration_for :milestone, required: true, with: Milestones
  belongs_to :project
end
