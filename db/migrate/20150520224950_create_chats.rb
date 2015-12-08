class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :user_id
      t.text :content
      t.integer :parent_chat_id

      t.timestamps
    end
  end
end
