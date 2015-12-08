class Chat < ActiveRecord::Base
  attr_accessible :content, :user_id, :parent_chat_id
  belongs_to :user, dependent: :destroy
  has_many   :replies, class_name: "Chat", foreign_key: "parent_chat_id"
  belongs_to :main,    class_name: "Chat", foreign_key: "parent_chat_id"

  validates :content, :user_id, presence: true

end
