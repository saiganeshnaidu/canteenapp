# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.delete_all
EmployeeProfile.delete_all
Chefprofile.delete_all
Customer.delete_all
FoodCategory.delete_all
FoodStore.delete_all
FoodItem.delete_all
Company.delete_all

User.create!(email:"ganeshadmin1@gmail.com", password:"997777@Sn", password_confirmation:"997777@Sn", usertype:"Admin")
puts "Admin has been created"

Company.create!([{name: "Kreeti Technologies"}, {name: "KT-core"}, {name: "Kreeti Pvt Lmt"}])
puts "Companies are created"

FoodCategory.create!([{name: "North Indian"}, {name: "South Indian"}, {name: "Chinese"}])
puts "Foodcategories are created"

FoodStore.create!([{name: "North spices", food_category_id:FoodCategory.first.id }, {name: "Street Byte", food_category_id:FoodCategory.first.id }])
puts "Foodstores are created"

User.create!(email: "sait1@gmail.com", password: "997777@Sn", password_confirmation: "997777@Sn", usertype: "Employee")
EmployeeProfile.create!(name: "Sai Ganesh", phone: "9000632028", company_id: Company.first.id, user_id: User.last.id, isapproved: true, isrejected:false)
puts "created employee profile"

User.create!(email: "ganesht1@gmail.com", password: "997777@Sn", password_confirmation: "997777@Sn", usertype: "Chef")
Chefprofile.create!(name: "Ganesh", phone: "9014600000", food_store_id: FoodStore.first.id, user_id: User.last.id, isapproved: false, isrejected:false)
puts "created chef profile"

User.create!(email: "tganeshs1@gmail.com", password: "997777@Sn", password_confirmation: "997777@Sn", usertype: "Customer")
Customer.create!(name: "SGani", phone: "9014611111", user_id: User.last.id, isapproved: false, isrejected:false)
puts "created normal cusomer profile"

FoodItem.create!([{name: "Biryani", price: 220, description: "Authentic Chicken Biryani", food_store_id: FoodStore.first.id}, {name: "Thali", price: 250, description: "Single server North Indian Thali", food_store_id: FoodStore.first.id}])
puts "Fooditems are created"