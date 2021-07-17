require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it 'passwordが半角英数字を含み6文字以上であれば登録できること' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end

      it 'nameが半角英子文字であれば登録できること' do
        @user.name = 'satoshi'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'nameが全角英大文字だと登録できない' do
        @user.name = 'SATOSHI'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is invalid")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailアドレスが重複していた場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailアドレスに@が無いと登録できないこと' do
        @user.email = 'satoshi1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordとpassword_confirmationの値が一致していないと登録できないこと' do
        @user.password = 'satoshi1234'
        @user.password_confirmation = '1234satoshi'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが正常でもpassword_confirmationが空だと登録できないこと' do
        @user.password = 'satoshi1234'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが5文字以下だと登録できないこと' do
        @user.password = 'sa12'
        @user.password_confirmation = 'sa12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英字のみだと登録できないこと' do
        @user.password = 'satoshi'
        @user.password_confirmation = 'satoshi'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが半角数字のみだと登録できないこと' do
        @user.password = '31043104'
        @user.password_confirmation = '31043104'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが全角英数字混合だと登録できない' do
        @user.password = 'ｚｘｃ１２３４'
        @user.password_confirmation = 'ｚｘｃ１２３４'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

    end

  end
end
