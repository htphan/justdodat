class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.integer :user_id
      t.string :title

      t.timestamps null: false
    end
  end
end
