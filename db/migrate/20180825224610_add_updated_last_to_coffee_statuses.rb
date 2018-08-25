class AddUpdatedLastToCoffeeStatuses < ActiveRecord::Migration[5.1]
  def change
  	add_column :coffee_statuses, :last_updated, :string
  end
end
