require "open-uri"

User.destroy_all
Child.destroy_all
Filiation.destroy_all
Post.destroy_all
ChildPost.destroy_all

puts "Creating nounou..."
nounou_photo = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1673986670/lichihslwnzgdhtxmkis.jpg")
nounou = User.new(first_name: "clem", last_name: "dlt", email: "clementine@gmail.com", password: "azerty", role: 0)
nounou.photo.attach(io: nounou_photo, filename: "nounou.png", content_type: "image/png")
nounou.save
puts "nounou created"

puts "Creating papa..."
papa_photo = URI.open("https://avatars.githubusercontent.com/u/114924427?v=4")
papa = User.new(first_name: "Baptiste", last_name: "Tms", email: "baptiste@gmail.com", password: "azerty", role: 1)
papa.photo.attach(io: papa_photo, filename: "papa.png", content_type: "image/png")
papa.save
puts "papa created"

puts "Creating maman..."
maman_photo = URI.open("https://avatars.githubusercontent.com/u/122106453?v=4")
maman = User.new(first_name: "Julie", last_name: "Tms", email: "julie@gmail.com", password: "azerty", role: 1)
maman.photo.attach(io: maman_photo, filename: "maman.png", content_type: "image/png")
maman.save
puts "maman created"

puts "Creating enfant..."
enfant_photo = URI.open("https://res.cloudinary.com/ddq1d6u8x/image/upload/v1678284963/development/qchho9oil4zhbxh15t2smwv1v8qf.jpg")
enfant = Child.new(first_name: "Alix", last_name: "Tms", birthdate: Date.new(2021,02,12))
enfant.photo.attach(io: enfant_photo, filename: "enfant.png", content_type: "image/png")
enfant.save
puts "enfant created"

puts "Creating famille..."
famille = Filiation.create(child_id: enfant.id , user_id: papa.id)
famille2 = Filiation.create(child_id: enfant.id, user_id: maman.id)
affiliation = Filiation.create(child_id: enfant.id, user_id: nounou.id)
puts "famille created"

puts "Creating dad..."
dad_photo = URI.open("https://avatars.githubusercontent.com/u/116000492?v=4")
dad = User.new(first_name: "Djessy", last_name: "Cfe", email: "djessy@gmail.com", password: "azerty", role: 1)
dad.photo.attach(io: dad_photo, filename: "dad.png", content_type: "image/png")
dad.save
puts "dad created"

puts "Creating mum..."
mum_photo = URI.open("https://fac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2FFAC.2Fvar.2Ffemmeactuelle.2Fstorage.2Fimages.2Famour.2Fcoaching-amoureux.2Fcest-quoi-belle-femme-temoignages-43206.2F14682626-1-fre-FR.2Fc-est-quoi-une-belle-femme-temoignages.2Ejpg/1200x1200/quality/80/crop-from/center/c-est-quoi-une-belle-femme-temoignages.jpeg")
mum = User.new(first_name: "Anne", last_name: "Cfe", email: "anne@gmail.com", password: "azerty", role: 1)
mum.photo.attach(io: mum_photo, filename: "mum.png", content_type: "image/png")
mum.save
puts "mum created"

puts "Creating kid..."
kid_photo = URI.open("https://resize.prod.femina.ladmedia.fr/rblr/652,438/img/var/2021-12/istock-601003180.jpg")
kid = Child.new(first_name: "Olivia", last_name: "Cfe", birthdate: Date.new(2022,03,14))
kid.photo.attach(io: kid_photo, filename: "kid.png", content_type: "image/png")
kid.save
puts "kid created"

puts "Creating family..."
family = Filiation.create(child_id: kid.id, user_id: dad.id)
family = Filiation.create(child_id: kid.id, user_id: mum.id)
filiation = Filiation.create(child_id: kid.id, user_id: nounou.id)
puts "family created"

puts "Creating posts"
post_photo = URI.open("https://cache.magicmaman.com/data/photo/w1000_c18/4n/istock_72369477_xlarge.jpg")
post = Post.new(content: "Petite balade ce matin les enfants étaient très sages", user_id: nounou.id)
post.photos.attach(io: post_photo, filename: "post.png", content_type: "image/png")
post.save
childpost = ChildPost.create(child_id: enfant.id , post_id: post.id)

post2_photo = URI.open("https://cache.magicmaman.com/data/photo/w1000_ci/5i/enfants_en_cuisine.jpg")
post22_photo = URI.open("https://i.enfant.com/1400x787/smart/2019/11/02/27825-livres-de-cuisine-pour-les-enfants.png")
post2 = Post.new(content: "Atelier biscuits de noel !!", user_id: nounou.id)
post2.photos.attach(io: post2_photo, filename: "post2.png", content_type: "image/png")
post2.photos.attach(io: post22_photo, filename: "post22.png", content_type: "image/png")
post2.save
kidpost = ChildPost.create(child_id: enfant.id , post_id: post2.id)
kidpost2 = ChildPost.create(child_id: kid.id , post_id: post2.id)
puts "Posts created"
