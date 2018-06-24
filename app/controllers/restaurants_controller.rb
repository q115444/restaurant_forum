class RestaurantsController < ApplicationController
 before_action :authenticate_user!
 
 def index
  @restaurants = Restaurant.page(params[:page]).per(9)
  @categories = Category.all
 end 


 def show 
  @restaurant = Restaurant.find(params[:id])
  @comment = Comment.new
 end 
 
 def feeds 
  @recent_restaurants = Restaurant.all.order(created_at: :desc).limit(10)
  @recent_comments = Comment.all.order(created_at: :desc).limit(10)

  #order(created_at: :desc)指定使用哪個欄位，並設定升序asc還是降序desc
  #limit(10) 最多傳回幾筆資料，這裡回傳前10筆
 end

 #Get restaurants/dashboard
 #會去 render app/views/restuarants/dashboard.html.erb

 # Post /restaurants/:id/favorite
 def favorite
  @restaurant = Restaurant.find(params[:id])
  @restaurant.favorites.create!(user: current_user)
  #@restaurant.count_favorites
  redirect_back(fallback_location: root_path)
 end

 # Post /restaurants/:id/unfavorite
 def unfavorite
  @restaurant = Restaurant.find(params[:id])

   favorites = Favorite.where(restaurant: @restaurant, user: current_user)
   favorites.destroy_all
   #@restaurant.count_favorites
   redirect_back(fallback_location: root_path)
 end  
 
 def like
  @restaurant = Restaurant.find(params[:id])
  @restaurant.likes.create!(user: current_user)
  redirect_back(fallback_location: root_path)
 end

 def unlike
  @restaurant = Restaurant.find(params[:id])
 

  likes = Like.where(restaurant: @restaurant, user: current_user)
  likes.destroy_all
  redirect_back(fallback_loction: root_path)

 end 

 def ranking
  @restaurants = Restaurant.order(favorites_count: :desc).limit(10)
 end 

 def dashboard

  @restaurant = Restaurant.find(params[:id])

 end 


end

