class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.integer :car_id
      t.integer :event_id

      t.timestamps
    end
  end
end
