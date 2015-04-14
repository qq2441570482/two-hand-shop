class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.string :title
      t.float :price
      t.text :description
      t.references :category
      t.timestamps
    end
  end
end
