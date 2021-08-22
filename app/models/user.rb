class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Last_name Full-width characters"}
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "First name Full-width characters"}
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "Last name kana Full-width characters"}
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "First name kana Full-width characters"}
  validates :birthday, presence: true
  validates :encrypted_password,:password,:password_confirmation, format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}
end