class User < ApplicationRecord
  has_secure_password
  validates :first_name, length: {in: 3..14}, presence: true
  validates :last_name, length: {in: 3..14}, presence: true
  validates :description, length: {maximum: 250}, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: /\A[^@\s]+@([^@\s]+.)+[^@\s]+\z/, message: "Adresse email s'il te plait" }
  validates :password, presence: true, length: {in: 6..20}

  belongs_to :city
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"

  has_many :comments

  def remember(remember_token)
    remember_digest = BCrypt::Password.create(remember_token)
    self.update(remember_digest: remember_digest)
  end
end
