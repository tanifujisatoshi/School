class Lunch < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  with_options presence: true do
    validates :soup
    validates :staple_food
    validates :main_dish
    validates :side_dish
    validates :drink
    validates :other
    validates :menu_date
    validates :image
  end
end
