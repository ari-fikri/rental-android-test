# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# USERS
ricky = User.find_or_create_by(name: 'Ricky Prahatama') do |u|
    u.name = 'Ricky Prahatama'
    u.address = 'Setrasari Kulon Gg Pameunteu no.13 Bandung'
    u.mobile = '08967475553'
end

harry = User.find_or_create_by(name: 'Harry Permadi') do |u|
    u.name = 'Harry Permadi'
    u.address = 'Cibuntu Utara RT01/005 Ciburu'
    u.mobile = '089722134'
end

yusuf = User.find_or_create_by(name: 'Yusuf Maulana') do |u|
    u.name = 'Yusuf Maulana' 
    u.address = 'Gg Bapa Wira No 345 Cihampelas Bandung'
    u.mobile = '67858589'
end

tri = User.find_or_create_by(name: 'Tri Rejeki') do |u|
    u.name = 'Tri Rejeki'
    u.address ='Pacuan Kuda Utara No 134 Margahayu Raya'
    u.mobile ='022-65738434'
end


# CARS

innova_1 = Car.find_or_create_by(license_plat: 'D879XY') do |c|
    c.brand = 'Toyota'
    c.model = "Innova"
    c.license_plat ='D879XY'
    c.fare ='1800000'
end

innova_2 = Car.find_or_create_by(license_plat: 'D559MA') do |c|
    c.brand = 'Toyota'
    c.model = "Innova"
    c.license_plat ='D8559MA'
    c.fare ='1800000'
end

ertiga_1 = Car.find_or_create_by(license_plat: 'B7865FF') do |c|
    c.brand = 'Suzuki'
    c.model = "Ertiga"
    c.license_plat ='B7865FF'
    c.fare ='1300000'
end

kijang = Car.find_or_create_by(license_plat: 'B7832AB') do |c|
    c.brand = 'Toyota'
    c.model = "Kijang"
    c.license_plat ='B7832AB'
    c.fare ='1100000'
end

