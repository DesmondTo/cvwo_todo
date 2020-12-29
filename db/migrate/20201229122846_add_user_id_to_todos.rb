class AddUserIdToTodos < ActiveRecord::Migration[6.1]
  def change
    add_column :to_dos, :user_id, :integer
    add_index :to_dos, :user_id
  end
end
