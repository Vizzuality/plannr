class ChangeBudgetToFloat < ActiveRecord::Migration
  def change
    change_column :projects, :budget, "numeric USING (CASE WHEN budget = '' THEN NULL ELSE budget::numeric END)"
  end
end
