class AddRoleToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :role, :string
  end
end
