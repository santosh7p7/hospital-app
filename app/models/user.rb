class User < ActiveRecord::Base
  attr_accessible :department_id, :name
  validates :name, :department_id, presence: true
  belongs_to :department
  has_many :chats
end
