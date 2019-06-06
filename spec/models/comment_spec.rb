require 'rails_helper'

RSpec.describe Comment, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:vote_comments) }

    it { should belong_to(:commenter) }

    it { should belong_to(:review) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
