require 'aws-sdk-s3'

SitemapGenerator::Sitemap.default_host = 'https://www.ichiju.jp/'
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/#{ENV.fetch('S3_BUCKET_NAME_2', nil)}"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
  ENV.fetch('S3_BUCKET_NAME_2', nil),
  aws_access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID', nil),
  aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY', nil),
  aws_region: ENV.fetch('AWS_DEFAULT_REGION', nil)
)

SitemapGenerator::Sitemap.create do
  # 利用規約
  # add terms_path
  # プライバシーポリシー
  # add privacy_path
  # お問い合わせ
  # add contact_path
  # ログイン
  add login_path
  # ユーザー登録
  add new_user_path
  # 投稿一覧
  add posts_path, priority: 0.7, changefreq: 'daily'
  # 各投稿詳細
  Post.find_each do |post|
    add post_path(post), priority: 0.7, changefreq: 'daily', lastmod: post.updated_at
  end
  # 投稿検索
  add search_posts_path, changefreq: 'daily'
end
