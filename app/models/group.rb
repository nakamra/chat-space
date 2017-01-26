class Group < ApplicationRecord
  validates :name, presence: true
  validates :add_error_user_ids, presence: true
  has_many :users, through: :groups_users
  has_many :groups_users
  accepts_nested_attributes_for :groups_users
end

def add_error_user_ids
  if user_ids.empty?
    errors.add(:user_ids, "が選択されていません")
  end
end
