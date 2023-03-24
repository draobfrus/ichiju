require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  let(:user) { create(:user)}
  let(:post) { create(:post)}

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
end
