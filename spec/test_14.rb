#tests enhancement 4

require_relative 'spec_helper'

describe Barracks do 

  before :each do
    @barracks = Barracks.new
  end

      it "should return lumber at 500 at start of creation" do
        
        expect(@barracks.lumber).to eq(500)
      end

end