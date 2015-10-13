class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
    	t.integer :minutes
    	t.integer :hours
    	t.references :project, index: true
    	t.text :comment
    	t.datetime :start_date
      t.timestamps null: false
    end
  end
end
