class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name, uniqueness: true
      t.string :type
      t.string :location
      t.belongs_to :jobs
      
      t.timestamps
    end
  end
end
