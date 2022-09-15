reviews_data = [
  [
    {stars: 5, comment: "Great technique and good coach"},
    {stars: 5, comment: "Responsible and trustworthy"}
  ],
  [
    {stars: 4, comment: "Good belayer"},
    {stars: 4, comment: "Nice, but always late..."}
  ],
  [
    {stars: 5, comment: "Showed me the most interesting route"},
    {stars: 4, comment: "Friendly, but not very responsive over the app"}
  ],
  [
    {stars: 5, comment: "Best pancakes!"},
    {stars: 5, comment: "Responsible and trustworthy"},
  ],
  [
    {stars: 5, comment: "Nothing to complain about"},
    {stars: 1, comment: "Didn't show up"},
  ],
  [
    {stars: 5, comment: "Knows the best cafe in town"},
    {stars: 5, comment: "Picked me up by car"},
  ],
  [
    {stars: 4, comment: "Great guest bed"},
    {stars: 5, comment: "Great host"},
  ],
  [
    {stars: 3, comment: "Didn't tell me about the cat in advance"},
    {stars: 5, comment: "Friendly cat"},
  ],
  [
    {stars: 5, comment: "Knows how to cheer you up"},
    {stars: 5, comment: "Borrowed me some gear"},
  ],
  [
    {stars: 3, comment: "We didn't match very well"},
    {stars: 4, comment: "Direct and efficient communicator"},
  ],
  [
    {stars: 2, comment: "No previous climbing experience whatsoever"},
    {stars: 1, comment: "Kept on calling me after our trip"},
  ]
]

def seed_reviews(reviews)
  reviews.each_with_index do |review, index|
    first_profile_id = Profile.first.id
    if Profile.find(index + first_profile_id)
      r = Review.new(review[0])
      r.profile_id = index + first_profile_id
      r.user = User.where(email: "user@user2.com")[0]
      r.save!
      puts "New review with id #{r.id} created."
      s = Review.new(review[1])
      s.profile_id = index + first_profile_id
      s.user = User.where(email: "user@user5.com")[0]
      s.save!
      puts "New review with id #{s.id} created."
    end
  end
end

seed_reviews(reviews_data)
