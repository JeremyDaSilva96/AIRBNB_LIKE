class DeletePhotoToFlats < ActiveRecord::Migration[7.1]
  def change
    remove_column :flats, :photo, :string
  end
end
