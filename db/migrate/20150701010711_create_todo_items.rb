class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.integer :todo_list_id
      t.string :task_name
      t.string :description
      t.date :due_date
      t.boolean :complete

      t.timestamps null: false
    end
  end
end
