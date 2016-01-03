class AddOwnerToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :owner, :integer
  end
end
