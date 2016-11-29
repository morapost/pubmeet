class CreatePubs < ActiveRecord::Migration
  def change
    create_table :pubs do |t|
      t.string :name
      t.float :location
      t.datetime :meet_time
      t.string :image_url

      t.timestamps null: false
    end
  end
end
