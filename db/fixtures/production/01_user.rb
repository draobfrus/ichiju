User.create!(
  username: "みそ汁おねいさん",
  birthplace_code: 4,
  living_place_code: 7,
  email: ENV["ADMIN_EMAIL"],
  password: ENV["ADMIN_PASSWORD"],
  password_confirmation: ENV["ADMIN_PASSWORD"],
  role: "admin"
)
