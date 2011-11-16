# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
admin = User.create!(:name => "Edward",
                       :email => "edward@gmail.com",
                       :password => "password",
                       :password_confirmation => "password"
                      )
#how to set admin to be true
admin.toggle!(:admin)
