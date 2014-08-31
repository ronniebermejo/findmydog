
#                     ----->
#User    -> Owner -> Pet --> Image
                #        --> Report

user_ronnie = User.create!({:email => "ronnie.bermejo.mx@gmail.com", :password => "111111", :password_confirmation => "111111" })
user_gaby = User.create!({:email => "garibaygabriela@gmail.com", :password => "111111", :password_confirmation => "111111" })


ronnie = Owner.create(name: 'Rodrigo Bermejo',email:'ronnie.bermejo.mx@gmail.com', phone_number:'442-2736585', user_id: user_ronnie.id)
gaby = Owner.create(name: 'Gabriela Garibay',email:'garibaygabriela@gmail.com', phone_number:'442-2770000', user_id: user_gaby.id)


salichica = AnimalCategory.create(category: 'salchicha', animal:'perro')
criollo = AnimalCategory.create(category: 'criollo', animal:'perro')

casas = PlaceCategory.create(category: 'Casas')
jardin= PlaceCategory.create(category: 'Jardin')
#places

casa_tejeda = Place.create(name: 'Casa Ronnie', address: 'Paseo de Bonn 373, Tejeda, Queretaro, Mx', place_category_id: casas.id)
centro = Place.create(name: 'Centro', address: 'Corregidora, Col. Centro, Queretaro, Mx', place_category_id: jardin.id)
qro2000 = Place.create(name: 'Queretaro 2000', address: 'Parque Queretaro 2000, Queretaro, Mx', place_category_id: jardin.id)
estadio = Place.create(name: 'Estadio Corregidora', address: 'Estadio Corregidora, Queretaro, Mx', place_category_id: jardin.id)
plaza_sendero = Place.create(name: 'Plaza Sendero', address: 'Plaza sendero, Queretaro, Mx', place_category_id: jardin.id)
casa_montenegro = Place.create(name: 'Mansiones del Valle', address: 'Calle Montenegro #14, Masiones del Valle, QRO', place_category_id: casas.id)
ezequiel_montes = Place.create(name: 'Ezequiel Montes', address: 'Ezequiel Montes 81-a, QRO', place_category_id: casas.id)
penuelas = Place.create(name: 'San Pedrito Peñuelas', address: 'San Pedrito Peñuelas, QRO', place_category_id: casas.id)
juriquilla = Place.create(name: 'Juriquilla', address: 'Av. Juriquilla, Villas del Mesón, Queretaro.', place_category_id: casas.id)

image2 = Image.create(category: 'principal',url: 'https://s3-us-west-2.amazonaws.com/findmydog/perro2.jpeg')
image3 = Image.create(category: 'principal',url: 'https://s3-us-west-2.amazonaws.com/findmydog/perro3.jpeg')
image4 = Image.create(category: 'principal',url: 'https://s3-us-west-2.amazonaws.com/findmydog/perro4.jpeg')
image5 = Image.create(category: 'principal',url: 'https://s3-us-west-2.amazonaws.com/findmydog/perro5.jpeg')
image6 = Image.create(category: 'principal',url: 'https://s3-us-west-2.amazonaws.com/findmydog/perro6.jpeg')
image7 = Image.create(category: 'principal',url: 'https://s3-us-west-2.amazonaws.com/findmydog/perro7.jpeg')
image8 = Image.create(category: 'principal',url: 'https://s3-us-west-2.amazonaws.com/findmydog/perro8.jpeg')
image9 = Image.create(category: 'principal',url: 'https://s3-us-west-2.amazonaws.com/findmydog/perro9.jpeg')
image10 = Image.create(category: 'principal',url: 'https://s3-us-west-2.amazonaws.com/findmydog/perro10.jpeg')

Pet.create(name: 'Chana',comments: 'Soy una perrita criolla que me perdi en los sembradios cerca de la secundaria numero 8, por favor llamar al 2 16 61 38', owner: ronnie, image_id: image2.id, place_id: casa_montenegro.id , animal_category: salichica)
Pet.create(name: 'Mugus',comments: 'Perro Yorki extraviado en la colonia tejada, responde al nombre de mugus, muguñe, enano, ven aca',owner: ronnie, image_id: image4.id, place_id: casa_tejeda.id , animal_category: criollo)
Pet.create(name: 'Monga',comments: 'POR FAFOR AYUDANOS ENCONTRAR A NUESTA PERRITA SE PERDIO EL DOMINGO 13 DE JULIO EN EL CENTRO DE QUERETARO TRAIA UN SUETER AZUL Y COLLAR CAFÉ, ALGUNAS PERSONAS LA VIERON CORRIENDO POR LA CALLE 5 DE MAYO.', owner: gaby, image_id: image5.id, place_id: qro2000.id ,animal_category: salichica)
Pet.create(name: 'Sheyla',comments: 'Amig@ de la Colonia La Joya y colonias aledañas por favor ayúdame a regresar con mi familia. Me llamo Sheyla soy una perrita blanca, me salí de mi casa el pasado viernes 20 de junio y ya no supe regresar. Mi familia me quiere mucho y seguro de gratificaran. Si me encuentras o me haz visto llama a los celulares: 442 432 5393 / 442 206 3998 con Erika y/o Rodolfo. Gracias.', owner: gaby, image_id: image6.id, place_id: casa_montenegro.id , animal_category: criollo)
Pet.create(name: 'Lincy',comments: 'Bella", tiene 4 años, de 40 cm aprox. Se perdio el 12 de Julio en Hacienda la Gloria', owner: gaby, image_id: image7.id, place_id: estadio.id , animal_category: criollo)
Pet.create(name: 'Enani',comments: 'Ayudame a regresa a mi casa y te daran una recompensa!!! Mi nombre es camila, soy una chihuahua color golondrino de 7 meses. Me sali de mi casa y no pude encontrar el camino de vuelta vivo en ezequiel montes 81-a entre escobedo y morelos en el centro de Queretaro', owner: gaby, image_id: image8.id, place_id: ezequiel_montes.id , animal_category: criollo)
Pet.create(name: 'Nutsi',comments: 'Hola a todos, buenas noches, Mi nombre es Juan P. y necesitamos su ayuda. Hoy se nos perdió nuestra perrita Nutsi en Av. Juriquilla, Villas del Mesón, Queretaro. Nuestra perrita es color marrón/rojizo y muy chiquita ; y por esta razón no pudo haber ido muy lejos', owner: gaby, image_id: image9.id, place_id: juriquilla.id , animal_category: criollo)
Pet.create(name: 'Timmy',comments: 'Mi nombre es TIMMY, estoy perdido y necesito regresar a mi hogar. Si me ves por favor llama al Tel 313 1613', owner: gaby, image_id: image10.id, place_id: casa_tejeda.id , animal_category: salichica)
Pet.create(name: 'Laika',comments: 'Hola! Encontré hoy 01/07/14 a éste perro en Campestre Jurica. Parece cruza de Labrador con Rottweiler. No trae placa ni collar pero se ve muy bien cuidado. Esta esperando a su familia.', owner: gaby, image_id: image2.id, place_id: plaza_sendero.id , animal_category: criollo)
Pet.create(name: 'Puchis',comments: 'HOLA, POR FAVOR AYUDANOS A ENCONTRAR A POLET, ES UNA PERRITA SCHNAUZER, TIENE 3 AÑOS. SE PERDIO EN LA CALLE DE PRIMAVERA EL 15 DE JULIO DEL PRESENTE.', owner: gaby, image_id: image3.id, place_id: centro.id, animal_category: criollo)
Pet.create(name: 'GYPSY',comments: 'Por favor ayúdame a regresar a mi casa, me perdí el día 2 de Junio por la noche en la colonia San Pedrito Peñuelas. Mi hermanita humana me necesita tiene asma.', owner: gaby, image_id: image3.id, place_id: penuelas.id , animal_category: criollo)

