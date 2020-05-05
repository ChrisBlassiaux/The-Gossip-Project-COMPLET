class User < ApplicationRecord
  validates :first_name, length: {in: 3..14}, presence: true
  validates :last_name, length: {in: 3..14}, presence: true
  validates :description, length: {maximum: 250}, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: /\A[^@\s]+@([^@\s]+.)+[^@\s]+\z/, message: "Adresse email s'il te plait" }

  belongs_to :city
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
end
