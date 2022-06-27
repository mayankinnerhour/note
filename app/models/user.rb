class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  #Relationship
  has_many :permissions
  has_many :notes, through: :permissions

  validates :email, presence: true
  validates :email, uniqueness: true
end
