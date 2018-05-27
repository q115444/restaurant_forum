class Restaurant < ApplicationRecord
  validates_presence_of :name

#同學補充 上下頁
  def prev

  Restaurant.where("id < ?", id).last

  end

  def next

  Restaurant.where("id > ?", id).first

  end
end
