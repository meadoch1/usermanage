# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.find_or_create_by_username(username: 'seedadmin', name: 'Seed Admin', password: 'mypass', password_confirmation: 'mypass')
User.find_or_create_by_username(username: 'seedcsr', name: 'Seed CSR', password: 'mypass', password_confirmation: 'mypass')
User.find_or_create_by_username(username: 'seeduser', name: 'Seed User', password: 'mypass', password_confirmation: 'mypass')

