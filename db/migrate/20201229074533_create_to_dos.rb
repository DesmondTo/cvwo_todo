class CreateToDos < ActiveRecord::Migration[6.1]
  def change
    create_table :to_dos do |t|
      t.string :task
      t.text :detail
      t.date :due_date
      t.time :due_time
      t.boolean :important
      t.boolean :repeat

      t.timestamps
    end
  end
end
