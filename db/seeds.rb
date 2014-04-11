100.times do
  user = User.create(username: Faker::Internet.user_name)
  
  50.times do 
    post = user.posts.create(title: Faker::Company.catch_phrase, body: Faker::Lorem.paragraphs(rand(4) + 4).to_sentence)
    5.times do
      post.comments.create(body: Faker::Lorem.sentence, user_id: User.order("RANDOM()").first.id)
    end
  end
end