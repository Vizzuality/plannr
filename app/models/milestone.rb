class Milestone < ActiveRecord::Base
  has_enumeration_for :milestone, required: true, with: Milestones
end
