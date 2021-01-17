class RemoveCityRefFromItem < ActiveRecord::Migration[6.0]
  def change
    remove_reference :items, :city, index: true, foreign_key: true
  end
end
