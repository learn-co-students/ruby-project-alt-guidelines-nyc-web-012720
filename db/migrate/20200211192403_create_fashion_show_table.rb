class CreateFashionShowTable < ActiveRecord::Migration[5.2]
  def change
    create_table :fashion_shows do |t|
      t.integer :designer_id
      t.string :season
    end
  end
end
