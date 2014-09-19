class AddDefaultToOrderInUsers < ActiveRecord::Migration
  def change
    change_column :tasks, :order, :integer, default: 1
  end
end
