require 'rails_helper'
require 'spec_helper'

describe Toy do

  let(:toy) { Fabricate(:toy) }

  it "has a valid price" do
    toy.price = '33,33'
    expect { toy.save }.to change { toy.errors[:price] }.from([]).to(["is invalid"])
  end

  it "is assigned to a room" do
    toy.room = nil
    expect { toy.save }.to change { toy.errors[:room] }.from([]).to(["can't be blank"])
  end

  describe '#name' do

      it 'is present' do
        toy.name = nil
        toy.save
        expect(toy.errors[:name]).to eq(["can't be blank"])
      end

      it 'is unique' do
        another_toy = Fabricate.build(:toy, name: toy.name)
        another_toy.save
        expect(another_toy.errors[:name]).to eq(["has already been taken"])
      end

      it 'is not longer than 200 chars' do
        toy.name = "Very long name" * 20
        toy.save
        expect(toy.errors[:name]).to eq(["is too long (maximum is 200 characters)"])
      end

  end

  describe '#available_num' do

      it 'is greater that 0' do
        toy.available_num = -1
        toy.save
        expect(toy.errors[:available_num]).to eq(["must be greater than 0"])
      end

      it 'is less that 1000000' do
        toy.available_num = 1000001
        toy.save
        expect(toy.errors[:available_num]).to eq(["must be less than 1000000"])
      end

  end
  
end
