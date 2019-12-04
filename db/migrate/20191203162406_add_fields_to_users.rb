class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_reference :users, :situation, foreign_key: true
  	add_column :users, :formation, :text
  	add_reference :users, :activity, foreign_key: true
  	add_column :users, :description, :text
  	add_column :users, :linked_in_url, :text
  	add_reference :users, :newsletter, foreign_key: true
  end
end
