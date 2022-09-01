spain = Country.create(name: "Spain")
germany = Country.create(name: "Germany")
turkey = Country.create(name: "Turkey")

# all of the data for the crags
crags_data = [
  {
    name: "Margalef",
    lat: 41.284320,
    long: 0.754540,
    country: spain
  },
  {
    name: "Siurana",
    lat: 41.258560,
    long: 0.931420,
    country: spain
  },
  {
    name: "Oberammergau",
    lat: 47.596418,
    long: 11.071603,
    country: germany
  },
  {
    name: "Geyikbayiyri",
    lat: 36.874830,
    long: 30.464940,
    country: turkey
  },
  {
    name: "Kochel",
    lat: 47.659489,
    long: 11.364970,
    country: germany
  },
  {
    name: "Weißmain-Alb",
    lat: 50.172751,
    long: 10.956809,
    country: germany
  },
  {
    name: "Oliana",
    lat: 42.067390000000046,
    long: 1.3136700000000587,
    country: spain
  }
]

# IMPORTANT: the key has to match exactly the crag name in crags_data
crags_photos = { Margalef: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661856531/go-climb-seeds/margalef-1_dka26r.jpg",
  Siurana: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661857164/go-climb-seeds/1080px-Siurana_Kirche_do28pr.jpg",
  Oberammergau: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661857179/go-climb-seeds/P1060004-1_gycg9f.jpg",
  Geyikbayiyri: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661939067/go-climb-seeds/geyikbayiri-2015-02-19_frzsid.jpg",
  Kochel: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661984493/go-climb-seeds/kochel_dhoneh.jpg",
  'Weißmain-Alb': "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661984692/go-climb-seeds/Wei%C3%9Fmain-Alb_sooadi.jpg",
  Oliana: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661986800/go-climb-seeds/Oliana_k0ehyb.jpg",

}.stringify_keys

def seed_crags(crags_data, crags_photos)
  puts "seeding crags..."
  crags_data.each do |crag_data|
    crag = Crag.new(crag_data)
    photo = URI.open(crags_photos[crag_data[:name]])
    crag.photo.attach(io: photo, filename: "#{crag_data[:name].delete(' ')}.jpg", content_type: "image/jpg")
    # add country to crag name
    crag.name = "#{crag.name}, #{crag.country.name}"
    crag.save
    puts "crag #{crag.name} with id:#{crag.id} #{crag.valid? ? 'saved' : 'not saved'}"
  end
end





seed_crags(crags_data, crags_photos)
