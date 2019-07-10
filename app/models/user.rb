class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true, length: {minimum: 2}

  has_many :articles

  def full_name
      "#{first_name.capitalize} #{last_name.upcase}"
  end
end
