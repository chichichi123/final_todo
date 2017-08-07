class AddAvatarToTodoLists < ActiveRecord::Migration[5.1]
  def change
    add_column :todo_lists, :avatar, :string
  end
end
