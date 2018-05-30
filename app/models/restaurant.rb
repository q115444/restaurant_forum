class Restaurant < ApplicationRecord
  mount_uploader :image, PhotoUploader
  #mount_uploader :image, PhotoImageUploader
  validates_presence_of :name

  belongs_to :category, optional: true

#同學補充 上下頁

  def prev

  Restaurant.where("id < ?", id).last

  end

  def next

  Restaurant.where("id > ?", id).first

  end
end
