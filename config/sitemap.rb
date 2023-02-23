# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://www.ichiju.jp'
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/#{ENV.fetch('S3_BUCKET_NAME', nil)}"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
  ENV.fetch('S3_BUCKET_NAME', nil),
  aws_access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID', nil),
  aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY', nil),
  aws_region: ENV.fetch('AWS_DEFAULT_REGION', nil)
)

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add posts_path, :priority => 0.7, :changefreq => 'daily'
  # #
  # # Add all articles:
  # #
  # Post.find_each do |post|
  #   add post_path(post), :lastmod => post.updated_at
  # end
end
