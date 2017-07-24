class TableUsers < ActiveRecord::Migration
  def change
    create_table :users
   add_column :users, :firstname, :string
   add_column :users, :lastname, :string
   add_column :users, :mdp, :string

  end
end
