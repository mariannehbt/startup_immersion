require 'rails_helper'
RSpec.describe Attendance, type: :model do
    # let(:group) { FactoryGirl.create :group }
    before(:each) do 

        @attendance = FactoryBot.create(:attendance)
    end

    it "Has a valid factory" do 
        # test les creations
        expect(build(:attendance)).to be_valid
    end

    context "validation" do
        

    end

    context "associations" do
        describe "belongs to user" do
            it { should belong_to(:user) } 
          end
          describe "belongs to event" do
            it { should belong_to(:event) } 
          end
    end
  
    context "public instance methods" do

    
      end

end