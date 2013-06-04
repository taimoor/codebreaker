require 'spec_helper'

module Codebreaker
  describe Marker do
    describe '#exact_match_count' do
      context 'with no matches' do
        it 'returns 0' do
          marker = Marker.new('1234', '4321')
          marker.exact_match_count.should be 0
        end
      end
      context 'with 1 exact matches' do
        it 'returns 1' do
          marker = Marker.new('1234', '1321')
          marker.exact_match_count.should be 1
        end
      end
      context 'with 1 number matches' do
        it 'returns 0' do
          marker = Marker.new('1234', '5647')
          marker.exact_match_count.should be 0
        end
      end
      context 'with 1 exact and 1 number matches' do
        it 'returns 1' do
          marker = Marker.new('1234', '5247')
          marker.exact_match_count.should be 1
        end
      end
    end

    describe '#number_match_count' do
      context 'with no match' do
        it 'returns 0' do
            marker = Marker.new('1234', '7890')
            marker.number_match_count.should be 0
        end
      end

      context 'with 1 number match' do
        it 'returns 1' do
            marker = Marker.new('1234', '2567')
            marker.number_match_count.should be 1
        end
      end

      context 'with 1 exact and 1 number match' do
        it 'returns 2' do
            marker = Marker.new('1234', '4267')
            marker.number_match_count.should be 1
        end
      end

      context 'with 1 exact match' do
        it 'returns 0' do
            marker = Marker.new('1234', '8267')
            marker.number_match_count.should be 0
        end
      end
    end
  end
end