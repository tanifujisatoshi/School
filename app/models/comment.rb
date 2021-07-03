class Comment < ApplicationRecord
  belongs_to :lunch
  belongs_to :user
  validates :text, presence: true
end
