class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.references :company, null: false, index: true
      t.datetime :event_at
      t.timestamps
    end
  end
end
