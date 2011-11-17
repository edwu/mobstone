namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
  end
end

def make_users
  password  = "password"
  
  259.times do |n|
    name  = Faker::Name.name
    name2 = name.split(" ")
    name1 = name.downcase
    name1 = name1.delete(' ')
    number = [*1..10000].sample
    if number % 5 == 0
      number1= number.to_s
      email =  name1+number1+"@hotmail.com"
    elsif number % 3 == 0
      email = name1+"@gmail.com"
    else
      number2= number.to_s
      email =  name1+number2+"@yahoo.com"

    end
    password  = "password"
    User.create!(:name => name,
                 :email => email,
                 :password => password,
                 :password_confirmation => password)
  end

  User.create!(:name => "Lana Nguyen",
                 :email => "lanapnguyen@gmail.com",
                 :password => password,
                 :password_confirmation => password)


  User.create!(:name => "Dylan Scott",
                 :email => "dylan.scott@yahoo.com",
                 :password => password,
                 :password_confirmation => password)

end
