namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do  
    users = User.find_by_id(11)
    content = Faker::Lorem.sentence(5)
    users.microposts.create!(content: content)    
  end
end

