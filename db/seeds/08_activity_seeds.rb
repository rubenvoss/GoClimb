activity_data = [
  [# Margalef
    {name: "Accommodation in Margalef On Sight", address: "Carrer dels Molins, 24, 43371 Margalef, Tarragona, Spanien"},
    {name: "Margalef Beer", address: "C. Nou, 43371 Margalef, Tarragona, Spanien" },
    {name: "La Botiga Supermarket", address: "Carrer del Pont, 4, 43371 Margalef, Tarragona, Spanien" },
    {name: "Cal Bruno", address: "Carrer dels Molins, 32, 43371 Margalef, Tarragona, Spanien"},
    {name: "Cafe Vernet", address: "Plaça de Sant Miquel, 17, 43371 Margalef, Tarragona, Spanien"}
  ],
  [# Siurana
    {name: "Viewpoint El Balcó de Siurana", address: "Carrer Major, S/N, 43362 Siurana, Tarragona, Spanien"},
    {name: "Santa Maria Church", address: "Carrer Major, 43362 Siurana, Tarragona, Spanien"},
    {name: "Restaurant Siurana", address: "Carrer Major, 43362 Siurana, Tarragona, Spanien"},
    {name: "Restaurant Siurana", address: "Carrer Major, 43362 Siurana, Tarragona, Spanien"},
    {name: "Restaurant Siurana", address: "Carrer Major, 43362 Siurana, Tarragona, Spanien"}
  ],
  [# Oberammergau
    {name: "Schleifmühlklamm Waterfall", address: "Pürschlingstraße 52, 82497 Unterammergau"},
    {name: "Kolbensesselbahn Chairlift", address: "Kreislainenweg, 82487 Oberammergau"},
    {name: "Camping Oberammergau", address: "Ettaler Str. 56B, 82487 Oberammergau"},
    {name: "Klosterhotel Ettal Ludwig der Bayer", address: "Kaiser-Ludwig-Platz 10, 82488 Ettal"},
    {name: "Restaurant Ettaler Mühle", address: "Ettaler Mühle 1, 82488 Ettal"}
  ],
  [# Geyikbayiyri
    {name: "Pan Camping &Hotel", address: "Geyikbayırı, 07070 Konyaaltı/Antalya, Türkei"},
    {name: "Josito Resort", address: "Geyikbayırı, 07070 Konyaaltı/Antalya, Türkei"},
    {name: "Geyikbayiri su kenari Waterfall", address: "Geyikbayırı, Geyikbayırı Köyü Yolu, 07070 Konyaaltı/Antalya, Türkei"},
    {name: "Geyikbayiri su kenari Waterfall", address: "Geyikbayırı, Geyikbayırı Köyü Yolu, 07070 Konyaaltı/Antalya, Türkei"},
    {name: "Geyikbayiri su kenari Waterfall", address: "Geyikbayırı, Geyikbayırı Köyü Yolu, 07070 Konyaaltı/Antalya, Türkei"}
  ],
  [# Kochel
    {name: "Franz Marc Museum", address: "Franz Marc Park 8, 82431 Kochel am See"},
    {name: "Café und Gästehaus Landerermühle", address: "Leger 2, 83661 Lenggries"},
    {name: "Bergzeit Climbing Gear", address: "Tölzer Straße 131, 83607 Holzkirchen"},
    {name: "Bergzeit Climbing Gear", address: "Tölzer Straße 131, 83607 Holzkirchen"},
    {name: "Bergzeit Climbing Gear", address: "Tölzer Straße 131, 83607 Holzkirchen"}
  ],
  [# Weißmain-Alb
    {name: "Burg Stein", address: "Stein 1, 08118 Hartenstein"},
    {name: "Hotel Hartl's Lindenmühle", address: "Kolonnadenweg 1, 95460 Bad Berneck im Fichtelgebirge"},
    {name: "ALDI Supermarket", address: "Maintalstraße 161, 95460 Bad Berneck im Fichtelgebirge"},
    {name: "ALDI Supermarket", address: "Maintalstraße 161, 95460 Bad Berneck im Fichtelgebirge"},
    {name: "ALDI Supermarket", address: "Maintalstraße 161, 95460 Bad Berneck im Fichtelgebirge"}
  ],
  [# Oliana
    {name: "Hostal Víctor", address: "Avinguda de l'Alt Urgell, 4, 25790 Oliana, Lleida, Spanien"},
    {name: "Bar Restaurant Rebollé", address: "Avinguda de l'Alt Urgell, 88, 25790 Oliana, Lleida, Spanien"},
    {name: "Carmen Mijana Farreny Farmacy", address: "carrer Ignasi Esteve, 9, 25790 Oliana, Lleida, Spanien"},
    {name: "Carmen Mijana Farreny Farmacy", address: "carrer Ignasi Esteve, 9, 25790 Oliana, Lleida, Spanien"},
    {name: "Carmen Mijana Farreny Farmacy", address: "carrer Ignasi Esteve, 9, 25790 Oliana, Lleida, Spanien"}
  ]
]

def seed_activities(activities)
  activities.each_with_index do |activity, index|
    first_crag_id = Crag.first.id
    if Crag.find(index + first_crag_id)
      i = 0
      5.times do
        a = Activity.new(activity[i])
        a.crag_id = index + first_crag_id
        a.user_id = User.all.sample.id
        a.save!
        puts "New activity with id #{a.id} created."
        i += 1
      end
    end
  end
end

def seed_proposal(data)
  Crag.all.each_with_index do |crag, index|
    next if index > data.length - 1

    activities = data[index]
    activities.each do |activity|
      record = Activity.new(activity)
      record.crag = crag
      record.user_id = User.all.sample.id
      record.save!
      puts "New activity with id #{record.id} created."
    end
  end
end

# seed_proposal(activity_data)
seed_activities(activity_data)
