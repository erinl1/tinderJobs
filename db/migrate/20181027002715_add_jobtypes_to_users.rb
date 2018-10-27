class AddJobtypesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :jobtype, :string
  end
end
