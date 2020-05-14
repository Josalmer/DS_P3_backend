# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable, :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self,
                               authentication_keys: [:email],
                               case_insensitive_keys: [:email],
                               strip_whitespace_keys: [:email]

  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]{2,4}$\z/i }

  has_many :cash_addeds

  after_create :create_user_shopping_basket

  def to_s
    email
  end

  def create_user_shopping_basket
    basket = ShoppingBasket.new
    basket.user = self
    basket.save
  end
end
