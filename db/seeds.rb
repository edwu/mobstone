# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
admin = User.create!(:name => "Edward Wu",
                       :email => "eddy771@berkeley.edu",
                       :password => "password",
                       :password_confirmation => "password"
                      )

admin.toggle!(:admin)

password  = "password."
User.create!(:name => "Connie Guo",
               :email => "connie.guo107@gmail.com",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "David Chock",
               :email => "david.chock@gmail.com",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Jing Yu",
               :email => "nybeath@gmail.com",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Edmund Ye",
               :email => "edmund_ye@berkeley.edu",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Tariq Ahmed",
               :email => "tariqafaqahmed@hotmail.com",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Ryan Han",
               :email => "rhan003@ucr.edu",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Jonathan Lee",
               :email => "jonathanmlee@gmail.com",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Mitchell Nguyen",
               :email => "mitchell.nguyen@ucmerced.edu",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Adrena Rodriguez",
               :email => "arodriguez32@ucmerced.edu",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Marwin Ko",
               :email => "mko3@ucmerced.edu",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Keith Chin",
               :email => "viperavak@gmail.com",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Amanda Ren",
               :email => "aren@berkeley.edu",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Cavin Woo",
               :email => "cavin.woo@gmail.com",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Johny Lam",
               :email => "johny.lam@gmail.com",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Sam Lee",
               :email => "klee54122@gmail.com",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Michelle Papilla",
               :email => "michellepapilla@gmail.com",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Albert Tseng",
               :email => "murkmote@gmail.com",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Jerry Weng",
               :email => "jerry.weng@ucr.edu",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Kenny Kwang",
               :email => "kenny.kwang@ucr.edu",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Mike Yang",
               :email => "mike94539@yahoo.com",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Kevin Wickramasekara",
               :email => "kevinwick@gmail.com",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Justin Jang",
               :email => "jjang@gmail.com",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Alex Hwang",
               :email => "alex.hwang@gmail.com",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Akshay Naresh",
               :email => "anaresh@gmail.com",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Albert Wu",
               :email => "albert-wu@gmail.com",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Albert Bai",
               :email => "albert.bai@gmail.com",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Alex Hu",
               :email => "alexhu2002@gmail.com",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Chris Hu",
               :email => "christopherhu2008@hotmail.com",
               :password => password,
               :password_confirmation => password)

User.create!(:name => "Arthur Liao",
               :email => "arthur1932@hotmail.com",
               :password => password,
               :password_confirmation => password)





