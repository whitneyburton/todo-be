class User < ApplicationRecord
  acts_as_token_authenticatable

  has_many :todos
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :email, :encrypted_password
end
