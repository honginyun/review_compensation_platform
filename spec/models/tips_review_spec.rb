require 'rails_helper'

RSpec.describe TipsReview, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:review) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
