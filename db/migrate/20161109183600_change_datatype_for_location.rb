class ChangeDatatypeForLocation < ActiveRecord::Migration
  def change
      change_column(:pubs, :location, :string)
  end
end
