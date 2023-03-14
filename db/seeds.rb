require "open-uri"

User.destroy_all
Child.destroy_all
Filiation.destroy_all
Post.destroy_all
ChildPost.destroy_all

puts "Creating Clem la nounou d'enfer..."
clem_photo = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1673986670/lichihslwnzgdhtxmkis.jpg")
clem = User.new(first_name: "Clémentine", last_name: "Delthé", bio: "J'ai passé mon CAP petite enfance en 2013 et depuis je garde vos petits bouts de chou pour mon plus grand bonheur", email: "clementine@gmail.com", password: "azerty", role: 0)
clem.photo.attach(io: clem_photo, filename: "clem.png", content_type: "image/png")
clem.save
puts "Clem la nounou d'enfer created"

puts "Creating Baptiste..."
baptiste_photo = URI.open("https://res.cloudinary.com/ddq1d6u8x/image/upload/v1678721358/development/anbjc9ojb9ku3dkf57bx8as486d5.jpg")
baptiste = User.new(first_name: "Baptiste", last_name: "Lignel", email: "baptiste@gmail.com", password: "azerty", role: 1)
baptiste.photo.attach(io: baptiste_photo, filename: "baptiste.png", content_type: "image/png")
baptiste.save
puts "Baptiste created"

puts "Creating Julie..."
julie_photo = URI.open("https://res.cloudinary.com/ddq1d6u8x/image/upload/v1678376339/production/q308l6ej10yqhjexdadkrickpuxx.jpg")
julie = User.new(first_name: "Julie", last_name: "Lignel", email: "julie@gmail.com", password: "azerty", role: 1)
julie.photo.attach(io: julie_photo, filename: "julie.png", content_type: "image/png")
julie.save
puts "Julie created"

puts "Creating Alix..."
alix_photo = URI.open("https://res.cloudinary.com/ddq1d6u8x/image/upload/v1678380790/production/jl3o34qnkzd3q9vnil4vwoow1eyc.jpg")
alix = Child.new(first_name: "Alix", last_name: "Lignel", birthdate: Date.new(2021,02,12))
alix.photo.attach(io: alix_photo, filename: "alix.png", content_type: "image/png")
alix.save
puts "Alix created"

puts "Creating Lignel family..."
lignel = Filiation.create(child_id: alix.id , user_id: baptiste.id)
lignel2 = Filiation.create(child_id: alix.id, user_id: julie.id)
affiliation_alix = Filiation.create(child_id: alix.id, user_id: clem.id)
puts "Lignel family created"

puts "Creating Djessy..."
djessy_photo = URI.open("https://res.cloudinary.com/ddq1d6u8x/image/upload/v1678721022/development/8kkyxt5hg41nkipptxzvrxz8z6wf.jpg")
djessy = User.new(first_name: "Djessy", last_name: "Coiffé", email: "djessy@gmail.com", password: "azerty", role: 1)
djessy.photo.attach(io: djessy_photo, filename: "djessy.png", content_type: "image/png")
djessy.save
puts "Djessy created"

puts "Creating Anne..."
anne_photo = URI.open("https://res.cloudinary.com/ddq1d6u8x/image/upload/v1678460727/production/7l6hd1496cx0v8jvjnsb8b5yk8g7.jpg")
anne = User.new(first_name: "anne", last_name: "Coiffé", email: "anne@gmail.com", password: "azerty", role: 1)
anne.photo.attach(io: anne_photo, filename: "anne.png", content_type: "image/png")
anne.save
puts "Anne created"

puts "Creating Zoé..."
zoé_photo = URI.open("https://res.cloudinary.com/ddq1d6u8x/image/upload/v1678460800/production/1o3br0q3cje8yrq21yuccpgejkak.jpg")
zoé = Child.new(first_name: "Zoé", last_name: "Coiffé", birthdate: Date.new(2022,03,14))
zoé.photo.attach(io: zoé_photo, filename: "zoé.png", content_type: "image/png")
zoé.save
puts "Zoé created"

puts "Creating Coiffé family..."
coiffé1 = Filiation.create(child_id: zoé.id, user_id: djessy.id)
coiffé2 = Filiation.create(child_id: zoé.id, user_id: anne.id)
filiation_zoé = Filiation.create(child_id: zoé.id, user_id: clem.id)
puts "Coiffé family created"

puts "Creating Nicolas..."
nicolas_photo = URI.open("https://res.cloudinary.com/ddq1d6u8x/image/upload/v1678465451/production/mqusud6nzn6cwmjak2z5xvyfe084.jpg")
nicolas = User.new(first_name: "Nicolas", last_name: "Riera", email: "nicolas@gmail.com", password: "azerty", role: 1)
nicolas.photo.attach(io: nicolas_photo, filename: "nicolas.png", content_type: "image/png")
nicolas.save
puts "Nicolas created"

puts "Creating Sandra..."
sandra_photo = URI.open("https://res.cloudinary.com/ddq1d6u8x/image/upload/v1678460896/production/d1m20mzy2gpi0mznzz29ch3mf8r1.jpg")
sandra = User.new(first_name: "Sandra", last_name: "Riera", email: "sandra@gmail.com", password: "azerty", role: 1)
sandra.photo.attach(io: sandra_photo, filename: "sandra.png", content_type: "image/png")
sandra.save
puts "Sandra created"

puts "Creating Olivia..."
olivia_photo = URI.open("https://res.cloudinary.com/ddq1d6u8x/image/upload/v1678465508/production/lwlvn4hv1nndet3cgn3bd4byxj03.jpg")
olivia = Child.new(first_name: "Olivia", last_name: "Riera", birthdate: Date.new(2021,02,12))
olivia.photo.attach(io: olivia_photo, filename: "olivia.png", content_type: "image/png")
olivia.save
puts "Olivia created"

puts "Creating Riera family..."
riera = Filiation.create(child_id: olivia.id , user_id: nicolas.id)
riera2 = Filiation.create(child_id: olivia.id, user_id: sandra.id)
affiliation_olivia = Filiation.create(child_id: olivia.id, user_id: clem.id)
puts "Riera family created"

puts "Creating posts"
post1_photo = URI.open("https://res.cloudinary.com/ddq1d6u8x/image/upload/v1678461409/production/k9g7hzjrlc2sr715ebfgdoihuwwh.jpg")
post1 = Post.new(content: "Ce matin Alix n'a pas eu peur sur le toboggan :)", user_id: clem.id)
post1.photos.attach(io: post1_photo, filename: "post1.png", content_type: "image/png")
post1.save
post1_child1 = ChildPost.create(child_id: alix.id , post_id: post1.id)

post2_photo1 = URI.open("https://res.cloudinary.com/ddq1d6u8x/image/upload/v1678465613/production/44zbho8lhwsb3p5h8z2nfhhxkow8.jpg")
post2_photo2 = URI.open("https://res.cloudinary.com/ddq1d6u8x/image/upload/v1678465615/production/j1pxtmp0d2avqfjp4yu61kph9pmd.jpg")
post2 = Post.new(content: "Ce matin nous avons joué à l'intérieur à cause de la pluie mais tout le monde s'est bien amusé", user_id: clem.id)
post2.photos.attach(io: post2_photo1, filename: "post2_photo1.png", content_type: "image/png")
post2.photos.attach(io: post2_photo2, filename: "post2_photo2.png", content_type: "image/png")
post2.save
post2_child1 = ChildPost.create(child_id: alix.id , post_id: post2.id)
post2_child2 = ChildPost.create(child_id: zoé.id , post_id: post2.id)

post3_photo = URI.open("https://res.cloudinary.com/ddq1d6u8x/image/upload/v1678461556/production/1kvwe4j2u2l6p40mrp8mqerwcct3.jpg")
post3 = Post.new(content: "Zoé a fait une longue sieste et a mangé son gouter avec appétit !", user_id: clem.id)
post3.photos.attach(io: post3_photo, filename: "post3.png", content_type: "image/png")
post3.save
post3_child1 = ChildPost.create(child_id: zoé.id , post_id: post3.id)
puts "Posts created"

puts "Creating comments"
post1_comment1 = Comment.create(user_id: julie.id, post_id: post1.id, content: "Super !")
post1_comment2 = Comment.create(user_id: baptiste.id, post_id: post1.id, content: "Bravo Alix trop forte !")

post2_comment3 = Comment.create(user_id: julie.id, post_id: post2.id, content: "J'espère qu'elles ont été sages")
post2_comment4 = Comment.create(user_id: baptiste.id, post_id: post2.id, content: "Super je vois qu'on s'amuse aujourd'hui")
post2_comment5 = Comment.create(user_id: djessy.id, post_id: post2.id, content: "Elles sont si mimi")
post2_comment6 = Comment.create(user_id: anne.id, post_id: post2.id, content: "Vous avez bien fait de rester au sec")

post3_comment7 = Comment.create(user_id: djessy.id, post_id: post3.id, content: "Elle a l'air tellement sage quand elle dort...")
post3_comment8 = Comment.create(user_id: anne.id, post_id: post3.id, content: "Ah super merci pour l'udpate")
puts "Comments created"

puts "Creating posts_likes"
post1_like1 = PostLike.create(post_id: post1.id, user_id: julie.id)
post1_like2 = PostLike.create(post_id: post1.id, user_id: baptiste.id)

post2_like1 = PostLike.create(post_id: post2.id, user_id: anne.id)
post2_like2 = PostLike.create(post_id: post2.id, user_id: djessy.id)
post2_like3 = PostLike.create(post_id: post2.id, user_id: julie.id)
post2_like4 = PostLike.create(post_id: post2.id, user_id: baptiste.id)

post3_like1 = PostLike.create(post_id: post3.id, user_id: anne.id)
post3_like2 = PostLike.create(post_id: post3.id, user_id: djessy.id)
puts "Posts_likes created"

puts "Creating comments_likes"
comment1_like1 = CommentLike.create(comment_id: post1_comment1.id ,user_id: clem.id)
comment2_like1 = CommentLike.create(comment_id: post1_comment2.id ,user_id: clem.id)

comment3_like1 = CommentLike.create(comment_id: post2_comment3.id ,user_id: clem.id)
comment4_like1 = CommentLike.create(comment_id: post2_comment4.id ,user_id: clem.id)
comment5_like1 = CommentLike.create(comment_id: post2_comment5.id ,user_id: clem.id)
comment6_like1 = CommentLike.create(comment_id: post2_comment6.id ,user_id: clem.id)

comment7_like1 = CommentLike.create(comment_id: post3_comment7.id ,user_id: clem.id)
comment8_like1 = CommentLike.create(comment_id: post3_comment8.id ,user_id: clem.id)
puts "Comments_likes created"

puts "C'est fini merci d'avoir patienté :)"
