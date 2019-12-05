FactoryBot.define do
  
factory :startup do
    name {"startup"}
    catch_phrase {"catch_phrase"}
    website_url {"website_url"}
    description {"description"}
    # after(:build) do |startup|
    #   startup.events << build(:event, startup: startup)
    #   # FactoryBot.build(:event, startup: startup)
    # end
  end
end