Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'sitemap', to: redirect("https://s3-ap-northeast-1.amazonaws.com/#{ENV['S3_BUCKET_NAME']}/sitemaps/sitemap.xml.gz")

  # Defines the root path route ("/")
  root 'static_pages#top'

  resources :users, only: %i[new create]

  resources :posts do
    collection do
      get :the_day
      get :search
    end
  end

  resource :calendar, only: :show

  resources :misosoup_bases, only: %i[index new create destroy]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
