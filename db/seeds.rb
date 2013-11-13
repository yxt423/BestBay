# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(fname:"Admin",lname:"1",email:"admin@bestbay.com",password:"111111",password_confirmation:"111111",is_admin:true)
User.create(fname:"Vidya",lname:"Nambiar",email:"v@bestbay.com",password:"111111",password_confirmation:"111111",is_admin:false)
User.create(fname:"Ellen",lname:"Yu",email:"yxt@bestbay.com",password:"111111",password_confirmation:"111111",is_admin:false)
User.create(fname:"Sohil",lname:"Monkey",email:"s@bestbay.com",password:"111111",password_confirmation:"111111",is_admin:false)
User.create(fname:"Rohan",lname:"Honwade",email:"r@bestbay.com",password:"111111",password_confirmation:"111111",is_admin:false)
