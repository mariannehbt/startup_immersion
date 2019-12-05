require 'rails_helper'
RSpec.describe Event, type: :model do
    # let(:group) { FactoryGirl.create :group }
    before(:each) do 

        # @event = FactoryBot.build(:event)
        @event = FactoryBot.build(:event, startup: @startup)
        @startup = FactoryBot.build(:startup)

       
        # byebug
    end

    it "Has a valid factory" do 
        # test les creations
        expect(build(:event)).to be_valid
        expect(build(:startup)).to be_valid
    end

    context "validation" do
        
        it "is valid with attributes" do

            expect(@startup).to be_a(Startup)
            expect(@event).to be_a(Event)
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