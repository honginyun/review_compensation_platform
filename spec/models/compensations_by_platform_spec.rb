require 'rails_helper'

RSpec.describe CompensationsByPlatform, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:review) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
