class CreateSolutions < ActiveRecord::Migration[7.2]
  def change
    create_table :solutions do |t|
      t.string :name
      t.integer :fault_id

      t.timestamps
    end
  end
end
