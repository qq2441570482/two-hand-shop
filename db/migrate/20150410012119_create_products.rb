class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.float :price
      t.text :description
      t.boolean :status
      t.string :avatar
      t.references :category  		
      t.timestamps
    end
  end
end
