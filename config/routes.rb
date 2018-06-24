Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories, only: :show
  root "restaurants#index"
  
 
  resources :comments, only: [:create, :destroy] 

  resources :users, only: [:index, :show, :edit, :update]
  resources :followships, only: [:create, :destroy] 

  resources :restaurants, only:[:index, :show] do 
  #瀏覽所有餐廳的最新動態

   collection do 
     get :feeds 
     get :ranking
     
   end 

  #瀏覽個別餐廳的優惠活動 Dashboard
   member do
     get :dashboard

     #收藏/取消收藏
     post :favorite
     post :unfavorite
     post :like
     post :unlike

   end   
   #因為favorite不需要樣板 所以習慣用post

  #collection 使用複數
  #member 使用單數
  end  
  
  
  
 
   namespace :admin do
     resources :restaurants
     resources :categories 
     root "restaurants#index"
   end
end
