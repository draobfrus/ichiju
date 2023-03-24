require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }

  describe 'ログイン前' do
    describe 'ユーザー登録' do
      context 'フォームの入力値が正常' do
        it 'ユーザーの新規登録が成功する' do
          visit new_user_path
          fill_in '*ユーザーネーム', with: 'username'
          fill_in '*メールアドレス', with: 'email@example.com'
          fill_in '*パスワード', with: 'password'
          fill_in '*パスワード確認', with: 'password'
          click_button 'ユーザー登録'
          expect(page).to have_content('ユーザー登録とログインに成功しました')
          expect(current_path).to eq posts_path
        end
      end

      context 'ユーザーネームが未入力' do
        it 'ユーザーの新規登録が失敗する' do
          visit new_user_path
          fill_in '*ユーザーネーム', with: ''
          fill_in '*メールアドレス', with: 'email@example.com'
          fill_in '*パスワード', with: 'password'
          fill_in '*パスワード確認', with: 'password'
          click_button 'ユーザー登録'
          expect(page).to have_content('ユーザー登録できませんでした')
          expect(page).to have_content('ユーザーネームを入力してください')
          expect(current_path).to eq new_user_path
        end
      end

      context 'メールアドレスが未入力' do
        it 'ユーザーの新規登録が失敗する' do
          visit new_user_path
          fill_in '*ユーザーネーム', with: 'username'
          fill_in '*メールアドレス', with: ''
          fill_in '*パスワード', with: 'password'
          fill_in '*パスワード確認', with: 'password'
          click_button 'ユーザー登録'
          expect(page).to have_content('ユーザー登録できませんでした')
          expect(page).to have_content('メールアドレスを入力してください')
          expect(current_path).to eq new_user_path
        end
      end

      context 'パスワードが未入力' do
        it 'ユーザーの新規登録が失敗する' do
          visit new_user_path
          fill_in '*ユーザーネーム', with: 'username'
          fill_in '*メールアドレス', with: 'email@example.com'
          fill_in '*パスワード', with: ''
          fill_in '*パスワード確認', with: 'password'
          click_button 'ユーザー登録'
          expect(page).to have_content('ユーザー登録できませんでした')
          expect(page).to have_content('パスワードは3文字以上で入力してください')
          expect(current_path).to eq new_user_path
        end
      end

      context 'パスワード確認が未入力' do
        it 'ユーザーの新規登録が失敗する' do
          visit new_user_path
          fill_in '*ユーザーネーム', with: 'username'
          fill_in '*メールアドレス', with: 'email@example.com'
          fill_in '*パスワード', with: 'password'
          fill_in '*パスワード確認', with: ''
          click_button 'ユーザー登録'
          expect(page).to have_content('ユーザー登録できませんでした')
          expect(page).to have_content('パスワード確認とパスワードの入力が一致しません')
          expect(page).to have_content('パスワード確認を入力してください')
          expect(current_path).to eq new_user_path
        end
      end

      context 'メールアドレスが既に登録されている' do
        it 'ユーザーの新規登録が失敗する' do
          existed_user = create(:user)
          visit new_user_path
          fill_in '*ユーザーネーム', with: 'username'
          fill_in '*メールアドレス', with: existed_user.email
          fill_in '*パスワード', with: 'password'
          fill_in '*パスワード確認', with: 'password'
          click_button 'ユーザー登録'
          expect(page).to have_content('ユーザー登録できませんでした')
          expect(page).to have_content('メールアドレスはすでに存在します')
          expect(current_path).to eq new_user_path
        end
      end

      context 'パスワードとパスワード確認が不一致' do
        it 'ユーザーの新規登録が失敗する' do
          visit new_user_path
          fill_in '*ユーザーネーム', with: 'username'
          fill_in '*メールアドレス', with: 'email@example.com'
          fill_in '*パスワード', with: 'password'
          fill_in '*パスワード確認', with: 'wordpass'
          click_button 'ユーザー登録'
          expect(page).to have_content('ユーザー登録できませんでした')
          expect(page).to have_content('パスワード確認とパスワードの入力が一致しません')
          expect(current_path).to eq new_user_path
        end
      end
    end
  end
end
