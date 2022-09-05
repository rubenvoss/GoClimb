activity_data = [
  [
    {comment: "Showed me the most interesting route"},
    {comment: "Friendly, but not very responsive over the app"}
  ],
  [
    {comment: "Good belayer"},
    {comment: "Nice, but always late..."}
  ],
  [
    {comment: "Great technique and good coach"},
    {comment: "Special kind of humour"}
  ],
  [
    {comment: "Best pancakes!"},
    {comment: "Responsible and trustworthy"},
  ],
  [
    {comment: "Nothing to complain about"},
    {comment: "Didn't show up"},
  ],
  [
    {comment: "Knows the best cafe in town"},
    {comment: "Picked me up by car"},
  ],
  [
    {comment: "Great guest bed"},
    {comment: "Great host"},
  ],
  [
    {comment: "Didn't tell me about the cat in advance"},
    {comment: "Friendly cat"},
  ],
  [
    {comment: "Knows how to cheer you up"},
    {comment: "Borrowed me some gear"},
  ],
  [
    {comment: "We didn't match very well"},
    {comment: "Direct and efficient communicator"},
  ],
  [
    {comment: "No previous climbing experience whatsoever"},
    {comment: "Kept on calling me after our trip"},
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
