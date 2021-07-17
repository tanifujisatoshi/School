require 'rails_helper'

RSpec.describe Lunch, type: :model do
  before do
    @lunch = FactoryBot.build(:lunch)
  end

  describe '献立新規投稿' do
    context '新規投稿がうまくいかない時' do
      it 'soupが空では登録できない' do
        @lunch.soup = ''
        @lunch.valid?
        expect(@lunch.errors.full_messages).to include("Soup can't be blank")
      end

      it 'staple_foodが空では登録できない' do
        @lunch.staple_food = ''
        @lunch.valid?
        expect(@lunch.errors.full_messages).to include("Staple food can't be blank")
      end

      it 'main_dishが空では登録できない' do
        @lunch.main_dish = ''
        @lunch.valid?
        expect(@lunch.errors.full_messages).to include("Main dish can't be blank")
      end

      it 'side_dishが空では登録できない' do
        @lunch.side_dish = ''
        @lunch.valid?
        expect(@lunch.errors.full_messages).to include("Side dish can't be blank")
      end

      it 'drinkが空では登録できない' do
        @lunch.drink = ''
        @lunch.valid?
        expect(@lunch.errors.full_messages).to include("Drink can't be blank")
      end

      it 'otherが空では登録できない' do
        @lunch.other = ''
        @lunch.valid?
        expect(@lunch.errors.full_messages).to include("Other can't be blank")
      end

      it 'menu_dateが空では登録できない' do
        @lunch.menu_date = ''
        @lunch.valid?
        expect(@lunch.errors.full_messages).to include("Menu date can't be blank")
      end
    end
  end
end

