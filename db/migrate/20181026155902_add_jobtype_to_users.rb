class AddJobtypeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :jobtype, :integer, array: true, default: []
  end
end
