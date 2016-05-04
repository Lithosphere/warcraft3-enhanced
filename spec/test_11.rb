require_relative 'spec_helper'


describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  describe "#damage" do
    it "should take damage to the barracks based on the appropriate attack power passed" do
      @barracks.damage(12)
      expect(@barracks.health_points).to eq(488)
    end
  end
end

describe Footman do

  before :each do
    @Footman = Footman.new
  end

  describe "#attack!" do
    it "should deal damage to the barracks based on the appropriate attack power passed" do
      enemy_barracks = Barracks.new
      expect(enemy_barracks).to receive(:damage)
      @Footman.attack!(enemy_barracks)
    end
  end
end