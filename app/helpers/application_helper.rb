module ApplicationHelper
  def default_meta_tags
    {
      site: '一汁',
      title: '毎日に、あたたかな彩りを。',
      reverse: true,
      separator: '|',
      description: '一汁は、毎日のごはん作りを頑張りたいあなたへ送る、ありそうでなかったみそ汁特化のサービス。作ったみそ汁を投稿して、自分だけのみそ汁カレンダーを作ろう。みそ汁の具材のマンネリ化解消にも。',
      keywords: 'みそ汁,自炊,ごはん',
      charset: 'UTF-8',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: image_url('favicon.png'),
      og: {
        site_name: '一汁',
        title: '毎日に、あたたかな彩りを。',
        description: '一汁は、毎日のごはん作りを頑張りたいあなたへ送る、ありそうでなかったみそ汁特化のサービス。作ったみそ汁を投稿して、自分だけのみそ汁カレンダーを作ろう。みそ汁の具材のマンネリ化解消にも。',
        type: 'website',
        url: request.original_url,
        image: image_url('og_image.png'),
        local: 'ja-JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@draobfrus'
      }
    }
  end
end
