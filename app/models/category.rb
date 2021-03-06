class Category < ApplicationRecord
   validates_presence_of :name

  
    # dependent: :destroy，表示在刪除某筆 Category 資料時，需要一併刪除所有關聯的 Restaurant 資料
  
  has_many :restaurants, dependent: :restrict_with_error
  
  #has_many :restaurants, dependent: :restrict_with_exception


end
