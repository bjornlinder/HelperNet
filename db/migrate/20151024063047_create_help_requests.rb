class CreateHelpRequests < ActiveRecord::Migration
  def change
    create_table :help_requests do |t|
      t.string :name
      t.text :description
      t.string :status
      t.integer :assigned_id, references: :users

      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
