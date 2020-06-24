class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :handdle
      t.string :content
      t.date :date
      t.string :link
      t.references :keyword, null: false, foreign_key: true

      t.timestamps
    end
  end
end
