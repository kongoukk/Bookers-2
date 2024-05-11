class RemoveUserNameFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :user_name, :string
  end
end
