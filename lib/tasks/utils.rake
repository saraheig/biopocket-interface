namespace :db do

  desc "Creates a user with a firstname, lastname, pseudo, email and password"
  task :user, %i(firstname lastname pseudo email password) => :environment do |t,args|

    u = User.where("pseudo = ? OR email = ?", args[:pseudo], args[:email])

    if u.present?
      puts "The user #{args[:pseudo]} and / or the email #{args[:email]} already exist(s)." 
    else
      User.create!(
        firstname: args[:firstname],
        lastname: args[:lastname],
        pseudo: args[:pseudo],
        email: args[:email],
        password: args[:password])
      puts "The user #{args[:pseudo]} is created."
    end
  end
end