require_relative 'spec_helper'

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end
  describe "#train_siege_engine" do
    it "should initialize a new instance of the SiegeEngine Class" do
      @barracks.train_siege_engine
      expect(@barracks.train_siege_engine).to be_a(SiegeEngine)
    end
  end
end

describe SiegeEngine do

  before :each do
    @siege_engine = SiegeEngine.new
  end

  describe "#attack!" do
    it "should attack barracks with 2x the attack_power" do
      @barracks = Barracks.new
      double_attack = 2 * @siege_engine.attack_power
      barracks_health = @barracks.health_points - double_attack
      expect(@barracks).to receive(:damage).with(double_attack).and_call_original
      @siege_engine.attack!(@barracks)
      expect(@barracks.health_points).to eq(barracks_health)
    end

    it "should not be able to attack units" do
      @unit = Unit.new(50, 10)
      current_unit_health = @unit.health_points
      @siege_engine.attack!(@unit)
      expect(@unit.health_points).to be(current_unit_health)
      expect(@siege_engine.attack!(@unit)).to be(false)
    end

    it "should still be able to attack other siege_engine" do
      @enemy_siege_engine = SiegeEngine.new
      normal_attack = @siege_engine.attack_power
      siege_engine_health = @enemy_siege_engine.health_points - normal_attack
      expect(@enemy_siege_engine).to receive(:damage).with(normal_attack).and_call_original
      @siege_engine.attack!(@enemy_siege_engine)
      expect(@siege_engine.attack!(@siege_engine)).to eq(siege_engine_health)
    end
  end
end