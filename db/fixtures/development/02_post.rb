50.times do
  Post.seed do |s|
    s.title = Faker::Games::Pokemon.name
    s.content = Faker::Games::Pokemon.move
    s.image = File.open("./app/assets/images/misosoup.png")
    s.user_id = 1
  end
end
