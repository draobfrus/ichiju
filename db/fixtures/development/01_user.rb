10.times do |n|
  User.create!(
    username: "テストユーザー#{n+1}",
    email: "test#{n+1}@example.com",
    password: "password",
    password_confirmation: "password"
  )
end
