class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, uniqueness: true
      t.string :password
      t.integer :age
      t.integer :phonenum
      t.text :resume

      t.belongs_to :jobs
      t.timestamps
    end
  end
end
