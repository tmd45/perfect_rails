require 'rails_helper'

RSpec.describe "events/show", type: :view do
  context '未ログインユーザがアクセスしたとき' do
    before do
      def view.logged_in?
        raise 'Stub #logged_in? if you want to test the behavior.'
      end

      def view.current_user
        raise 'Stub #current_user if you want to test the behavior.'
      end

      allow(view).to receive(:logged_in?) { false }
      allow(view).to receive(:current_user) { nil }
    end

    context 'かつ @event.owner が nil のとき' do
      before do
        assign(:event, create(:event, owner: nil))
        assign(:tickets, [])
      end

      it '"退会したユーザです" と表示されていること' do
        render
        expect(rendered).to match /退会したユーザです/
      end
    end
  end
end
