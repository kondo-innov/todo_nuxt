require 'rails_helper'

RSpec.describe Tweet, type: :model do

  describe "バリデーションテスト" do
    context "投稿作成時" do

      it 'descriptionの値が設定済みだと成功' do
        tweet = build(:tweet)
        expect(tweet).to be_valid
      end

      it 'descriptionの値が未設定だと失敗' do
        tweet = build(:tweet)
        tweet.description = ''
        expect(tweet).to_not be_valid
      end

      it '100文字以内なら成功' do
        tweet = build(:tweet)
        tweet.description = "100以下"
        expect(tweet).to be_valid
      end

      it '100文字以上なら失敗' do
        tweet = build(:tweet)
        description = "100以下" * 100
        tweet.description = description
        expect(tweet).to_not be_valid
      end
    end
  end

end
