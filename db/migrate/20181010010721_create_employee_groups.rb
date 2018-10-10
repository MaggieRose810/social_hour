class CreateEmployeeGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :employee_groups do |t|
      t.references :employee, index: true, null: false
      t.references :group, index: true, null: false
      t.timestamps
    end
  end
end
