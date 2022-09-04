reviews_data = [
  [
    {rating: 5, comment: "Showed me the most interesting route"},
    {rating: 3, comment: "Friendly, but not very responsive over the app"}
  ],
  [
    {rating: 4, comment: "Good belayer"},
    {rating: 3, comment: "Nice, but always late..."}
  ],
  [
    {rating: 5, comment: "Great technique and good coach"},
    {rating: 3, comment: "Special kind of humour"}
  ],
  [
    {rating: 5, comment: "Best pancakes!"},
    {rating: 5, comment: "Responsible and trustworthy"},
  ],
  [
    {rating: 5, comment: "Nothing to complain about"},
    {rating: 1, comment: "Didn't show up"},
  ],
  [
    {rating: 5, comment: "Knows the best cafe in town"},
    {rating: 5, comment: "Picked me up by car"},
  ],
  [
    {rating: 5, comment: "Great guest bed"},
    {rating: 5, comment: "Great host"},
  ],
  [
    {rating: 2, comment: "Didn't tell me about the cat in advance"},
    {rating: 5, comment: "Friendly cat"},
  ],
  [
    {rating: 5, comment: "Knows how to cheer you up"},
    {rating: 5, comment: "Borrowed me some gear"},
  ],
  [
    {rating: 2, comment: "We didn't match very well"},
    {rating: 5, comment: "Direct and efficient communicator"},
  ],
  [
    {rating: 1, comment: "No previous climbing experience whatsoever"},
    {rating: 1, comment: "Kept on calling me after our trip"},
  ]
]

def seed_reviews(reviews)
  reviews.each_with_index do |review, index|
    first_profile_id = Profile.first.id
    if Profile.find(index + first_profile_id)
      r = Review.new(review[0])
      r.profile_id = index + first_profile_id
      r.user_id = User.all.sample.id
      r.save!
      puts "New review with id #{r.id} created."
      s = Review.new(review[1])
      s.profile_id = index + first_profile_id
      s.user_id = User.all.sample.id
      s.save!
      puts "New review with id #{s.id} created."
    end
  end
end

seed_reviews(reviews_data)
