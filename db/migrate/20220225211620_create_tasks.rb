class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :category_id
      t.string :task_name
      t.text :task_body
      t.datetime :deadline

      t.timestamps
    end
  end
end
