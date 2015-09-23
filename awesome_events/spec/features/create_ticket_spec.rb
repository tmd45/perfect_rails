require 'rails_helper'

RSpec.feature "Create ticket", type: :feature do
  describe 'ユーザがイベント参加表明をする', js: true do
    let!(:event) { create :event }

    context 'ログインユーザが、イベント詳細ページで "参加する" をクリックしたとき' do
      before do
        visit root_path
        click_link 'Twitter でログイン'
        visit event_path(event)
        click_on '参加する'
      end

      it 'コメント入力用のモーダルウィンドウが表示されていること' do
        expect(page.find('#createTicket')).to be_visible
      end

      context 'かつ、コメントを入力し "送信" ボタンをおしたとき' do
        before do
          fill_in 'ticket_comment', with: '参加します！'
          click_button '送信'
        end

        it '"このイベントに参加表明しました" と表示されていること' do
          expect(page).to have_content 'このイベントに参加表明しました'
        end
      end
    end
  end
end
