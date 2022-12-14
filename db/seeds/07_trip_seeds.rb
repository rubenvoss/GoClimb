trips_data = [
  {
    crag: Crag.where(name: "Mallorca, Spain")[0],
    start_date: Date.new(2022, 12, 10),
    end_date: Date.new(2022, 12, 30),
    user: Profile.where(name: "Ruben")[0].user
  },
  # {
  #   crag: Crag.where(name: "Margalef, Spain")[0],
  #   start_date: Date.new(2021, 9, 20),
  #   end_date: Date.new(2021, 9, 30),
  #   user: Profile.where(name: "Jasmien")[0].user
  # },
  {
    crag: Crag.where(name: "Oberammergau, Germany")[0],
    start_date: Date.new(2022, 9, 20),
    end_date: Date.new(2022, 9, 30),
    user: Profile.where(name: "Max")[0].user
  },
  # {
  #   crag: Crag.where(name: "Margalef, Spain")[0],
  #   start_date: Date.new(2020, 9, 20),
  #   end_date: Date.new(2020, 9, 30),
  #   user: Profile.where(name: "Theo")[0].user
  # },
  # {
  #   crag: Crag.where(name: "Margalef, Spain")[0],
  #   start_date: Date.new(2021, 9, 20),
  #   end_date: Date.new(2021, 9, 30),
  #   user: Profile.where(name: "Martin")[0].user
  # },
  # {
  #   crag: Crag.where(name: "Margalef, Spain")[0],
  #   start_date: Date.new(2021, 9, 20),
  #   end_date: Date.new(2021, 9, 30),
  #   user: Profile.where(name: "Connor")[0].user
  # },
  {
    crag: Crag.where(name: "Oberammergau, Germany")[0],
    start_date: Date.new(2022, 9, 20),
    end_date: Date.new(2022, 9, 25),
    user: Profile.where(name: "Marie")[0].user
  },
  # {
  #   crag: Crag.where(name: "Margalef, Spain")[0],
  #   start_date: Date.new(2021, 9, 20),
  #   end_date: Date.new(2021, 9, 30),
  #   user: Profile.where(name: "Anna")[0].user
  # },
  # {
  #   crag: Crag.where(name: "Margalef, Spain")[0],
  #   start_date: Date.new(2021, 9, 20),
  #   end_date: Date.new(2021, 9, 30),
  #   user: Profile.where(name: "Carla")[0].user
  # },
  # {
  #   crag: Crag.where(name: "Margalef, Spain")[0],
  #   start_date: Date.new(2022, 1, 1),
  #   end_date: Date.new(2022, 12, 30),
  #   user: Profile.where(name: "Shannon")[0].user
  # },
  # {
  #   crag: Crag.where(name: "Margalef, Spain")[0],
  #   start_date: Date.new(2022, 9, 20),
  #   end_date: Date.new(2022, 9, 30),
  #   user: Profile.where(name: "Alice")[0].user
  # }
]

def seed_trips(trips_data)
  puts "seeding trips..."
  trips_data.each do |trip_data|
    trip = Trip.new(start_date: trip_data[:start_date],
                    end_date: trip_data[:end_date], crag: trip_data[:crag],
                    user: trip_data[:user])
    trip.save!
    puts "trip with id #{trip.id} created"
  end
end

seed_trips(trips_data)
