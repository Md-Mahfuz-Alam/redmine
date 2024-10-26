class AddStationFaultSolutionToIssues < ActiveRecord::Migration[7.2]
  def change
    add_column :issues, :station_id, :integer
    add_column :issues, :fault_id, :integer
    add_column :issues, :solution_id, :integer
  end
end
