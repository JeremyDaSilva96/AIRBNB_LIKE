class RemoveCountryToFlats < ActiveRecord::Migration[7.1]
  def change
    remove_column :flats, :country, :string
  end
end
