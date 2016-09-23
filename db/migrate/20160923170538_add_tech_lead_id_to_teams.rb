class AddTechLeadIdToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :tech_lead_id, :integer
  end
end
