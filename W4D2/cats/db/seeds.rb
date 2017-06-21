# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.destroy_all

cat1 = Cat.create(name: 'Kobe', birth_date: '2013/01/20', color: 'grey', sex: 'M',  description: 'evil cat', image_url: "https://s-media-cache-ak0.pinimg.com/originals/ac/64/e6/ac64e6e27bc62cd0ad5881d7324f690f.jpg")
cat2 = Cat.create(name: 'Sunny', birth_date: '2000/01/20', color: 'orange', sex: 'F', description: 'fat cat!', image_url: "http://a.fssta.com/content/dam/fsdigital/fscom/Buzzer/Images/2016/02/17/DuffySkeeter.png")


# <img src=" >
