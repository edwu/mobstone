namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
  end
end

def make_users
  admin = User.create!(:name => "Example User",
                       :email => "example@railstutorial.org",
                       :password => "foobar",
                       :password_confirmation => "foobar")
  admin.toggle!(:admin)
  
  password  = "password"
  User.create!(:name => "david",
               :email => "d@d.com",
               :password => password,
               :password_confirmation => password)
               
            User.create!(:name => "ed",
                            :email => "e@e.com",
                            :password => password,
                            :password_confirmation => password)
                            
                            User.create!(:name => "connie",
                                         :email => "co@co.com",
                                         :password => password,
                                         :password_confirmation => password)
  
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(:name => name,
                 :email => email,
                 :password => password,
                 :password_confirmation => password)
  end

  company = User.create!(:name => "Company",
                          :email => "c@c.com",
                          :password => "company",
                          :password_confirmation => "company")
  company.toggle!(:is_company)

  company1 = Company.create!(:name => company.name,
                              :user_id => company.id)
  deal = Deal.create(:company_id => company1.id, :min_price => 3, :description => "deal1", 
                      :org_price => 5, :startdate=>DateTime.current, :duration => 5)


end
