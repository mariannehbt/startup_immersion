FactoryBot.define do
  factory :attendance do
    motivation {"Motivation greater than 20 charactere"}
    comment {"Comment greater than 20 charactere"}
    user
    event
  end
end