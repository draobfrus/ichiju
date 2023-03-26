require 'rails_helper'

RSpec.describe 'UserSessions', type: :system do
  let(:user) { create(:user)}

  describe 'ログイン前' do
    context 'フォームの入力値が正常' do
      it 'ログイン処理が成功する' do
        visit login_path
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content ('ログインに成功しました')
        expect(current_path).to eq posts_path
      end
    end

    context 'メールアドレスが未入力' do
      it 'ログイン処理が失敗する' do
        visit login_path
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content ('ログインできませんでした')
        expect(current_path).to eq login_path
      end
    end

    context 'パスワードが未入力' do
      it 'ログイン処理が失敗する' do
        visit login_path
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: ''
        click_button 'ログイン'
        expect(page).to have_content ('ログインできませんでした')
        expect(current_path).to eq login_path
      end
    end
  end

  describe 'ログイン後' do
    context 'ログアウトボタンをクリック' do
      it 'ログアウト処理が成功する' do
        login_as(user)
        find('.btn-ghost').click
        click_link 'ログアウト'
        expect(page).to have_content ('ログアウトに成功しました')
        expect(current_path).to eq root_path
      end
    end

    context 'サイドバーが出現' do
      it '各ページへのリンクが表示される' do
        login_as(user)
        within('.btm-nav') do
          expect(page).to have_content ('一覧')
          expect(page).to have_content ('投稿')
          expect(page).to have_content ('カレンダー')
          expect(page).to have_content ('みそだし')
        end
      end
    end
  end
end
