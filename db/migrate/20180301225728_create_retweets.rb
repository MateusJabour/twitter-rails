class CreateRetweets < ActiveRecord::Migration[5.1]
  def change
    create_table :retweets, id: :uuid do |t|
      t.references :user, foreign_key: true, type: :uuid
      t.uuid :tweet_id, foreign_key: true

      t.timestamps null: false
    end
  end
end
