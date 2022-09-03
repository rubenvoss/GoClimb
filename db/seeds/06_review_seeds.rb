user_id = User.all.sample.id

reviews_data = [
  [
    {rating: 5, comment: "Showed me the most interesting route", user_id: user_id},
    {rating: 3, comment: "Friendly, but not very responsive over the app", user_id: user_id}
  ],
  [
    {rating: 4, comment: "Good belayer", user_id: user_id},
    {rating: 3, comment: "Nice, but always late...", user_id: user_id}
  ],
  [
    {rating: 5, comment: "Great technique and good coach", user_id: user_id},
    {rating: 3, comment: "Special kind of humour", user_id: user_id}
  ],
  [
    {rating: 5, comment: "Best pancakes!", user_id: user_id},
    {rating: 5, comment: "Responsible and trustworthy", user_id: user_id},
  ],
  [
    {rating: 5, comment: "Nothing to complain about", user_id: user_id},
    {rating: 1, comment: "Didn't show up", user_id: user_id},
  ],
  [
    {rating: 5, comment: "Knows the best cafe in town", user_id: user_id},
    {rating: 5, comment: "Picked me up by car", user_id: user_id},
  ],
  [
    {rating: 5, comment: "Great guest bed", user_id: user_id},
    {rating: 5, comment: "Great host", user_id: user_id},
  ],
  [
    {rating: 2, comment: "Didn't tell me about the cat in advance", user_id: user_id},
    {rating: 5, comment: "Friendly cat", user_id: user_id},
  ],
  [
    {rating: 5, comment: "Knows how to cheer you up", user_id: user_id},
    {rating: 5, comment: "Borrowed me some gear", user_id: user_id},
  ],
  [
    {rating: 2, comment: "We didn't match very well", user_id: user_id},
    {rating: 5, comment: "Direct and efficient communicator", user_id: user_id},
  ],
  [
    {rating: 1, comment: "No previous climbing experience whatsoever", user_id: user_id},
    {rating: 1, comment: "Kept on calling me after our trip", user_id: user_id},
  ]
]

def seed_reviews(reviews, n)
  Profile.all.each_with_index do |profile, index|
    if Profile.find(index + n)
      r = Review.new(reviews[0])
      r.profile_id = profile.id
      r.save!
      puts "New review with id #{r.id} created."
      s = Review.new(reviews[1])
      s.profile_id = profile.id
      s.save!
      puts "New review with id #{s.id} created."
    end
  end
end

seed_reviews(reviews_data, 1)
