class Restaurant < ApplicationRecord
  has_many :comments, dependent: :destroy

 # 「餐廳被很多使用者收藏」的多對多關聯
   # 將關聯名稱自訂為 :favorited_users
   # 自訂名稱後，Rails 無法自動推論來源名稱，需另加 source 告知 model name
   has_many :favorites, dependent: :destroy
   has_many :favorited_users, through: :favorites, source: :user
   
   has_many :likes, dependent: :destroy
   has_many :liked_users, through: :likes, source: :user
    mount_uploader :image, PhotoUploader
  #mount_uploader :image, PhotoImageUploader
  validates_presence_of :name

  belongs_to :category,optional: true 
  
   def is_favorited?(user)
    self.favorited_users.include?(user)
   end  
   #使用counter_cache取代
   #def count_favorites
    #self.favorites_count = self.favorites.size
    #self.save
   #end 

   def is_liked?(user)
    self.liked_users.include?(user)
   end   
  #delegate :name, to: :category, prefix: true, allow_nil: true

   def following?(user)
    self.followings.include?(user)
   end 
   

#同學補充 上下頁

  def prev

  Restaurant.where("id < ?", id).last

  end

  def next

  Restaurant.where("id > ?", id).first

  end
end
