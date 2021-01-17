class CreateItem < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :text
      t.string :size
      t.belongs_to :user, null: false, foreign_key: true
      #t.belongs_to :city, null: false, foreign_key: true
      t.timestamps
    end
  end
end
