class AddPhotosToFlats < ActiveRecord::Migration[7.1]
  def change
    add_column :flats, :photos, :string
  end
end
