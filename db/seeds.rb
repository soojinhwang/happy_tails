require "open-uri"

puts "Cleaning application database..."
Application.destroy_all

puts "Cleaning pet database..."
Pet.destroy_all

puts "Cleaning user database..."
User.destroy_all

puts "Cleaning shelter database..."
Shelter.destroy_all

###########################################################

puts "Creating shelter user... "

jane = User.create!(email: "jane@gmail.com",
                    password: "123456",
                    first_name: "Jane",
                    last_name: "Hopper")
file = URI.open('https://images.unsplash.com/photo-1607746882042-944635dfe10e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
jane.photo.attach(io: file, filename: 'jane_profile.png', content_type: 'image/png')
puts "Created jane"

lucy = User.create!(email: "lucy@gmail.com",
                    password: "123456",
                    first_name: "Lucy",
                    last_name: "Bryant")
file = URI.open('https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
lucy.photo.attach(io: file, filename: 'lucy_profile.png', content_type: 'image/png')
puts "Created lucy"

katie = User.create!(email: "katie@gmail.com",
                     password: "123456",
                     first_name: "Katie",
                     last_name: "Jones")
file = URI.open('https://images.unsplash.com/photo-1645378999488-63138abdecd2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
katie.photo.attach(io: file, filename: 'katie_profile.png', content_type: 'image/png')
puts "Created katie"

puts "Creating adopter user... "

mike = User.create!(email: "mike@gmail.com",
                    password: "123456",
                    first_name: "Mike",
                    last_name: "Smith",
                    age: "28",
                    occupation: "Teacher",
                    biography: "My partner and I are looking for a dog to adopt.
                                We already have a cat.",
                    type_of_dwelling: "Flat",
                    outdoor_space: true,
                    other_cats: true,
                    other_dogs: false,
                    children: false,
                    hours_alone: 4,
                    previous_experience: "I've had dogs since I was 5 and am very experienced with them.")
file = URI.open('https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
mike.photo.attach(io: file, filename: 'mike_profile.png', content_type: 'image/png')
puts "Created mike"

jenny = User.create!(email: "jenny@gmail.com",
                     password: "123456",
                     first_name: "Jenny",
                     last_name: "Hughes",
                     age: "40",
                     occupation: "Architect",
                     biography: "My huband and I have two young children who are all very keen to adopt a young dog.",
                     type_of_dwelling: "House",
                     outdoor_space: true,
                     other_cats: false,
                     other_dogs: false,
                     children: true,
                     hours_alone: 5,
                     previous_experience: "I've never had cats but my husband has had them all through his life.")
file = URI.open('https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
jenny.photo.attach(io: file, filename: 'jane_profile.png', content_type: 'image/png')
puts "Created jenny"

derek = User.create!(email: "derek@gmail.com",
                     password: "123456",
                     first_name: "Derek",
                     last_name: "Zhang",
                     age: "32",
                     occupation: "Software Developer",
                     biography: "I'm a freelancer who mostly works from home and I'm looking for a cat to adopt.",
                     type_of_dwelling: "Flat",
                     outdoor_space: true,
                     other_cats: false,
                     other_dogs: false,
                     children: false,
                     hours_alone: 2,
                     previous_experience: "Unfortunately, I've never had cats before.")
file = URI.open('https://images.unsplash.com/photo-1584673392125-f91e13c6a3cb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
derek.photo.attach(io: file, filename: 'derek_profile.png', content_type: 'image/png')
puts "Created derek"

puts "All users created"

###########################################################

puts "Creating shelters... "

shoreditch = Shelter.create!(name: "Shoreditch Rescue",
                             address: "229 Bethnal Green Road, Tower Hamlets, London, E2 7DG, United Kingdom",
                             description: "We are based in Shoreditch and rescue both dogs and cats in the East London area.",
                             user: jane)

puts "Created shoreditch shelter"

city = Shelter.create!(name: "London Inner City Shelter",
                       address: "12 Roger St, London WC1N 2JU",
                       description: "Several animal lovers with many years’ rescue experience
                                     and a shared vision for London formed the shelter to merge resources to help animals in need,
                                     especially those overlooked and in the most need of medical attention and long-term fostering.",
                       user: lucy)

puts "Created city shelter"

croydon = Shelter.create!(name: "Croyon Animal Shelter",
                          address: "136 Cherry Orchard Rd, Croydon CR0 6BB",
                          description: "Croydon Animal Samaritans provide shelter and homing for neglected cats and dogs.
                                        We cover south London and Surrey areas.",
                          user: katie)

puts "Created croydon shelter"

puts "All shelters created"

###########################################################

puts "Creating pets..."

pixel = Pet.create!(adoption_status: "Available",
                    name: "Pixel",
                    species: "Dog",
                    breed: "Labrador Retriever",
                    sex: "Male",
                    age: "6 months",
                    colour: "Black",
                    description: "Pixel is a typical playful pup who is a sweet little boy.
                                  He's energetic and needs a bit of time to be socialised and trained as he's still quite young.
                                  He loves food so using this as a means to train him will work in his favour.
                                  He's happy to live with other animals and he'll be good with young children as well.",
                    outdoor_space: true,
                    other_cats: true,
                    other_dogs: true,
                    children: true,
                    hours_alone: 2,
                    medical_conditions: "None known",
                    shelter: shoreditch)

file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656522235/pet%20pics/zaow3b1at96nzdsskwzdd8mqjgqu_ag0ocz.jpg')
pixel.photos.attach(io: file, filename: 'pixel_1.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656522235/pet%20pics/qm9bu7lt22v8ypnlmj7lytnxkx2o_znnwc1.jpg')
pixel.photos.attach(io: file, filename: 'pixel_2.jpg', content_type: 'image/jpg')

puts "Created pixel"

muffin = Pet.create!(adoption_status: "Available",
                     name: "Muffin",
                     species: "Dog",
                     breed: "Chihuahua",
                     sex: "Female",
                     age: "11 years",
                     colour: "Cream",
                     description: "Muffin came to us due to her owner's ill health.
                                   She loves attention but can also be independent so she needs some space to herself.
                                   She doesn't like loud noises so will need a relatively quiet home.
                                   For this reason, she won't be suited to homes with children.",
                     outdoor_space: false,
                     other_cats: false,
                     other_dogs: false,
                     children: false,
                     hours_alone: 6,
                     medical_conditions: "None known",
                     shelter: shoreditch)

file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656522582/pet%20pics/cj0qh3ahs45psyu9qi7960abb61d_p4wg1c.jpg')
muffin.photos.attach(io: file, filename: 'muffin_1.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656522582/pet%20pics/cm7776f42nwsdjqv3awdw4d9j4lq_giasxs.jpg')
muffin.photos.attach(io: file, filename: 'muffin_2.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656522582/pet%20pics/d8f23om3q1ine7jd29pfrx0cpmti_oduuue.jpg')
muffin.photos.attach(io: file, filename: 'muffin_3.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656522582/pet%20pics/q1yeyo41kjwnarg9n69ezrnp5jak_v1h9mi.jpg')
muffin.photos.attach(io: file, filename: 'muffin_4.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656522582/pet%20pics/utv1tv7o64poq4eb2qaktcofaxp3_rvr6g5.jpg')
muffin.photos.attach(io: file, filename: 'muffin_5.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656522582/pet%20pics/lu8zwqdbnwucbzi9b7a5ck3dyfge_vjp4xt.jpg')
muffin.photos.attach(io: file, filename: 'muffin_6.jpg', content_type: 'image/jpg')

puts "Created muffin"

blanca = Pet.create!(adoption_status: "Available",
                     name: "Blanca",
                     species: "Cat",
                     breed: "Persian",
                     sex: "Female",
                     age: "1 year",
                     colour: "White",
                     description: "Blanca is very purry and has a soft meow.
                                   She craves attention and loves to be stroked and to curl up against her human.
                                   She's not very vocal but she will definitely tell you if she wants something from you!
                                   She is OK to live with older children, but doesn't like dogs.",
                     outdoor_space: false,
                     other_cats: true,
                     other_dogs: false,
                     children: true,
                     hours_alone: 6,
                     medical_conditions: "None known",
                     shelter: shoreditch)

file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656522408/pet%20pics/rmkei50brglebgwpzj4plklxcnkv_phlltq.webp')
blanca.photos.attach(io: file, filename: 'blanca_1.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656522408/pet%20pics/q3zy2zd6wssq40kknm0vexm4dnwg_donjaw.webp')
blanca.photos.attach(io: file, filename: 'blanca_2.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656522408/pet%20pics/5l9awh23ooqslb6qtc9aurs0fbqy_sow8hg.webp')
blanca.photos.attach(io: file, filename: 'blanca_3.jpg', content_type: 'image/jpg')

puts "Created blanca"

wanda = Pet.create!(adoption_status: "Available",
                    name: "Wanda",
                    species: "Cat",
                    breed: "Domestic Shorthair",
                    sex: "Female",
                    age: "5 years",
                    colour: "Tabby",
                    description: "Wanda is a very sweet cat who born with a brain abnormality, which means her head wobbles and she's unsteady on her feet.
                                  Having said that, she is a independent and tenacious but also very friendly and affectionate.
                                  Wanda loves being stroked and having a chit-chat.
                                  She has an adorable spot-light on the tip of her tail which truly makes her unique.",
                    outdoor_space: false,
                    other_cats: true,
                    other_dogs: false,
                    children: false,
                    hours_alone: 4,
                    medical_conditions: "Wanda is a disabled cat",
                    shelter: shoreditch)

file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656532111/pet%20pics/00P8e000001FILwEAO_pvzqid.jpg')
wanda.photos.attach(io: file, filename: 'wanda_1.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656532111/pet%20pics/00P8e000001FIMoEAO_lyzaij.jpg')
wanda.photos.attach(io: file, filename: 'wanda_2.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656532111/pet%20pics/00P8e000001FIMtEAO_sbf0sx.jpg')
wanda.photos.attach(io: file, filename: 'wanda_3.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656532111/pet%20pics/00P8e000001FIJvEAO_w45ovy.jpg')
wanda.photos.attach(io: file, filename: 'wanda_4.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656532111/pet%20pics/00P8e000001FIMjEAO_rdgr7j.jpg')
wanda.photos.attach(io: file, filename: 'wanda_5.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656532111/pet%20pics/00P8e000001FIMeEAO_jpki6k.jpg')
wanda.photos.attach(io: file, filename: 'wanda_6.jpg', content_type: 'image/jpg')

puts "Created wanda"

carrot = Pet.create!(adoption_status: "Available",
                     name: "Carrot",
                     species: "Cat",
                     breed: "Domestic Shorthair",
                     sex: "Male",
                     age: "4 years",
                     colour: "White and ginger",
                     description: "Carrot is a big lad who has a heart as big as his cheeks.
                                   He adores spending time on his human friends laps and will leave you in a thick layer of white fur.
                                   Carrot also enjoy basking in the sunshine in the garden.
                                   He doesn't get along with other animals but he's happy to spend time with teenagers.",
                     outdoor_space: true,
                     other_cats: true,
                     other_dogs: false,
                     children: true,
                     hours_alone: 6,
                     medical_conditions: "None known",
                     shelter: shoreditch)

file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656531514/pet%20pics/00P8e000001FT8QEAW_b66mpj.jpg')
carrot.photos.attach(io: file, filename: 'carrot_1.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656531513/pet%20pics/00P8e000001F6q7EAC_i1ue0j.jpg')
carrot.photos.attach(io: file, filename: 'carrot_2.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656531513/pet%20pics/00P8e000001FSshEAG_sbghfn.jpg')
carrot.photos.attach(io: file, filename: 'carrot_3.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656531513/pet%20pics/00P8e000001FT8kEAG_jcnz8q.jpg')
carrot.photos.attach(io: file, filename: 'carrot_4.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656531513/pet%20pics/00P8e000001FT8pEAG_ciimkc.jpg')
carrot.photos.attach(io: file, filename: 'carrot_5.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656531513/pet%20pics/00P8e000001FT8fEAG_iytm1z.jpg')
carrot.photos.attach(io: file, filename: 'carrot_6.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656531513/pet%20pics/00P8e000001FT8aEAG_b75ujm.jpg')
carrot.photos.attach(io: file, filename: 'carrot_7.jpg', content_type: 'image/jpg')

puts "Created carrot"

spike = Pet.create!(adoption_status: "Adopted",
                    name: "Spike",
                    species: "Cat",
                    breed: "Domestic Shorthair",
                    sex: "Male",
                    age: "7 years",
                    colour: "Black and white",
                    description: "Spike is a very active and independent cat
                                  He used to live on a farm so he's used to exploring outdoors so will need a home to suit his needs.
                                  He is very affectionate and loves to be petted and will sit on your lap for a cuddle.
                                  As a former farm cat, he's used to there being other animals around him,
                                  and will also be happy to live with young children.",
                    outdoor_space: true,
                    other_cats: true,
                    other_dogs: true,
                    children: true,
                    hours_alone: 8,
                    medical_conditions: "None known",
                    shelter: shoreditch)

file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304907/pet%20pics/IMG-20190714-WA0009_fe7euo.jpg')
spike.photos.attach(io: file, filename: 'spike_1.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304130/pet%20pics/PXL_20220418_195133993.PORTRAIT_besozb.jpg')
spike.photos.attach(io: file, filename: 'spike_2.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304908/pet%20pics/IMG_20191228_153340_in7yzk.jpg')
spike.photos.attach(io: file, filename: 'spike_3.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304536/pet%20pics/PXL_20210529_111800199_owqvtg.jpg')
spike.photos.attach(io: file, filename: 'spike_4.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304536/pet%20pics/PXL_20210530_134601143_os9bck.jpg')
spike.photos.attach(io: file, filename: 'spike_5.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304366/pet%20pics/PXL_20211227_183651097_hxfa0e.jpg')
spike.photos.attach(io: file, filename: 'spike_6.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304907/pet%20pics/IMG-20190109-WA0007_eoispe.jpg')
spike.photos.attach(io: file, filename: 'spike_7.jpg', content_type: 'image/jpg')

puts "Created spike"

###########################################################

laika = Pet.create!(adoption_status: "Available",
                    name: "Laika",
                    species: "Dog",
                    breed: "Border Collie",
                    sex: "Female",
                    age: "9 years",
                    colour: "Black and white",
                    description: "Laika is a super intelligent and energetic dog despite her age.
                                  She loves walking and can be out and about for hours, so will need someone who can keep up with her.
                                  She's lived with other dogs and children in the past so will suit a wide range of homes.
                                  She's happy to spend time with her family, but also happy to chill by herself as well.",
                    outdoor_space: true,
                    other_cats: false,
                    other_dogs: true,
                    children: true,
                    hours_alone: 4,
                    medical_conditions: "Needs medication once a day",
                    shelter: city)

file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656523048/pet%20pics/utiy0klwpszkd4shktd88kxbzin6_svbzc6.jpg')
laika.photos.attach(io: file, filename: 'laika_1.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656523048/pet%20pics/jkq5k4xxhiajuybj99njozzii2wi_rnwrtp.jpg')
laika.photos.attach(io: file, filename: 'laika_2.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656523048/pet%20pics/7lqyz0s15icz8ury5mqcxr5spdv8_pubrz1.jpg')
laika.photos.attach(io: file, filename: 'laika_3.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656523048/pet%20pics/vwfpyhtbc0xxnae16k44p5wf9cdu_ql41jp.jpg')
laika.photos.attach(io: file, filename: 'laika_4.jpg', content_type: 'image/jpg')

puts "Created laika"

chilli = Pet.create!(adoption_status: "Available",
                     name: "Chilli",
                     species: "Dog",
                     breed: "Beagle",
                     sex: "Male",
                     age: "4 years",
                     colour: "Mixed",
                     description: "Chili was rescued from a puppy farm and therefore hadn't lived in a home environment before meaning that he required all training from scratch.
                                   Due to his backgroud, we are looking for an experienced adult home with no pets, no visiting children or visiting dogs.
                                   True to the Beagle, Chili is a fun dog and loves to sniff and often has selective hearing.
                                   He's a very active dog so he would benefit from his own private and secure garden.",
                     outdoor_space: true,
                     other_cats: false,
                     other_dogs: false,
                     children: false,
                     hours_alone: 2,
                     medical_conditions: "None known",
                     shelter: city)

file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656533114/pet%20pics/00P8e000001EzI1EAK_yhcv9y.jpg')
chilli.photos.attach(io: file, filename: 'chilli_1.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656533114/pet%20pics/00P8e000001EhmFEAS_lyrf6e.jpg')
chilli.photos.attach(io: file, filename: 'chilli_2.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656533114/pet%20pics/00P8e000001EzHwEAK_uee6u3.jpg')
chilli.photos.attach(io: file, filename: 'chilli_3.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656533114/pet%20pics/00P8e000001FY2uEAG_vkgv9l.jpg')
chilli.photos.attach(io: file, filename: 'chilli_4.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656533114/pet%20pics/00P8e000001EgCLEA0_a472cx.jpg')
chilli.photos.attach(io: file, filename: 'chilli_5.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656533114/pet%20pics/00P8e000001EhmPEAS_sn5upf.jpg')
chilli.photos.attach(io: file, filename: 'chilli_6.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656533114/pet%20pics/00P8e000001EhmKEAS_u6ug9n.jpg')
chilli.photos.attach(io: file, filename: 'chilli_7.jpg', content_type: 'image/jpg')

puts "Created chilli"

abla = Pet.create!(adoption_status: "Available",
                   name: "Abla",
                   species: "Cat",
                   breed: "Domestic Shorthair",
                   sex: "Female",
                   age: "8 years",
                   colour: "Calico",
                   description: "Abla is quirky and vocal and has lots of fun to bring to her new family.
                                 She is a bit chunky so her new people will need to keep an eye on her food,
                                 and encourage her to move around.
                                 Abla will need outside access, and will need a cat flap if her new owners work full time.
                                 She enjoys being outside, soaking up the sunshine and exploring.
                                 She can live with older children and teenagers, but would prefer to be the only animal of the house.",
                   outdoor_space: true,
                   other_cats: false,
                   other_dogs: false,
                   children: true,
                   hours_alone: 6,
                   medical_conditions: "None known",
                   shelter: city)

file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656523426/pet%20pics/00P8e000001F1L7EAK_mhpcll.jpg')
abla.photos.attach(io: file, filename: 'abla_1.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656523426/pet%20pics/00P8e000001F1KiEAK_meinwt.jpg')
abla.photos.attach(io: file, filename: 'abla_2.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656523426/pet%20pics/00P8e000001F1KYEA0_oulsu4.jpg')
abla.photos.attach(io: file, filename: 'abla_3.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656523426/pet%20pics/00P8e000001F1KdEAK_qspmfk.jpg')
abla.photos.attach(io: file, filename: 'abla_4.jpg', content_type: 'image/jpg')

puts "Created abla"

frankie = Pet.create!(adoption_status: "Available",
                      name: "Frankie",
                      species: "Cat",
                      breed: "Ragdoll",
                      sex: "Male",
                      age: "4 years",
                      colour: "Cream and black",
                      description: "Frankie is a very friendly cat with a super affectionate nature.
                                    He loves to demand a fuss from people by using hisadorable meow!
                                    Frankie is looking for a family who are around to give him plenty of love and affectionate.
                                    He also needs owners who can keep on top of his coat maintenance and groom him regularly to ensure his luscious locks remain knot-free.",
                      outdoor_space: false,
                      other_cats: false,
                      other_dogs: false,
                      children: false,
                      hours_alone: 4,
                      medical_conditions: "None known",
                      shelter: city)

file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656532577/pet%20pics/00P8e000001FPztEAG_z4ozaw.jpg')
frankie.photos.attach(io: file, filename: 'frankie_1.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656532577/pet%20pics/00P8e000001FPzmEAG_o78d3w.jpg')
frankie.photos.attach(io: file, filename: 'frankie_2.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656532577/pet%20pics/00P8e000001FQ2cEAG_l0crue.jpg')
frankie.photos.attach(io: file, filename: 'frankie_3.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656532577/pet%20pics/00P8e000001FQ2XEAW_fjros3.jpg')
frankie.photos.attach(io: file, filename: 'frankie_4.jpg', content_type: 'image/jpg')

puts "Created frankie"

memphis = Pet.create!(adoption_status: "Reserved",
                      name: "Memphis",
                      species: "Dog",
                      breed: "Lurcher",
                      sex: "Male",
                      age: "9 months",
                      colour: "Grey",
                      description: "Memphis is a very nice young dog who came to us as a stray, and he has become friendly and sociable.
                                    He is looking for a family home who are keen to train him and spend lots of time with him.
                                    Memphis is very energetic so will need someone who can take him out for frequent walks.
                                    As he is a younger dog, he's happy to live with other animals and young children.",
                      outdoor_space: true,
                      other_cats: true,
                      other_dogs: true,
                      children: true,
                      hours_alone: 3,
                      medical_conditions: "None known",
                      shelter: city)

file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656441499/pet%20pics/9cozum9ajd9meu3pzd8tim63l5t8_mqaynr.jpg')
memphis.photos.attach(io: file, filename: 'memphis_1.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656441499/pet%20pics/uxdfc592z0ndlwk3yb7856iuncxy_bkezhp.jpg')
memphis.photos.attach(io: file, filename: 'memphis_2.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656441499/pet%20pics/090zsyi4x8mh0anc8funikc4ignk_hqx0q0.jpg')
memphis.photos.attach(io: file, filename: 'memphis_3.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656441499/pet%20pics/r5c323jjqhbqy8bnab8n2j4kcquy_islgem.jpg')
memphis.photos.attach(io: file, filename: 'memphis_4.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656441499/pet%20pics/xrwykqpvides179zla9x9zobzmd7_b9yowq.jpg')
memphis.photos.attach(io: file, filename: 'memphis_5.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656441499/pet%20pics/xrhsestwmtjx6mstevtv3xokhje7_mzadnh.jpg')
memphis.photos.attach(io: file, filename: 'memphis_6.jpg', content_type: 'image/jpg')

puts "Created memphis"

ellis = Pet.create!(adoption_status: "Adopted",
                    name: "Ellis",
                    species: "Cat",
                    breed: "Domestic Shorthair",
                    sex: "Female",
                    age: "9 years",
                    colour: "Calico",
                    description: "Ellis has been with us for quite awhile due to a wound she came in with.
                                  She is a gentle and affectionate cat who loves to spend time with her favourite people.
                                  As soon as you sit down she climbs straight onto your lap for lots of cuddles and head rubs.
                                  She is an older cat and hasn't shown much of a playful side, or much interest in toys.",
                    outdoor_space: true,
                    other_cats: false,
                    other_dogs: false,
                    children: true,
                    hours_alone: 3,
                    medical_conditions: "None known",
                    shelter: city)

file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656527770/pet%20pics/00P8e000001EzfhEAC_uqbkcp.jpg')
ellis.photos.attach(io: file, filename: 'ellis_1.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656527770/pet%20pics/00P8e000001EzjTEAS_tovbrl.jpg')
ellis.photos.attach(io: file, filename: 'ellis_2.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656527770/pet%20pics/00P8e000001EzjBEAS_ldohfa.jpg')
ellis.photos.attach(io: file, filename: 'ellis_3.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656527770/pet%20pics/00P8e000001EzifEAC_hbajdf.jpg')
ellis.photos.attach(io: file, filename: 'ellis_4.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656527770/pet%20pics/00P8e000001EzjEEAS_itdllw.jpg')
ellis.photos.attach(io: file, filename: 'ellis_5.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656527770/pet%20pics/00P8e000001Ezj4EAC_kvixoa.jpg')
ellis.photos.attach(io: file, filename: 'ellis_6.jpg', content_type: 'image/jpg')

puts "Created ellis"

luna = Pet.create!(adoption_status: "Adopted",
                   name: "Luna",
                   species: "Cat",
                   breed: "Domestic Shorthair",
                   sex: "Female",
                   age: "6 years",
                   colour: "Black and white",
                   description: "Luna is a chilled cat who is affectionate and will purr a lot, although she can get overexcited.
                                 She's not very motivated by food but will still meow for it.
                                 She is sociable and will greet guests when they come visit,
                                 but will also come and greet you when you get home after being at work.
                                 She unfortunately doesn't get along with other cats so will need to be the only cat of the house.",
                   outdoor_space: false,
                   other_cats: false,
                   other_dogs: false,
                   children: true,
                   hours_alone: 6,
                   medical_conditions: "Need regular checkups for heart murmurs",
                   shelter: city)

file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304536/pet%20pics/PXL_20210412_113037977.PORTRAIT_1_r7bc8k.jpg')
luna.photos.attach(io: file, filename: 'luna_1.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304356/pet%20pics/PXL_20220530_200227808_nuvsh2.jpg')
luna.photos.attach(io: file, filename: 'luna_2.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304908/pet%20pics/IMG_20180228_194657_iv7ejw.jpg')
luna.photos.attach(io: file, filename: 'luna_3.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304536/pet%20pics/PXL_20210418_022803035_ly78za.jpg')
luna.photos.attach(io: file, filename: 'luna_4.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304536/pet%20pics/PXL_20210411_214640539.PORTRAIT_sjuac4.jpg')
luna.photos.attach(io: file, filename: 'luna_5.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304907/pet%20pics/IMG-20180317-WA0000_dtvajb.jpg')
luna.photos.attach(io: file, filename: 'luna_6.jpg', content_type: 'image/jpg')

puts "Created luna"

###########################################################

bruno = Pet.create!(adoption_status: "Available",
                    name: "Bruno",
                    species: "Dog",
                    breed: "Bulldog",
                    sex: "Male",
                    age: "4 years",
                    colour: "Brown",
                    description: "Bruno is a charming big boy but has been a little worried in kennels
                                  and it has taken a bit of time to make friends.
                                  However once bonded with people he is a very friendly, fun and affectionate dog with a lot of love to give.
                                  Bruno can be incredibly strong on lead so needs owners who will physically be able to manage him.
                                  He's looking for a home with teens or above and his own private garden for all of his training needs.",
                    outdoor_space: true,
                    other_cats: true,
                    other_dogs: false,
                    children: true,
                    hours_alone: 6,
                    medical_conditions: "None known",
                    shelter: croydon)

file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656524131/pet%20pics/00P8e000001FEuPEAW_oo9jva.jpg')
bruno.photos.attach(io: file, filename: 'bruno_1.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656524131/pet%20pics/00P8e000001FEvIEAW_gct3um.jpg')
bruno.photos.attach(io: file, filename: 'bruno_2.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656524131/pet%20pics/00P8e000001FEuyEAG_jkvqvx.jpg')
bruno.photos.attach(io: file, filename: 'bruno_3.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656524131/pet%20pics/00P8e000001FEttEAG_mf27ch.jpg')
bruno.photos.attach(io: file, filename: 'bruno_4.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656524131/pet%20pics/00P8e000001FEvSEAW_bg7dw0.jpg')
bruno.photos.attach(io: file, filename: 'bruno_5.jpg', content_type: 'image/jpg')

puts "Created bruno"

reggie = Pet.create!(adoption_status: "Available",
                     name: "Reggie",
                     species: "Dog",
                     breed: "Spaniel",
                     sex: "Male",
                     age: "10 months",
                     colour: "Ginger and white",
                     description: "Reggie is a lively young dog who loves being outdoors
                                   but can find other aspects of the world quite overwhelming.
                                   He loves his food and this can be used practically in his ongoing training.
                                   Reggie can be destructive when left alone so he'll need an experienced owner
                                   who has had practical knowledge of these challenges and are willing to continue with the training him.",
                     outdoor_space: false,
                     other_cats: false,
                     other_dogs: false,
                     children: true,
                     hours_alone: 2,
                     medical_conditions: "None known",
                     shelter: croydon)

file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656524386/pet%20pics/00P8e000001EkRZEA0_opm7l5.jpg')
reggie.photos.attach(io: file, filename: 'reggie_1.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656524386/pet%20pics/00P8e000001ElDAEA0_diceyl.jpg')
reggie.photos.attach(io: file, filename: 'reggie_2.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656524386/pet%20pics/00P8e000001EkRUEA0_hkdcte.jpg')
reggie.photos.attach(io: file, filename: 'reggie_3.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656524386/pet%20pics/00P8e000001EkRPEA0_c5r8pr.jpg')
reggie.photos.attach(io: file, filename: 'reggie_4.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656524386/pet%20pics/00P8e000001EkReEAK_lujmnu.jpg')
reggie.photos.attach(io: file, filename: 'reggie_5.jpg', content_type: 'image/jpg')

puts "Created reggie"

ozzy = Pet.create!(adoption_status: "Available",
                   name: "Ozzy ",
                   species: "Cat",
                   breed: "Domestic Shorthair",
                   sex: "Male",
                   age: "11 years",
                   colour: "Brown Tabby",
                   description: "Ozzy is a relaxed and refined cat who is looking for the perfect retirement home to spend his golden years.
                                 He is a sociable and gentle fellow who will approach to give head bumps
                                 and makes puddings while getting strokes, even getting on your lap when it takes his fancy.
                                 Ozzy also is quite used to taking care of himself but will need access to a garden once settled so he can enjoy the sun on fair weather days.",
                   outdoor_space: true,
                   other_cats: false,
                   other_dogs: false,
                   children: true,
                   hours_alone: 5,
                   medical_conditions: "Needs medication once a day",
                   shelter: croydon)

file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656524761/pet%20pics/00P8e000001FVRyEAO_th8uw8.jpg')
ozzy.photos.attach(io: file, filename: 'ozzy_1.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656524761/pet%20pics/00P8e000001FeC8EAK_t8pvew.jpg')
ozzy.photos.attach(io: file, filename: 'ozzy_2.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656524761/pet%20pics/00P8e000001FeC3EAK_te7oyb.jpg')
ozzy.photos.attach(io: file, filename: 'ozzy_3.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656524761/pet%20pics/00P8e000001FeB6EAK_vyrllw.jpg')
ozzy.photos.attach(io: file, filename: 'ozzy_4.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656524761/pet%20pics/00P8e000001FeBtEAK_pfr4u0.jpg')
ozzy.photos.attach(io: file, filename: 'ozzy_5.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656524761/pet%20pics/00P8e000001FeCDEA0_paabli.jpg')
ozzy.photos.attach(io: file, filename: 'ozzy_6.jpg', content_type: 'image/jpg')

puts "Created ozzy"

troy = Pet.create!(adoption_status: "Available",
                   name: "Troy ",
                   species: "Cat",
                   breed: "Domestic Shorthair",
                   sex: "Male",
                   age: "4 months",
                   colour: "Black and white",
                   description: "Troy is a typically lively and energetic young kitten who loves being around people.
                                 He may be a little shy at first but this does not last long.
                                 He simply cannot resist enjoying some strokes and cheek scratches while happily purring away in delight!
                                 Troy is looking for a family who can keep up with his energy levels through plenty of play and attention.",
                   outdoor_space: true,
                   other_cats: false,
                   other_dogs: false,
                   children: true,
                   hours_alone: 4,
                   medical_conditions: "None known",
                   shelter: croydon)

file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656525101/pet%20pics/00P8e000001FYdJEAW_ybbhic.jpg')
troy.photos.attach(io: file, filename: 'troy_1.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656525101/pet%20pics/00P8e000001FYdXEAW_vfcwoz.jpg')
troy.photos.attach(io: file, filename: 'troy_2.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656525101/pet%20pics/00P8e000001FYdcEAG_sc3giz.jpg')
troy.photos.attach(io: file, filename: 'troy_3.jpg', content_type: 'image/jpg')

puts "Created troy"

lila = Pet.create!(adoption_status: "Reserved",
                   name: "Lila ",
                   species: "Dog",
                   breed: "Maltese",
                   sex: "Female",
                   age: "2 years",
                   colour: "White",
                   description: "Lila is a very sweet little girl who has a worried side and can be easily overwhelmed in new environments.
                                 She will need new owners who can build her confidence, get her used to the outside world and gradually socialise her with other dogs.
                                 Once bonded, Lila is super affectionate, eager to please and has so much to give.
                                 New owners would benefit from having experience with rescue dogs so they can help Lila with her nervous side,",
                   outdoor_space: false,
                   other_cats: true,
                   other_dogs: false,
                   children: false,
                   hours_alone: 5,
                   medical_conditions: "None known",
                   shelter: croydon)

file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656527310/pet%20pics/00P8e000001F4MrEAK_cfkad3.jpg')
lila.photos.attach(io: file, filename: 'lila_1.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656527310/pet%20pics/00P8e000001F4MmEAK_u51zks.jpg')
lila.photos.attach(io: file, filename: 'lila_2.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656527310/pet%20pics/00P8e000001F4McEAK_fv8plu.jpg')
lila.photos.attach(io: file, filename: 'lila_3.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656527310/pet%20pics/00P8e000001FAXeEAO_ydzyw2.jpg')
lila.photos.attach(io: file, filename: 'lila_4.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656527310/pet%20pics/00P8e000001FAXZEA4_t17bcj.jpg')
lila.photos.attach(io: file, filename: 'lila_5.jpg', content_type: 'image/jpg')

puts "Created lila"

leo = Pet.create!(adoption_status: "Reserved",
                  name: "Leo ",
                  species: "Cat",
                  breed: "Himalayan",
                  sex: "Male",
                  age: "5 years",
                  colour: "Grey",
                  description: "Leo is a very friendly cat with a bold personality.
                                He is looking for a family who can give him plenty of love and attention, he can be very demanding.
                                Being a Himalayan breed, Leo will require some maintenance such as maybe the occasional gentle eye wipe
                                and regular grooming of his coat to ensure his luscious locks remain knot-free.",
                  outdoor_space: false,
                  other_cats: false,
                  other_dogs: false,
                  children: true,
                  hours_alone: 5,
                  medical_conditions: "Needs eye drops once a month",
                  shelter: croydon)

file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656526802/pet%20pics/00P8e000001FY1CEAW_vvhaio.jpg')
leo.photos.attach(io: file, filename: 'leo_1.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656526802/pet%20pics/00P8e000001FY12EAG_dncqyy.jpg')
leo.photos.attach(io: file, filename: 'leo_2.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656526802/pet%20pics/00P8e000001FY17EAG_fk7kcg.jpg')
leo.photos.attach(io: file, filename: 'leo_3.jpg', content_type: 'image/jpg')

puts "Created leo"

bella = Pet.create!(adoption_status: "Adopted",
                    name: "Bella ",
                    species: "Dog",
                    breed: "Jack Russell Terrier",
                    sex: "Female",
                    age: "2 years",
                    colour: "Brown",
                    description: "Bella is a young dog who is full of enthusiasm and love for life.
                                  She loves her food and toys but does have a sensitive side which a new owner will need to help her with.
                                  Bella does need a home with more than one owner who can work together on her needs.
                                  She also must have a private garden so she can spend time building a bond with her new family before she has to face the big wide world.",
                    outdoor_space: true,
                    other_cats: false,
                    other_dogs: false,
                    children: true,
                    hours_alone: 3,
                    medical_conditions: "Bella is missing an eye",
                    shelter: croydon)

file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656526340/pet%20pics/00P8e000001FfwvEAC_bh0zx0.jpg')
bella.photos.attach(io: file, filename: 'bella_1.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656526341/pet%20pics/00P8e000001FfwREAS_uezu4z.jpg')
bella.photos.attach(io: file, filename: 'bella_2.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656526341/pet%20pics/00P8e000001FfwWEAS_iaqxjq.jpg')
bella.photos.attach(io: file, filename: 'bella_3.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656526341/pet%20pics/00P8e000001FfwbEAC_noadbu.jpg')
bella.photos.attach(io: file, filename: 'bella_4.jpg', content_type: 'image/jpg')

puts "Created bella"

puts "All pets created"

###########################################################

require 'date'
puts "Creating applications..."

app1 = Application.create!(user: derek,
                           pet: luna,
                           date: DateTime.parse("7th Jan 2022"),
                           approved: true,
                           reviewed: true)

puts "application 1 created!"

app2 = Application.create!(user: derek,
                           pet: spike,
                           date: DateTime.parse("7th Jan 2022"),
                           approved: false,
                           reviewed: true)

puts "application 2 created!"

app3 = Application.create!(user: jenny,
                           pet: memphis,
                           date: DateTime.parse("14th Jun 2022"),
                           approved: false,
                           reviewed: true)

puts "application 3 created!"

app4 = Application.create!(user: jenny,
                           pet: lila,
                           date: DateTime.parse("14th Jun 2022"),
                           approved: false,
                           reviewed: true)

puts "application 4 created!"

app5 = Application.create!(user: mike,
                            pet: blanca,
                            date: DateTime.parse("4th Jan 2022"),
                            approved: false,
                            reviewed: true)

puts "application 5 created!"

app6 = Application.create!(user: mike,
                           pet: spike,
                           date: DateTime.parse("4th Jan 2022"),
                           approved: true,
                           reviewed: true)

puts "application 6 created!"

puts "All applications created"
