FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence  }
    content { Faker::Lorem.paragraphs(number: 3).join("\n") }
    author
  end
end
