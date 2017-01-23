class Group < ApplicationRecord
  validates :name, presence: true
  has_many :users, through: :groups_users
  has_many :groups_users
  accepts_nested_attributes_for :groups_users
end
