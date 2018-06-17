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

 def dashboard
   @restaurant = Restaurant.find(params[:id])
 end 


 end

