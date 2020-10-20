class Group < ApplicationRecord
  with_options presence: true do
    validates :name
  end

  has_many :group_users
  has_many :users, through: :group_users
  has_many :comments
  has_many :events
end
