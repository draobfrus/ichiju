module ApplicationHelper

  def default_meta_tags
    {
      site: t('meta_tags.defaults.site'),
      title: t('meta_tags.defaults.title'),
      reverse: true,
      separator: '|',
      description: t('meta_tags.defaults.description'),
      keywords: t('meta_tags.defaults.keywords'),
      charset: "UTF-8",
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: image_url('favicon.png'),
      og: {
        site_name: t('meta_tags.defaults.site'),
        title: t('meta_tags.defaults.title'),
        description: t('meta_tags.defaults.description'),
        type: 'website',
        url: request.original_url,
        image: image_url('image.png'),
        local: 'ja-JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@draobfrus',
      },
    }
  end
end
