class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.integer :todo_list_id
      t.string :task_name
      t.text :description
      t.date :due_date
      t.boolean :complete, default: false

      t.timestamps null: false
    end
  end
end
