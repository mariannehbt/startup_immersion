require 'rails_helper'
require 'spec_helper'
RSpec.describe Event, type: :model do
    before(:each) do 
        @startup = FactoryBot.create(:startup)
        @event = FactoryBot.build(:event, startup: @startup)
        # startup  = FactoryBot.create(:startup )
        # event =  FactoryBot.create(:event, startup: startup )
        # @event = FactoryBot.build(:event, startup: FactoryBot.create(:startup))

    end

    it "Has a valid factory" do 
        # test les creations
        expect(build(:event)).to be_valid
    end

    context "validation" do
        
        it "is valid with attributes" do
          expect(@startup).to be_a(Startup)
          expect(@event).to be_a(Event)
        end
        
        describe "#title" do
          it { expect(@event).to validate_presence_of(:title)  }
          it { expect(@event).to validate_length_of(:title).is_at_least(1).is_at_most(140).with_message(/must be between 1 and 140 characters long/) }
        end
        describe "#start_datetime" do
          it { expect(@event).to validate_presence_of(:start_datetime) }
        end
        describe "#duration" do
          it { expect(@event).to validate_presence_of(:duration) }
        end
        describe "#description" do
          it { expect(@event).to validate_presence_of(:description)  }
          it { expect(@event).to validate_length_of(:description).is_at_least(20).is_at_most(1000).with_message(/must be between 20 and 1000 characters long/)}
        end
        describe "#short_location" do
          it { expect(@event).to validate_presence_of(:short_location) }
          it { expect(@event).to validate_length_of(:short_location).is_at_least(1).is_at_most(140).with_message(/must be between 1 and 140 characters long/) }

        end
        describe "#adress" do
          it { expect(@event).to validate_presence_of(:adress) }
          it { expect(@event).to validate_length_of(:adress).is_at_least(1).is_at_most(140).with_message(/must be between 1 and 140 characters long/) }
        end
        describe "#zip_code" do
          it { expect(@event).to validate_presence_of(:zip_code)}
          it { expect(@event).to validate_numericality_of(:zip_code).is_greater_than(9999).is_less_than(100000).with_message(/must be between 9999 and  100000/)}
          
          # it { expect(@event).to validate_numericality_of(:zip_code).is_greater_than(9999).with_message(/must be between 9999 and  100000/)
          # it { expect(@event).to validate_numericality_of(:zip_code).is_greater_than(9999).is_less_than_or_equal_to(100000).with_message(/must be between 9999 and  100000  /)}
          # it { expect(@event).to validate_numericality_of(:zip_code).is_less_than_or_equal_to(100000).with_message(/must be between 9999 and  100000  /)}
        end
        describe "#city" do
          it { expect(@event).to validate_presence_of(:city) }
          it { expect(@event).to validate_length_of(:city).is_at_least(5).is_at_most(140).with_message(/must be between 5 and 140 characters long/) }

        end

        it "should return a string" do
            expect(@event.title).to be_a(String)
            expect(@event.short_location).to be_a(String)
            expect(@event.adress).to be_a(String)
            expect(@event.zip_code).to be_a(String)
            expect(@event.city).to be_a(String)
            expect(@event.start_datetime).to be_a(Object)
          end

          it "should return a integer" do
            expect(@event.duration).to be_a(Integer)
          end

    
          it "should return the Good Value" do
            expect(@event.title).to eq("event")
            expect(@event.short_location).to eq("short location")
            expect(@event.adress).to eq("adress")
            expect(@event.zip_code).to eq("75000")
            expect(@event.city).to eq("paris")
            expect(@event.duration).to eq(30)
            expect(@event.start_datetime).to eq("2020-01-01 01:00:00")
          end

          it "should not equal the Value" do
            expect(@event.title).not_to eq("no event")
            expect(@event.short_location).not_to eq("no short location")
            expect(@event.adress).not_to eq("no adress")
            expect(@event.zip_code).not_to eq("90400")
            expect(@event.city).not_to eq("constantine")
            expect(@event.duration).not_to eq(50)
            expect(@event.start_datetime).not_to eq("2022-02-01 01:00:00")
          end
        
    end

    context "associations" do

        describe "belongs to startup" do
          it { should belong_to(:startup)  }
        
        end
        
        describe "Has_many attendances" do
            it { expect(@event).to have_many(:attendances) }
        end

        describe "Has_many users through attendances" do
            it { expect(@event).to have_many(:users).through(:attendances) }
        end     
      
    end
    
  
    context "public instance methods" do

    
      end

end