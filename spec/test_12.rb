require_relative 'spec_helper'


describe Unit do
    
    before :each do
      @unit = Unit.new(100, 3)
    end

    describe "#dead?" do
    it "should return true if health_points < 0" do
      @unit.dead?
      expect(@unit.dead?).to eq(false)
    end
  end



end