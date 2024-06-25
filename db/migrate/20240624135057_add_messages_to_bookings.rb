class AddMessagesToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :messages, :string
  end
end
