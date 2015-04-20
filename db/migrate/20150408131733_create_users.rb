class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.boolean :gender
      t.string :phone
      t.string :address
      t.string :password_digest
      t.boolean :status
      t.boolean :email_status
      t.boolean :info_status
      t.belongs_to :major
      t.belongs_to :grade
      t.timestamps
    end
  end
end
