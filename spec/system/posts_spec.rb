require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  let(:post) { create(:post) }

  describe 'ログイン前' do
    describe 'ページ遷移確認' do
      context '投稿作成ページにアクセス' do
        it '投稿作成ページへのアクセスが失敗する' do
          visit new_post_path
          expect(page).to have_content ('ログインしてください')
          expect(current_path).to eq login_path
        end
      end

      context '投稿編集ページにアクセス' do
        it '投稿編集ページへのアクセスが失敗する' do
          visit edit_post_path(post)
          expect(page).to have_content ('ログインしてください')
          expect(current_path).to eq login_path
        end
      end

      context '投稿詳細ページにアクセス' do
        it '投稿の詳細が表示される' do
          visit post_path(post)
          expect(page).to have_content post.title
          expect(page).to have_content post.content
          expect(current_path).to eq post_path(post)
        end
      end

      context '投稿一覧ページにアクセス' do
        it '投稿の一覧が表示される' do
          post_list = create_list(:post, 3)
          visit posts_path
          expect(page).to have_content post_list[0].title
          expect(page).to have_content post_list[1].title
          expect(page).to have_content post_list[2].title
          expect(current_path).to eq posts_path
        end
      end
    end
  end

  describe 'ログイン後' do
    let(:user) { create(:user) }
    before { login_as(user) }

    describe '投稿作成' do
      context 'フォームの入力値が正常' do
        it '投稿の新規作成が成功する' do
          visit new_post_path
          fill_in '*タイトル', with: 'title'
          attach_file '*写真', "#{Rails.root}/spec/fixtures/test_image.png"
          click_button '投稿する'
          expect(page).to have_content ('投稿しました')
          expect(current_path).to eq posts_path
        end
      end

      context 'タイトルが未入力' do
        it '投稿の新規作成が失敗する' do
          visit new_post_path
          fill_in '*タイトル', with: ''
          attach_file '*写真', "#{Rails.root}/spec/fixtures/test_image.png"
          click_button '投稿する'
          expect(page).to have_content ('投稿できませんでした')
          expect(page).to have_content ('タイトルを入力してください')
        end
      end

      context '画像が未入力' do
        it '投稿の新規作成が失敗する' do
          visit new_post_path
          fill_in '*タイトル', with: 'title'
          click_button '投稿する'
          expect(page).to have_content ('投稿できませんでした')
          expect(page).to have_content ('写真を入力してください')
        end
      end
    end

    describe '投稿編集' do
      let!(:post) { create(:post, user: user) }

      context 'フォームの入力値が正常' do
        it '投稿の編集が成功する' do
          visit edit_post_path(post)
          fill_in '*タイトル', with: 'new_title'
          click_button '投稿する'
          expect(page).to have_content ('更新しました')
        end
      end

      context 'タイトルが空欄' do
        it '投稿の編集が失敗する' do
          visit edit_post_path(post)
          fill_in '*タイトル', with: ''
          click_button '投稿する'
          expect(page).to have_content ('更新できませんでした')
          expect(page).to have_content ('タイトルを入力してください')
        end
      end
    end

    describe '投稿削除', js: true do
      let!(:post) { create(:post, user: user) }

      it '投稿の削除が成功する' do
        visit post_path(post)
        click_link '削除'
        expect(page.accept_confirm).to eq '投稿を削除しますか？'
        expect(page).to have_content ('投稿を削除しました')
      end
    end

    describe 'ページ遷移' do
      let!(:other_user) { create(:user, email: 'other@example.com') }
      let!(:other_post) { create(:post, user: other_user) }

      context '他ユーザーの投稿詳細ページへアクセス' do
        it '編集・削除ボタンが表示されない' do
          visit post_path(other_post)
          expect(page).not_to have_content ('編集')
          expect(page).not_to have_content ('削除')
        end
      end
    end
  end
end
