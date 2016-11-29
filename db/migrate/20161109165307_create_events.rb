class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :pub_id
      t.datetime :meet_time

      t.timestamps null: false
    end
  end
end
