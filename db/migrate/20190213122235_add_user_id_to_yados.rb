class AddUserIdToYados < ActiveRecord::Migration[5.2]
  def change
    add_column :yados, :user_id, :integer
  end
end
