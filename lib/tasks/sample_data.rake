namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do  
	  users = User.all
	  user  = users.first
	  followed_users = users[2..150]
	  followers      = users[3..140]
	  followed_users.each { |followed| user.follow!(followed) }
	  followers.each      { |follower| follower.follow!(user) }
  end
end

