class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.integer :status, null: false
      t.integer :priority, null: false

      t.timestamps
    end
  end
end
