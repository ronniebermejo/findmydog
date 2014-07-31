# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



user_ronnie = User.create!({:email => "ronnie.bermejo.mx@gmail.com", :password => "111111", :password_confirmation => "111111" })
user_gaby = User.create!({:email => "garibaygabriela@gmail.com", :password => "111111", :password_confirmation => "111111" })


ronnie = Owner.create(name: 'Rodrigo Bermejo',email:'ronnie.bermejo.mx@gmail.com', phone_number:'442-2736585', user_id: user_ronnie.id)
gaby = Owner.create(name: 'Gabriela Garibay',email:'garibaygabriela@gmail.com', phone_number:'442-2770000', user_id: user_gaby.id)

image2 = Image.create(category: 'principal',url: '/assets/perro2.jpeg')
image3 = Image.create(category: 'principal',url: '/assets/perro3.jpeg')
image4 = Image.create(category: 'principal',url: '/assets/perro4.jpeg')
image5 = Image.create(category: 'principal',url: '/assets/perro5.jpeg')
image6 = Image.create(category: 'principal',url: '/assets/perro6.jpeg')
image7 = Image.create(category: 'principal',url: '/assets/perro7.jpeg')
image8 = Image.create(category: 'principal',url: '/assets/perro8.jpeg')
image9 = Image.create(category: 'principal',url: '/assets/perro9.jpeg')
image10 = Image.create(category: 'principal',url: '/assets/perro10.jpeg')

Pet.create(name: 'Chana',comments: 'Soy una perrita criolla que me perdi cerca de la centrar camionera', reported_as: 'lost', status: 'lost',owner: ronnie, image_id: image2.id)
Pet.create(name: 'Copetitos',comments: 'Caniario amarillo perdido cerca del parque de Jardines, se le vio por ultima vez en compañia de un perico', reported_as: 'lost', status: 'lost',owner: ronnie, image_id: image3.id)
Pet.create(name: 'Mugus',comments: 'Perro Yorki extraviado en la colonia tejada, responde al nombre de mugus, muguñe, enano, ven aca', reported_as: 'lost', status: 'lost',owner: ronnie, image_id: image4.id)
Pet.create(name: 'Monga',comments: 'Perrita Yorki la cual anda buscando mugus para formar una familia', reported_as: 'lost', status: 'lost',owner: gaby, image_id: image5.id)
Pet.create(name: 'Pato Lopex',comments: 'El pato vecino', reported_as: 'lost', status: 'lost', owner: gaby, image_id: image6.id)
Pet.create(name: 'Lincy',comments: 'Brava', reported_as: 'found', status: 'found',owner: gaby, image_id: image7.id)
Pet.create(name: 'Laika',comments: 'Perro en la luna', reported_as: 'lost', status: 'found', owner: gaby, image_id: image8.id)
Pet.create(name: 'Puchis',comments: 'Perro en la luna', reported_as: 'lost', status: 'found', owner: gaby, image_id: image9.id)
Pet.create(name: 'Timmy',comments: 'Mi nombre es TIMMY, estoy perdido y necesito regresara mi hogar. Si me ves por favor llama al Tel 313 1613', reported_as: 'found', status: 'found',owner: gaby, image_id: image10.id)
Pet.create(name: 'Laika',comments: 'Perro en la luna', reported_as: 'lost', status: 'found', owner: gaby, image_id: image2.id)
Pet.create(name: 'Puchis',comments: 'Perro en la luna', reported_as: 'lost', status: 'found', owner: gaby, image_id: image3.id)
