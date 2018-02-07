class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets, id: :uuid do |t|
      t.string :text, null: false
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps null: false
    end
  end
end
