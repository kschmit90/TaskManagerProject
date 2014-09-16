class AddCategoriesTasksJoinTable < ActiveRecord::Migration
  def up
    create_join_table :categories, :tasks
  end

  def down
    drop_table :catgories_tasks
  end
end
