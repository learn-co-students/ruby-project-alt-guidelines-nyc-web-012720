class CreateMuseTable < ActiveRecord::Migration[5.2]
  def change
    create_table :muses do |t|
      t.string :name
      t.integer :height
    end
  end
end
