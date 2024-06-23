class AddCountryToFlatsAgain < ActiveRecord::Migration[7.1]
  def change
    add_column :flats, :country, :string
  end
end
