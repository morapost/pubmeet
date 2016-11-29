class AddColumnsToPub < ActiveRecord::Migration
  def change
    add_column :pubs, :locality, :string
    add_column :pubs, :city, :string
    add_column :pubs, :latitude, :float
    add_column :pubs, :longitude, :float
    add_column :pubs, :avg_cost, :integer
    add_column :pubs, :url, :string
    add_column :pubs, :rating, :float
  end
end
