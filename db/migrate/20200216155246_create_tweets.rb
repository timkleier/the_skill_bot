class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :platform
      t.string :term
      t.boolean :sent
      t.date :date_to_send
      t.datetime :sent_timestamp

      t.timestamps
    end
  end
end
