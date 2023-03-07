User.destroy_all
Child.destroy_all
Filiation.destroy_all
Post.destroy_all
ChildPost.destroy_all

nounou = User.create(first_name: "clem", last_name: "dlt", email: "clementine@gmail.com", password: "azerty", role: 0)
papa = User.create(first_name: "Julie", last_name: "Tms", email: "julie@gmail.com", password: "azerty", role: 1)
maman = User.create(first_name: "Baptiste", last_name: "Tms", email: "baptiste@gmail.com", password: "azerty", role: 1)
enfant = Child.create(first_name: "Alix", last_name: "Tms", birthdate: Date.new(2021,02,12))

puts "ok"

famille = Filiation.create(child_id: enfant.id , user_id: papa.id)

puts "ok ok"

famille2 = Filiation.create(child_id: enfant.id, user_id: maman.id)
affiliation = Filiation.create(child_id: enfant.id, user_id: nounou.id)

puts "ok ok ok"

dad = User.create(first_name: "Djessy", last_name: "Cfe", email: "djessy@gmail.com", password: "azerty", role: 1)
mum = User.create(first_name: "Anne", last_name: "Cfe", email: "anne@gmail.com", password: "azerty", role: 1)
kid = Child.create(first_name: "Olivia", last_name: "Cfe", birthdate: Date.new(2022,03,14))

puts "ok"

family = Filiation.create(child_id: kid.id, user_id: dad.id)
family = Filiation.create(child_id: kid.id, user_id: mum.id)
filiation = Filiation.create(child_id: kid.id, user_id: nounou.id)

puts "ok ok "

post = Post.create(content: "Petite balade ce matin les enfants étaient très sages", user_id: nounou.id)
childpost = ChildPost.create(child_id: enfant.id , post_id: post.id)

puts "ok ok ok"

post2 = Post.create(content: "Atelier biscuits de noel !!", user_id: nounou.id)
kidpost = ChildPost.create(child_id: enfant.id , post_id: post2.id)
kidpost2 = ChildPost.create(child_id: kid.id , post_id: post2.id)
