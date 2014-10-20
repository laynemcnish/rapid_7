require 'spec_helper'

describe Rapid7 do

  before do
    @array = Rapid7.new
  end

  it "original function should return an empty array if given an empty array to start" do
    expect(@array.function([])).to eq([])
  end

  it "original function should return an empty array when given an array that has only unique values" do
    expect(@array.function([1,2,3]).sort).to eq([])
  end

  it "original function should return the values with duplicates when given an array with duplicated values" do
    expect(@array.function([1,1,2,2,3,3,4,5,6].sort)).to eq([1,2,3])
  end

  it "original function should return the values with duplicates when given an unordered array with duplicated values" do
    expect(@array.function([3,1,2,3,4,5,1,6,2].sort)).to eq([1,2,3])
  end
end
