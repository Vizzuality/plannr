class AddEmailAndTitleAndManagesProjectsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :email, :string
    add_column :users, :title, :string
    add_column :users, :manages_projects, :boolean, default: false
  end
end
