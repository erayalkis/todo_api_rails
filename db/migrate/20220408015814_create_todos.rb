class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :name, null: false
      t.boolean :status, null: false
      t.timestamps
    end
  end
end
