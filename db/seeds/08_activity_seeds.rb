activity_data = [
  [# Margalef
    {name: "Accommodation in Margalef On Sight", lat: 41.28475435204124, long: 0.7548767099402085},
    {name: "Margalef Beer", lat: 41.285758072466976, long: 0.7513254655231684},
    {name: "La Botiga Supermarket", lat: 41.284516520440846, long: 0.7546353111505305},
    {name: "Cal Bruno", lat: 41.28510505129424, long: 0.7545387516346593},
    {name: "Cafe Vernet", lat: 41.28465357604522, long: 0.7535731564759476}
  ],
  [# Siurana
    {name: "Viewpoint El Balcó de Siurana", lat: 41.25721212522358, long: 0.9302155672044444},
    {name: "Santa Maria Church", lat: 41.25772024819562, long: 0.9321574863569647},
    {name: "Restaurant Siurana", lat: 41.25816384438382, long: 0.9326080974310302},
    {name: "Restaurant Siurana", lat: 41.25816384438382, long: 0.9326080974310302},
    {name: "Restaurant Siurana", lat: 41.25816384438382, long: 0.9326080974310302}
  ],
  [# Oberammergau
    {name: "Schleifmühlklamm Waterfall", lat: 47.61027530593548, long: 11.016791967612544},
    {name: "Kolbensesselbahn Chairlift", lat: 47.59985866429959, long: 11.048720980860615},
    {name: "Camping Oberammergau", lat: 47.592797316636876, long: 11.06760373063098},
    {name: "Klosterhotel Ettal Ludwig der Bayer", lat: 47.571144295894875, long: 11.0926662894171},
    {name: "Restaurant Ettaler Mühle", lat: 47.57026535689869, long: 11.07457176674148}
  ],
  [# Geyikbayiyri
    {name: "Pan Camping &Hotel", lat: 36.876811307969, long: 30.47217174089902},
    {name: "Josito Resort", lat: 36.874751530149744, long: 30.483415560080463},
    {name: "Geyikbayiri su kenari Waterfall", lat: 36.8764336861939, long: 30.465476947798617},
    {name: "Geyikbayiri su kenari Waterfall", lat: 36.8764336861939, long: 30.465476947798617},
    {name: "Geyikbayiri su kenari Waterfall", lat: 36.8764336861939, long: 30.465476947798617}
  ],
  [# Kochel
    {name: "Franz Marc Museum", lat: 47.65487903293675, long: 11.3655317767997},
    {name: "Café und Gästehaus Landerermühle", lat: 47.643546043318054, long: 11.604141083647736},
    {name: "Bergzeit Climbing Gear", lat: 47.791936439166896, long: 11.731485674579304},
    {name: "Bergzeit Climbing Gear", lat: 47.791936439166896, long: 11.731485674579304},
    {name: "Bergzeit Climbing Gear", lat: 47.791936439166896, long: 11.731485674579304}
  ],
  [# Weißmain-Alb
    {name: "Burg Stein", lat: 50.0645273766788, long: 11.702539949245134},
    {name: "Hotel Hartl's Lindenmühle", lat: 50.0527352084049, long: 11.677134067735917},
    {name: "ALDI Supermarket", lat: 50.03934152125124, long: 11.679108178777557},
    {name: "ALDI Supermarket", lat: 50.03934152125124, long: 11.679108178777557},
    {name: "ALDI Supermarket", lat: 50.03934152125124, long: 11.679108178777557}
  ],
  [# Oliana
    {name: "Hostal Víctor", lat: 42.06753890067664, long: 1.3137037219369154},
    {name: "Bar Restaurant Rebollé", lat: 42.07107508941453, long: 1.311922735310847},
    {name: "Carmen Mijana Farreny Farmacy", lat: 42.06825571160916, long: 1.3142830790321425},
    {name: "Carmen Mijana Farreny Farmacy", lat: 42.06825571160916, long: 1.3142830790321425},
    {name: "Carmen Mijana Farreny Farmacy", lat: 42.06825571160916, long: 1.3142830790321425}
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
