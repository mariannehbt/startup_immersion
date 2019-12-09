require 'rails_helper'
require 'spec_helper'
RSpec.describe Attendance, type: :model do
    before(:each) do 
        @attendance = FactoryBot.create(:attendance)
    end

    it "Has a valid factory" do 
        # test les creations
        expect(build(:attendance)).to be_valid
    end

    context "validation" do
      describe "#motivation" do
        it { expect(@attendance).to validate_presence_of(:motivation)  }
        it { expect(@attendance).to validate_length_of(:motivation).is_at_least(20).is_at_most(1000).with_message(/must be between 20 and 1000 characters long/)}
      end
      describe "#comment" do
        it { expect(@attendance).to validate_presence_of(:comment)  }
        it { expect(@attendance).to validate_length_of(:comment).is_at_least(20).is_at_most(1000).with_message(/must be between 20 and 1000 characters long/)}
     end

      it "should not equal the Value" do
        expect(@attendance.motivation).to eq("Motivation greater than 20 charactere")
        expect(@attendance.comment).to eq("Comment greater than 20 charactere")
      end
      it "should not equal the Value" do
        expect(@attendance.motivation).not_to eq("no Motivation greater than 20 charactere")
        expect(@attendance.comment).not_to eq("no Comment greater than 20 charactere")
      end
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