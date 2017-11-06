FactoryBot.define do
  factory :wiki do
    title "New Wiki Title"
    body "Wiki Body for days"
    private false
    user
  end
end
