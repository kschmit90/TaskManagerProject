class AddTasksUsersJoinTable < ActiveRecord::Migration
  def up
    create_table :tasks_users do |t|
      t.integer :task_id
      t.integer :user_id
    end
  end

  def down
    drop_table :tasks_users
  end
end
