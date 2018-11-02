class AddJobtypesToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :jobtype
    add_column :users, :jobtype, :string
  end
end
