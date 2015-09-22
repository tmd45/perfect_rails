require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#name' do
    context 'has nil' do
      let(:event) { Event.new(name: nil) }

      it 'is invalid' do
        event.valid?
        expect(event.errors[:name]).to be_present
      end
    end

    context 'has blank' do
      let(:event) { Event.new(name: '') }

      it 'is invalid' do
        event.valid?
        expect(event.errors[:name]).to be_present
      end
    end

    context 'has "Rails勉強会"' do
      let(:event) { Event.new(name: 'Rails勉強会') }

      it 'is valid' do
        event.valid?
        expect(event.errors[:name]).to be_blank
      end
    end

    context 'has 50 characters' do
      let(:event) { Event.new(name: 'a' * 50) }

      it 'is valid' do
        event.valid?
        expect(event.errors[:name]).to be_blank
      end
    end

    context 'has 51 characters' do
      let(:event) { Event.new(name: 'a' * 51) }

      it 'is invalid' do
        event.valid?
        expect(event.errors[:name]).to be_present
      end
    end
  end
end
