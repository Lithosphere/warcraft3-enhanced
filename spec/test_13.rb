require_relative 'spec_helper'

describe Unit do 


  context "if unit/enemy_unit is dead" do

    before :each do
      @unit = Unit.new(-1, 3)
    end
  
    describe "#attack!" do
      it "should return false because the current unit is dead" do
        enemy_unit = Unit.new(40, 5)
        expect(@unit.attack!(enemy_unit)).to be(false)
      end
    end

    describe "#attack!" do
      it "should return false because the current enemy_unit is dead" do
        enemy_unit = Unit.new(-1, 5)
        expect(@unit.attack!(enemy_unit)).to be(false)
      end
    end
  end

  context "if unit is alive" do

    before :each do
      @unit = Unit.new(50, 5)
    end

    describe "#attack!" do
      it "should attack with the damage 5" do
        enemy_unit = Unit.new(10, 5)
        expect(enemy_unit).to receive(:damage).with(5)
        @unit.attack!(enemy_unit)
      end
    end
  end
end
