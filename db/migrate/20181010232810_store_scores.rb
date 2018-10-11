class StoreScores < ActiveRecord::Migration[5.0]
  def change
    add_column :employee_groups, :score, :integer
    add_column :groups, :score, :integer
  end
end
