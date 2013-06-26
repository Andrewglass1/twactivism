class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :user_id
      t.integer :politician_id
      t.string :recipient
      t.datetime :sent_at
      t.string :content

      t.timestamps
    end
  end
end
