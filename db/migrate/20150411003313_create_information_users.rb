class CreateInformationUsers < ActiveRecord::Migration
  def change
    create_table :information_users do |t|
      t.belongs_to :user
      t.belongs_to :information
      t.timestamps
    end
  end
end
