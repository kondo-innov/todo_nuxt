class CreateTweetComments < ActiveRecord::Migration[6.0]
  def change
    create_table :tweet_comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tweet, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
