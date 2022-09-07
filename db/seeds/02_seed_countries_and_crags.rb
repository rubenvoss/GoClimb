spain = Country.create(name: "Spain")
germany = Country.create(name: "Germany")
turkey = Country.create(name: "Turkey")
# all of the data for the crags
crags_data = [
  {
    name: "Margalef",
    lat: 41.284320,
    long: 0.754540,
    url: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661856531/go-climb-seeds/margalef-1_dka26r.jpg",
    country: spain
  },
  {
    name: "Siurana",
    lat: 41.258560,
    long: 0.931420,
    url: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661857164/go-climb-seeds/1080px-Siurana_Kirche_do28pr.jpg",
    country: spain
  },
  {
    name: "Oberammergau",
    lat: 47.596418,
    long: 11.071603,
    url: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1662563879/go-climb-seeds/klettergebiet-frauenwasserl_lqnemr.jpg",
    country: germany
  },
  {
    name: "Sächsische Schweiz",
    lat: 50.90718813667059,
    long: 14.323394432806465,
    url: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1662563987/go-climb-seeds/c3066a1c2fdc342df21851c18828416ab1929ba8_uf6qid.jpg",
    country: germany
  },
  {
    name: "Löbejün",
    lat: 51.63397749748562,
    long: 11.879099133583155,
    url: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1662564090/go-climb-seeds/4286ed0af22658406c9bd24d6f9d1912def4d0e1_dh9ivf.jpg",
    country: germany
  },
  {
    name: "Thüringer Wald",
    lat: 47.596418,
    long: 11.071603,
    url: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1662564195/go-climb-seeds/Bad-Tabarz-Lauchagrund-Aschenbergstein-Klettern_hppiv0.jpg",
    country: germany
  },
  {
    name: "Frankenjura",
    lat: 49.49925836670939,
    long: 11.413256921590024,
    url: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1662564290/go-climb-seeds/kl-klettern-frankenjura-nuernberger-turm-c-rico-haase-n-jpg--fotoshowBig-a2c69252-1566015_ksbwua.jpg",
    country: germany
  },
  {
    name: "Geyikbayiyri",
    lat: 36.874830,
    long: 30.464940,
    url: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661939067/go-climb-seeds/geyikbayiri-2015-02-19_frzsid.jpg",
    country: turkey
  },
  {
    name: "Kochel",
    lat: 47.659489,
    long: 11.364970,
    url: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661984493/go-climb-seeds/kochel_dhoneh.jpg",
    country: germany
  },
  {
    name: "Weißmain-Alb",
    lat: 50.172751,
    long: 10.956809,
    url: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661984692/go-climb-seeds/Wei%C3%9Fmain-Alb_sooadi.jpg",
    country: germany
  },
  {
    name: "Oliana",
    lat: 42.067390000000046,
    long: 1.3136700000000587,
    url: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661986800/go-climb-seeds/Oliana_k0ehyb.jpg",
    country: spain
  },
  {
    name: "Montserrat",
    lat: 41.59392375717025,
    long: 1.832313688787038,
    url: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1662452773/go-climb-seeds/b2c920132af499153b9efb1adefb0fbe50098bf5_eggdqs.jpg",
    country: spain
  },
  {
    name: "Alicante",
    lat: 38.62023337740212,
    long: -0.29173217154773023,
    url: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1662453054/go-climb-seeds/d43872d65e6dad746097c417ab980d4149aaa19f_roppsn.jpg",
    country: spain
  },
  {
    name: "Castellón Area",
    lat: 40.30021490559279,
    long: -0.02869859555978409,
    url: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1662453184/go-climb-seeds/7a0f59a73bad5c1f1a4c602a35b6fa4c01174e0b_caot2z.jpg",
    country: spain
  },
  {
    name: "Chulilla",
    lat: 39.64570087246365,
    long: -0.8951386997876605,
    url: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1662453343/go-climb-seeds/4ebecb025b41a93e777a383443a2a46d477a3ba5_ch0snw.jpg",
    country: spain
  },
  {
    name: "Mallorca",
    lat: 39.581979703494696,
    long: 2.9395938595596567,
    url: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1662453488/go-climb-seeds/b18c36be112b3573e2cbc8e55bc99bef8a278bda_kgwxy9.jpg",
    country: spain
  },
  {
    name: "Rodellar",
    lat: 42.287531347354935,
    long: -0.07447058178804344,
    url: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1662453669/go-climb-seeds/d9b6d6fb669664068250a72220079a8d876b7f41_jtxyrd.jpg",
    country: spain
  },
  {
    name: "El Chorro",
    lat: 36.93078164003414,
    long: -4.7380600898151695,
    url: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1662453868/go-climb-seeds/3790c9d779ad4ca9a6087a9a7a2198c6e82f2060_nb9rmv.jpg",
    country: spain
  },
  {
    name: "Tenerife",
    lat: 42.287531347354935,
    long: -0.07447058178804344,
    url: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1662453893/go-climb-seeds/354ffd38c126013bf9d7460004f7c6989a5ae4e2_z4pfda.jpg",
    country: spain
  },
  {
    name: "Gran Canaria",
    lat: 27.94529254041454,
    long: -15.590887551343647,
    url: "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1662453948/go-climb-seeds/cc6e8d994ae5c9fec19fb46ea8375ea24066468b_hcjm21.jpg",
    country: spain
  },
]

def seed_crags(crags_data)
  puts "seeding crags..."
  crags_data.each do |crag_data|
    crag = Crag.new(crag_data)
    photo = URI.open(crag_data[:url])
    crag.photo.attach(io: photo, filename: "#{crag_data[:name].delete(' ')}.jpg", content_type: "image/jpg")
    # add country to crag name
    crag.name = "#{crag.name}, #{crag.country.name}"
    crag.save!
    puts "crag #{crag.name} with id:#{crag.id} #{crag.valid? ? 'saved' : 'not saved'}"
  end
end

seed_crags(crags_data)
