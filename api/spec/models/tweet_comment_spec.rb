require 'rails_helper'

RSpec.describe TweetComment, type: :model do

  describe 'バリデーションテスト' do
    context 'つぶやき時' do

      it 'contentの値が設定済みだと成功' do
        tweet_comment = build(:tweet_comment)
        expect(tweet_comment).to be_valid
      end

      it 'contentの値が未設定だと失敗' do
        tweet_comment = build(:tweet_comment)
        tweet_comment.content = ''
        expect(tweet_comment).to_not be_valid
      end

      it '100文字以内なら成功' do
        tweet_comment = build(:tweet_comment)
        tweet_comment.content = "100以下"
        expect(tweet_comment).to be_valid
      end

      it '100文字以上なら失敗' do
        tweet_comment = build(:tweet_comment)
        content = "100以下" * 100
        tweet_comment.content = content
        expect(tweet_comment).to_not be_valid
      end
    end
  end

end
