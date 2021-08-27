require 'rails_helper'

RSpec.describe EventComment, type: :model do

  describe 'バリデーションテスト' do
    context 'イベント詳細閲覧時' do

      it 'contentの値が設定済みだと成功' do
        event_comment = build(:event_comment)
        expect(event_comment).to be_valid
      end

      it 'contentの値が未設定だと失敗' do
        event_comment = build(:event_comment)
        event_comment.content = ''
        expect(event_comment).to_not be_valid
      end

      it '100文字以内なら成功' do
        event_comment = build(:event_comment)
        event_comment.content = "100以下"
        expect(event_comment).to be_valid
      end

      it '100文字以上なら失敗' do
        event_comment = build(:event_comment)
        content = "100以下" * 100
        event_comment.content = content
        expect(event_comment).to_not be_valid
      end
    end
  end

end
