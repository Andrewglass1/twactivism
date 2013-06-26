class CreatePoliticians < ActiveRecord::Migration
  def change
    create_table :politicians do |t|
      t.string :name
      t.string :handle
      t.string :state
      t.string :party
      t.string :avatar

      t.timestamps
    end
  end
end
