Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'sitemap', to: redirect("https://#{ENV.fetch('S3_BUCKET_NAME_2', nil)}.s3.ap-northeast-1.amazonaws.com/sitemap.xml.gz")

  # Defines the root path route ("/")
  root 'static_pages#top'
  get 'terms', to: 'static_pages#terms'
  get 'privacy', to: 'static_pages#privacy'
  get 'contact', to: redirect('https://docs.google.com/forms/d/e/1FAIpQLSdC_h_cqcu_Nn65NkOSk_g8ai7xy8uO-tuMxFHvzUanjM6AeQ/viewform')
  get 'twitter_account', to: redirect('https://twitter.com/draobfrus')

  resources :users, only: %i[new create]

  resources :posts do
    collection do
      get 'search'
      get 'bookmarks'
    end
    resources :comments, shallow: true, only: %i[new create destroy]
  end

  resource :profile, only: %i[show edit update]

  resource :calendar, only: :show do
    get 'search'
  end

  resources :misosoup_bases, only: %i[index new create destroy] do
    get 'recommend', on: :collection
  end

  resources :bookmarks, only: %i[create destroy]

  resources :likes, only: %i[create destroy]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
