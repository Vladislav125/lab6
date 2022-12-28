# frozen_string_literal: true

require_relative 'part2'

RSpec.describe CountSumEnumerable do
  describe 'class for testing part2.rb' do
    it 'should be good value' do
      expect(described_class.count_sum(1e-3)).to eq([79, 1.0008210684654542])
      expect(described_class.count_sum(1e-4)).to eq([156, 1.0000753702657061])
    end
  end
end