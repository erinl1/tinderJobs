class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :description
      t.belongs_to :company, foreign_key: true

      t.timestamps
    end
  end
end
