class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.strng :location
      t.int :age

      t.timestamps
    end
  end
end
