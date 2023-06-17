Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :admins
  devise_for :user

  namespace :public do
    get 'points/get'
    get 'calendars/new'
    get 'rankings/get'
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'homes/top'
  end

  namespace :admin do
    get 'users/show'
    get 'homes/top'
    get 'users/index'
    get 'users/show'
  end
end
