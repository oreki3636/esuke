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
    resources :users,only: [:index,:show]
    get 'users/top' => "users#top",as: 'top'
    get 'users/mypage/edit' => 'users#edit',as: 'edit'
    get 'points/get' => 'points#get',as: 'get'
    get 'calendars/new' => 'calendars#new',as: 'new'
    get 'rankings/get' => 'rankings#get',as: 'ranking_get'
  end

  namespace :admin do
    root to: 'homes#top'
    resources :users,only: [:index,:show]
  end

end
