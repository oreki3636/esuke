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
    post 'users/mypage' => 'users#mypage'
    get 'users//show' => 'users'
    resources :users,only: [:index,:show]
    get 'users/mypage/edit' => 'users#edit',as: 'edit'
    get 'points/get' => 'points#get',as: 'get'
    resources :todolists,only: [:new,:create]
  end

  namespace :admin do
    root to: 'homes#top'
    resources :users,only: [:index,:show]
  end

end
