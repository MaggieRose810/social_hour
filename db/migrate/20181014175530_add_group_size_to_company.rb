class AddGroupSizeToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :group_size, :integer, null: false
  end
end
