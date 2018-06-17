class Restaurant < ApplicationRecord
  has_many :comments, dependent: :destroy

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
