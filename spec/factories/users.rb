FactoryBot.define do
  

    factory :user do
      email {"email00@example.com" }
      password {'password'}
      first_name {'qwerty'}
      last_name {'us'}
      formation {"master"}
      description { "etudiant" }
      linked_in_url {"linked_in_url"}
       
      after(:build) do |user|
        event = create(:event)
        user.attendances << build(:attendance, user: user, event: event)
        # create_list(:events, evaluator.events_count, user: user)
      end
    end
  
end
