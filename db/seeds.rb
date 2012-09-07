# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Role.create([{ id: 1, name: 'Admin'}])
Role.create([{ id: 2, name: 'Vendor'}])
Role.create([{ id: 3, name: 'Employee'}])
Role.create([{ id: 4, name: 'Customer'}])

User.create([{ id: 1, first_name: 'Joe', last_name: 'Sadmin', role_ids: [1], email: 'admin@admin.com', password: '123456'}])
User.create([{ id: 2, first_name: 'Conman', last_name: 'Vendoretta', role_ids: [2], email: 'conman@vendor.com', password: '123456'}])
User.create([{ id: 3, first_name: 'Sam', last_name: 'Employeest', role_ids: [3], email: 'sam@employee.com', password: '123456'}])
User.create([{ id: 4, first_name: 'Curt', last_name: 'Customerinni', role_ids: [4], email: 'curt@customer.com', password: '123456'}])

Product.create([{ id: 1, name: 'Fire Album', price: 29.99, product_type: 'Medium', category: ['Media'], media_information: 'Awesome Music'}])
Product.create([{ id: 2, name: 'Cool Stuff', price: 9.99, product_type: 'Low', category: ['Art'], art_information: 'Abstract Over My Head Cool'}])
Product.create([{ id: 3, name: 'French Candy', price: 99.99, product_type: 'High', category: ['Food'], food_information: 'Super Delicious'}])

Discount.create([{ id: 1, description: 'Awesome Discount', price: 10.00, product_id: 3}])
