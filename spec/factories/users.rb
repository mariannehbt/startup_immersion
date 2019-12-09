FactoryBot.define do
  

    factory :user do
      email   {"email01@example.com" }
      password {'password'}
      password_confirmation { "password" }
      first_name {'qwerty'}
      last_name {'us'}
      formation {"master"}
      description { "etudiant" }
      linked_in_url {"linked_in_url"}
       
      after(:build) do |user|
        event = create(:event)
        user.attendances << build(:attendance, user: user, event: event)
      end
     
    end
  
end
