class CreateFashionShowMuseTable < ActiveRecord::Migration[5.2]
  def change
    create_table :fashion_show_muses do |t|
      t.integer :fashion_show_id
      t.integer :muse_id
    end
  end
end
