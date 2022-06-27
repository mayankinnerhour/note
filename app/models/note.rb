class Note < ApplicationRecord
  has_many :permissions
  has_many :user, through: :permissions

  validates :title, :description, presence: true
end
