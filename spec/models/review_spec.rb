require 'rails_helper'

RSpec.describe Review, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:likes) }

    it { should have_many(:comments) }

    it { should have_many(:tips_reviews) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
