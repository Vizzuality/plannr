class AddIntranetUrlToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :intranet_url, :string
  end
end
