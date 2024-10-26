class CreateFaults < ActiveRecord::Migration[7.2]
  def change
    create_table :faults do |t|
      t.string :name
      t.integer :station_id

      t.timestamps
    end
  end
end
