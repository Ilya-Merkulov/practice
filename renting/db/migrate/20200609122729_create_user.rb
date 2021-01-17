class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :phone_number
      t.string :login
      t.string :password
      t.timestamps
    end
  end
end
