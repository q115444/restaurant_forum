class User < ApplicationRecord
  #使用者評論很多餐廳 多對多關聯
  has_many :comments, dependent: :restrict_with_error
  has_many :restaurants, through: :comments
  
  #使用者收藏很多餐廳
  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant
  #like
  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant

  #source 指的是model name

  #一個user擁有很多追蹤紀錄
  #透過追蹤紀錄，一個user追蹤很多其他user 不需要另加 source，Rails 可從 Followship Model 設定來判斷 followings 指向 User Model
  has_many :followships, dependent: :destroy
  has_many :following, through: :followships

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates_presence_of :name
  mount_uploader :avatar, AvatarUploader


  before_save :initialize_name
  
  # 如果 name 沒有值的話, 請初始化一個值給它, 而這個初始化的值是 user 填的 email @前面的字串
  def initialize_name
    if self.name == '' || self.name == nil
      self.name = self.email.split('@').first
    end
  end


  def admin?
    self.role == "admin"
  end  


end
