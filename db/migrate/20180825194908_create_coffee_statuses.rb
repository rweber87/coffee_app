class CreateCoffeeStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :coffee_statuses do |t|
      t.boolean :available
      t.string :user_updated_last

      t.timestamps
    end
  end
end
