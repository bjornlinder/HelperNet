class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :type
      t.string :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
