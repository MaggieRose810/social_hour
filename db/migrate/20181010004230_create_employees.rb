class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.references :company, index: true, null: false
      t.string :email
      t.timestamps
    end
  end
end
