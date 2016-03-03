class RemoveNameFromMilestones < ActiveRecord::Migration
  def change
    remove_column :milestones, :name, :string
  end
end
