# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Country.create(name: 'Thailand', code: 'TH') unless Country.find_by(code: 'TH').present?
Country.create(name: 'India', code: 'IN') unless Country.find_by(code: 'IN').present?
Country.create(name: 'United States of America', code: 'US') unless Country.find_by(code: 'US').present?
Country.create(name: 'Singapore', code: 'SG') unless Country.find_by(code: 'SG').present?

Currency.create(name: 'US Dollar', code: 'USD', country: Country.find_by(code: 'US')) unless Currency.find_by(code: 'USD').present?
Currency.create(name: 'Indian Rupee', code: 'INR', country: Country.find_by(code: 'IN')) unless Currency.find_by(code: 'INR').present?
Currency.create(name: 'Thai Baht', code: 'THB', country: Country.find_by(code: 'TH')) unless Currency.find_by(code: 'THB').present?

Region.create(title: 'United States', tax: 5.5, country: Country.find_by(code: 'US'), currency: Currency.find_by(code: 'USD')) unless Region.find_by(title: 'United States').present?
Region.create(title: 'Thailand', tax: 5.5, country: Country.find_by(code: 'TH'), currency: Currency.find_by(code: 'THB')) unless Region.find_by(title: 'Thailand').present?

# US Region users
User.create(name: 'Bill Murray', email: 'bill@email.com', password_digest: BCrypt::Password.create('password'), admin: false, region: Region.find_by(title: 'United States')) unless User.find_by(email: 'bill@email.com').present?
User.create(name: 'Jim Carrey', email: 'jim@email.com', password_digest: BCrypt::Password.create('password'), admin: true, region: Region.find_by(title: 'United States')) unless User.find_by(email: 'jim@email.com').present?

# TH Region users
User.create(name: 'Will SMith', email: 'will@email.com', password_digest: BCrypt::Password.create('password'), admin: false, region: Region.find_by(title: 'Thailand')) unless User.find_by(email: 'will@email.com').present?
User.create(name: 'Paul Rudd', email: 'paul@email.com', password_digest: BCrypt::Password.create('password'), admin: true, region: Region.find_by(title: 'Thailand')) unless User.find_by(email: 'paul@email.com').present?

Product.create(
  title: 'Product 1 US',
  description: 'Product 1 for US region',
  image_url: 'https://via.placeholder.com/350x350',
  price: 99.99,
  stock: 100,
  sku: 'PRUS0001',
  region: Region.find_by(title: 'United States')
) unless Product.find_by(sku: 'PRUS0001').present?
Product.create(
  title: 'Product 2 US',
  description: 'Product 2 for US region',
  image_url: 'https://via.placeholder.com/350x350',
  price: 19.99,
  stock: 10,
  sku: 'PRUS0002',
  region: Region.find_by(title: 'United States')
) unless Product.find_by(sku: 'PRUS0002').present?
Product.create(
  title: 'Product 1 TH',
  description: 'Product 1 for TH region',
  image_url: 'https://via.placeholder.com/350x350',
  price: 49.99,
  stock: 100,
  sku: 'PRTH0001',
  region: Region.find_by(title: 'Thailand')
) unless Product.find_by(sku: 'PRTH0001').present?
Product.create(
  title: 'Product 2 TH',
  description: 'Product 2 for TH region',
  image_url: 'https://via.placeholder.com/350x350',
  price: 9.99,
  stock: 10,
  sku: 'PRTH0002',
  region: Region.find_by(title: 'Thailand')
) unless Product.find_by(sku: 'PRTH0002').present?
