class Lunch < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validates :soup, presence: true
  validates :staple_food, presence: true
  validates :main_dish, presence: true
  validates :side_dish, presence: true
  validates :drink, presence: true
  validates :other, presence: true
  validates :menu_date, presence: true
  
end
