class CreateHelpRequests < ActiveRecord::Migration
  def change
    create_table :help_requests do |t|

      t.timestamps null: false
    end
  end
end
