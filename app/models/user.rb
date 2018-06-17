class User < ApplicationRecord
  #使用者評論很多餐廳 多對多關聯
  has_many :comments, dependent: :restrict_with_error
  has_many :restaurants, through: :comments
  
  ＃使用者收藏很多餐廳
  has_many :favorites, dependent: :destroy
  has_many :favorites_restaurants, through: :favorites, source: :restaurant
                                                        #source 指的是model name
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
