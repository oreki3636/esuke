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
    resources :users,only: [:index]
    resources :points
    get 'users/mypage/edit' => 'users#edit',as: 'edit_user_mypage'
    resources :todolists,only: [:new,:show,:update,:create,:destroy]
    patch 'users/mypage' => 'users#update',as: 'mypage_update'
    patch 'users/withdraw' => 'users#withdraw',as: 'withdraw'
  end

  namespace :admin do
    root to: 'homes#top'
    resources :users,only: [:index,:show]
  end

end
