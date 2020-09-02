require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it 'nickname, email, encrypted_password が存在すれば登録できる' do
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'nicknameが空では登録できない' do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('ニックネームを入力してください')
        end

        it 'nicknameが7文字以上であれば登録できない' do
          @user.nickname = 'aaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('ニックネームは6文字以内で入力してください')
        end

        it 'emailが空では登録できない' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('Eメールを入力してください')
        end

        it 'emailに@が含まれてい無ければ登録できない' do
          @user.email = 'hoge-gmail.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Eメールは不正な値です')
        end

        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
        end

        it 'passwordが空では登録できない' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードを入力してください')
        end

        it 'passwordは半角英数字混合で無ければ登録できない' do
          @user.password = 'abcdef'
          @user.password_confirmation = 'abcdef'
          @user.valid?
          # binding.pry
          expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
        end

        it 'パスワードは半角英数字混合で無ければ登録できない' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
        end

        it 'パスワードは半角英数字混合で無ければ登録できない' do
          @user.password = 'ＡＢＣＤＥＦ'
          @user.password_confirmation = 'ＡＢＣＤＥＦ'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
        end

        it 'passwordが5文字以下であれば登録できない' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
        end

        it 'passwordが存在してもpassword_confirmationが空では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
        end
      end
    end
  end
end
