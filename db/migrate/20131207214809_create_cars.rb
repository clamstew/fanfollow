class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :user_id
      t.integer :seats

      t.timestamps
    end
  end
end
