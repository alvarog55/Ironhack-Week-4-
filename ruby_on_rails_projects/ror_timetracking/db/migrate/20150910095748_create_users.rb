class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false

      t.timestamps 
    end

    change_table :entries do |t|
      t.references :user, index: true

    end
  end
end
