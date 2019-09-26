class AddRateToYados < ActiveRecord::Migration[5.2]
  def change
    add_column :yados, :rate, :integer
  end
end
