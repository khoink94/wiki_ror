class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :article_id
      t.integer :votes

      t.timestamps null: false
    end
  end
end
