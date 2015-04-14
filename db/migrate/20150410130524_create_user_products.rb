class CreateUserProducts < ActiveRecord::Migration
  def change
    create_table :user_products do |t|
      t.belongs_to :user
      t.belongs_to :product	
      t.timestamps
    end
  end
end
