class CreateOlds < ActiveRecord::Migration
  def change
    create_table :olds do |t|
      t.integer :articles_id
      t.string :title
      t.string :content
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :user_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
