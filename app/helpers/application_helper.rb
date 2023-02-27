module ApplicationHelper

  def default_meta_tags
    {
      site: t('meta_tags.defaults.site'),
      description: t('meta_tags.defaults.description'),
      keywords: t('meta_tags.defaults.keywords'),
      separator: '|',
      reverse: true,
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      charset: "UTF-8",
      icon: image_url('favicon.png'),
      og: {
        type: 'website',
        title: :title,
        description: :description,
        url: request.original_url,
        image: image_url('image.png'),
        site_name: :site,
        local: 'ja-JP'
      },
      twitter: {
        site: '@draobfrus',
        card: 'summary',
        image: image_url('image.png'),
      }
    }
  end
end
