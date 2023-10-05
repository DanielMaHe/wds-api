# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Clean tables'

Customer.delete_all
Worker.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('customers')
ActiveRecord::Base.connection.reset_pk_sequence!('workers')

# ActiveRecord::Base.connection.execute("TRUNCATE TABLE customers RESTART IDENTITY;")
# ActiveRecord::Base.connection.execute("TRUNCATE TABLE workers RESTART IDENTITY;")

puts 'create Customers'

Customer.create(name: 'customer 1', email: 'customer1@mail.com', comment: 'some comment')
Customer.create(name: 'customer 2', email: 'customer2@mail.com', comment: 'some comment')
Customer.create(name: 'customer 3', email: 'customer3@mail.com', comment: 'some comment')

puts 'create Workers'

Worker.create(username: 'worker Admin', mail: 'workerAdmin@mail.com', isAdmin: true, password: 'qwerty',
              password_confirmation: 'qwerty')
Worker.create(username: 'worker 1', mail: 'worker1@mail.com', isAdmin: false, password: 'qwerty',
              password_confirmation: 'qwerty')
Worker.create(username: 'worker 2', mail: 'worker2@mail.com', isAdmin: false, password: 'qwerty',
              password_confirmation: 'qwerty')

puts 'end seeds'
