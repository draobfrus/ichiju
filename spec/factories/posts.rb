FactoryBot.define do
  factory :post do
    title { "MyString" }
    image { "MyString" }
    content { "MyText" }
    user { nil }
  end
end
