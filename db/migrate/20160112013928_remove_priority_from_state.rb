class RemovePriorityFromState < ActiveRecord::Migration
  def change
    remove_column :states, :priority, :integer
  end
end
