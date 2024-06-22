class AddZipCodeToFlats < ActiveRecord::Migration[7.1]
  def change
    add_column :flats, :zip_code, :integer
  end
end
