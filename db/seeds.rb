# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
10.times do |n|
  User.create!(
    username: "テストユーザー#{n+1}",
    email: "test#{n+1}@example.com",
    password: "password",
    password_confirmation: "password"
  )
end

User.all.each do |user|
  Post.create!(
    user_id: user.id,
    title: "タイトル#{user.id}",
    content: "本文#{user.id}",
    image: File.open("./app/assets/images/misosoup.png")
  )
end
