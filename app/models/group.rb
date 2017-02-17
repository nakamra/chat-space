class Group < ApplicationRecord
  validates :name, presence: true
  has_many :users, through: :groups_users
  has_many :groups_users
  has_many :messages
  accepts_nested_attributes_for :groups_users

  def last_message
    messages.blank? ? "まだメッセージはありません" : messages.last.body
  end
end
