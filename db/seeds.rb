# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

roles = Role.create([{name: 'admin'}, {name: 'sales'}, {name:'broker'}, {name:'art'}, {name:'shipping'}, {name:'production'}])
users = User.create([{email: 'admin@example.com', password: 'Dano1919', password_confirmation: 'Dano1919', role: roles[0]}])
