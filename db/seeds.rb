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

Pet.create(name: 'Chana',comments: 'La mejor perra del mundo !', reported_as: 'lost', status: 'lost',owner: ronnie)
Pet.create(name: 'Copetitos',comments: 'Un pajarito a la moda', reported_as: 'lost', status: 'lost',owner: ronnie)
Pet.create(name: 'Mugus',comments: 'El Enano', reported_as: 'lost', status: 'lost',owner: ronnie)
Pet.create(name: 'Monga',comments: 'La enana', reported_as: 'lost', status: 'lost',owner: gaby)
Pet.create(name: 'Pato Lopex',comments: 'El pato vecino', reported_as: 'lost', status: 'lost', owner: gaby)
Pet.create(name: 'Lincy',comments: 'Brava', reported_as: 'found', status: 'found',owner: gaby)
Pet.create(name: 'Laika',comments: 'Perro en la luna', reported_as: 'lost', status: 'found', owner: gaby)
Pet.create(name: 'Puchis',comments: 'Perro en la luna', reported_as: 'lost', status: 'found', owner: gaby)
Pet.create(name: '',comments: 'Brava', reported_as: 'found', status: 'found',owner: gaby)
Pet.create(name: 'Laika',comments: 'Perro en la luna', reported_as: 'lost', status: 'found', owner: gaby)
Pet.create(name: 'Puchis',comments: 'Perro en la luna', reported_as: 'lost', status: 'found', owner: gaby)
