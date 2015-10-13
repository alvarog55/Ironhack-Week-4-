class CreateBits < ActiveRecord::Migration
  def change
    create_table :bits do |t|

      t.timestamps null: false
    end
  end
end
