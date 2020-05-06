class Gossip < ApplicationRecord
  validates :title, length: {in: 3..14}, presence: true
  validates :content, presence: true, length: {maximum: 250}

  belongs_to :user
  has_many :join_table_tag_gossips
  has_many :gossips, through: :join_table_tag_gossips

  has_many :comments
end
