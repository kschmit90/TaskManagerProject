class AddCategoriesTasksJoinTable < ActiveRecord::Migration
  def up
    create_table :categories_tasks do |t|
      t.integer :category_id
      t.integer :task_id
    end
  end

  def down
    drop_table :catgories_tasks
  end
end
