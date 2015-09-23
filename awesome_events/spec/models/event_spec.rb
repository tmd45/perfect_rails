require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validation' do
    describe '#name' do
      it { should validate_presence_of(:name) }
      it { should validate_length_of(:name).is_at_most(50) }
    end
  end

  describe '#created_by?' do
    let(:event) { create(:event) }
    subject { event.created_by?(user) }

    context 'has parameter is nil' do
      let(:user) { nil }
      it { should be_falsey }
    end

    context "has #owner_id same parameter#id" do
      let(:user) { double('user', id: event.owner_id) }
      it { should be_truthy }
    end
  end

  describe '#rails?' do
    context 'when #name is "Rails勉強会"' do
      it 'is true' do
        event = create(:event, name: 'Rails勉強会')
        expect(event.rails?).to be_truthy
      end
    end

    context 'when #name is "Ruby勉強会"' do
      it 'is false' do
        event = create(:event, name: 'Ruby勉強会')
        expect(event.rails?).to be_falsey
      end
    end
  end
end
