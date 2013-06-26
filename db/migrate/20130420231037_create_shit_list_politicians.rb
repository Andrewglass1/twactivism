class CreateShitListPoliticians < ActiveRecord::Migration
  def change
    create_table :shit_list_politicians do |t|
      t.integer :politician_id
      t.integer :shit_list_id

      t.timestamps
    end
  end
end
