require 'rails_helper'

RSpec.describe VoteComment, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:comment) }

    it { should belong_to(:voter) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
