class RemoveOrderDefaultFromTasks < ActiveRecord::Migration
  def change
    change_column :tasks, :order, :integer
  end
end
