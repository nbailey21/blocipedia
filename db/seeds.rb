require 'faker'

20.times do
    User.create!(
        email: Faker::Internet.unique.email,
        password: Faker::Lorem.characters(10)
    )
    
    Wiki.create!(
        title: Faker::RickAndMorty.location,
        body: Faker::RickAndMorty.quote
    )
end