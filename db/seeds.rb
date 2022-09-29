# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(email:"ganeshadmint@gmail.com", password:"997777@Sn", password_confirmation:"997777@Sn", usertype:"Admin")
puts "Admin has been created"

Company.create!([{name: "Kreeti Technologies"}, {name: "KT-core"}, {name: "Kreeti Pvt Lmt"}])
puts "Companies are created"

Foodcategory.create!([{name: "North Indian"}, {name: "South Indian"}, {name: "Chinese"}])
puts "Foodcategories are created"

Foodstore.create!([{name: "North spices", foodcategory_id:Foodcategory.first.id }, {name: "Street Byte", foodcategory_id:Foodcategory.first.id }])
puts "Foodstores are created"

User.create!(email: "sai@gmail.com", password: "997777@Sn", password_confirmation: "997777@Sn", usertype: "Employee")
EmployeeProfile.create!(name: "Sai Ganesh", phone: "9014632028", company_id: Company.first.id, user_id: User.last.id, isapproved: false, isrejected:false)
puts "created employee profile"

User.create!(email: "ganesh@gmail.com", password: "997777@Sn", password_confirmation: "997777@Sn", usertype: "Chef")
Chefprofile.create!(name: "Ganesh", phone: "9014632029", foodstore_id: Foodstore.first.id, user_id: User.last.id, isapproved: false, isrejected:false)
puts "created chef profile"

User.create!(email: "tganesh@gmail.com", password: "997777@Sn", password_confirmation: "997777@Sn", usertype: "Normal Customer")
NormalCustomer.create!(name: "SGani", phone: "9014632028", user_id: User.last.id, isapproved: false, isrejected:false)
puts "created normal cusomer profile"

Fooditem.create!([{name: "Biryani", price: 220, description: "Authentic Chicken Biryani", foodstore_id: Foodstore.first.id}, {name: "Thali", price: 250, description: "Single server North Indian Thali", foodstore_id: Foodstore.first.id}])
puts "Fooditems are created"