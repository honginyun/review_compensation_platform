require 'rails_helper'

RSpec.describe Review, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:product) }

    it { should belong_to(:reviewer) }

    it { should have_one(:compensations_by_platform) }

    it { should have_many(:likes) }

    it { should have_many(:comments) }

    it { should have_many(:tips_reviews) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
