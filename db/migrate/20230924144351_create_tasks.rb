class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    unless table_exists?(:tasks)
      create_table :tasks do |t|
        t.string :name
        t.text :description
        t.timestamps
      end
    end
  end
end
