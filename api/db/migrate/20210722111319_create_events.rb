class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string      :eventname,        null: false
      t.datetime    :datetime,         null: false
      t.string      :cityward,         null: false
      t.string      :streetaddress,    null: false
      t.text        :description,      null: false
      t.references  :user,             null: false, foreign_key: true

      t.timestamps
    end
  end
end
