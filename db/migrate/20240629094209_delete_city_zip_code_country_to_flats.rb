class DeleteCityZipCodeCountryToFlats < ActiveRecord::Migration[7.1]
  def change
    remove_column :flats, :city, :string
    remove_column :flats, :zip_code, :integer
    remove_column :flats, :country, :string
  end
end
