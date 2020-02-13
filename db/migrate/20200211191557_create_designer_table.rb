class CreateDesignerTable < ActiveRecord::Migration[5.2]
  def change
    create_table :designers do |t|
      t.string :name
    end 
  end
end
