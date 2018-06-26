namespace :dev do

  task fake_restaurant: :environment do
    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample,
        image: File.open(Rails.root.join("app/assets/images/#{rand(1..9)}.jpeg"))
    )
    end

    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end

  task fake_user: :environment do
    
    20.times do |i|
      user_name = FFaker::Name.first_name
      User.create!(
        name: user_name,
        email: "#{user_name}@example.com",
        password: "123123"
        )
    end
    puts "have created fake users"
    puts "now you have #{User.count} user data"
  end

   task fake_comment: :environment do
    Restaurant.all.each do |restaurant|
        3.times do |i|
            restaurant.comments.create!(
               content: FFaker::Lorem.sentence,
               user: User.all.sample
                )
        end
    end
    puts "have created fake comments"
    puts "now you have #{Comment.count} comment data"

    end

    task fake_favorites: :environment do
      Favorite.destroy_all
  
      2000.times do
        Favorite.create!(user: User.all.sample, restaurant: Restaurant.all.sample)
      end
      puts "have created 2000 fake favorites"
      
    end
      
    task fake_followships: :environment do
      Followship.destroy_all
  
      User.all.each do |user|
        5.times do 
          user.followships.create(following_id: User.all.sample.id)
        end
      end
      puts "have created 200 fake follow"
      
    end

end
