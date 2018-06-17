class Restaurant < ApplicationRecord
  has_many :comments, dependent: :destroy

 # 「餐廳被很多使用者收藏」的多對多關聯
   # 將關聯名稱自訂為 :favorited_users
   # 自訂名稱後，Rails 無法自動推論來源名稱，需另加 source 告知 model name
   has_many :favorites, dependent: :destroy
   has_many :favorited_users, through: :favorites, source: :user

  mount_uploader :image, PhotoUploader
  #mount_uploader :image, PhotoImageUploader
  validates_presence_of :name

  belongs_to :category,optional: true 
  


  #delegate :name, to: :category, prefix: true, allow_nil: true

#同學補充 上下頁

  def prev

  Restaurant.where("id < ?", id).last

  end

  def next

  Restaurant.where("id > ?", id).first

  end
end
