class CreateShitLists < ActiveRecord::Migration
  def change
    create_table :shit_lists do |t|
      t.string :title
      t.string :avatar
      t.text :about
      t.text :more

      t.timestamps
    end
  end
end
