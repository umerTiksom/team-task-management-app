class CreateTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :tasks do |t|
      t.timestamps
      t.string :tittle
      t.string :description
      t.string :status
      t.string :priority
    end
  end
end
