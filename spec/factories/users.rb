FactoryBot.define do
    factory :user do
      email { Faker::Internet.email }
      password {Faker::Internet.password}
    #   encrypted_password { Faker::Internet.encrypted_password }
    end
  end