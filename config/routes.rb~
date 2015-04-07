Rails.application.routes.draw do
root 'welcome#home'
  devise_for :users
mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
resources :articles do
 member do
  patch "like", to: "articles#like"
  patch "unlike", to: "articles#unlike"
      end
 resources:comments 
    end
end
