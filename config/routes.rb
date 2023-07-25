Rails.application.routes.draw do

  devise_for :users,skip:[:passwords],controllers:{
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }

  devise_for :admin,skip:[:registrations,:passwords],controllers:{
    sessions: "admin/sessions"
  }

   scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'users/mypage' => 'users#mypage',as: 'mypage'
    #post 'users/mypage' => 'users#mypage'
    get 'users/unsubscribe' => 'users#unsubscribe',as: 'unsubscribe'
    resources :users,only: [:index,:show]
    resources :points
    get 'users/mypage/edit' => 'users#edit',as: 'edit_user_mypage'
    resources :todolists,only: [:new,:show,:update,:create,:destroy]
    patch 'users/mypage' => 'users#update',as: 'mypage_update'
    patch 'users/withdraw' => 'users#withdraw',as: 'withdraw'
    resources :groups, except: [:destroy]

  end

  namespace :admin do
    root to: 'homes#top'
    resources :users,only: [:show]
  end

  # HEADリクエストへのルート設定
  match '/Core/Skin/Login.aspx', to: 'controller#action', via: :head

  # 不正なGETリクエストへのルート設定
  match '/.env', to: 'controller#action', via: :all

  # 不正なPOSTリクエストへのルート設定
  match '/', to: 'controller#action', via: :all

end
