class AddFavouritesToContacts < ActiveRecord::Migration
  def change
  	add_column :contacts, :favourites, :boolean
  end
end
