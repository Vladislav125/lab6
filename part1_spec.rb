# frozen_string_literal: true

require_relative 'part1'

RSpec.describe CountSum do
  describe 'class for testing part1.rb' do
    it 'should be good value' do
      expect(described_class.sum(1e-3)).to eq([1.0008210684654542, 79])
      expect(described_class.sum(1e-4)).to eq([1.0000753702657061, 156])
    end
  end
end