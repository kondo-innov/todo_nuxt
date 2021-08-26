require 'rails_helper'

RSpec.describe Event, type: :model do

  describe "バリデーションテスト" do
    context "投稿作成時" do

      it '全ての値が設定済みだと成功' do
        event = build(:event)
        expect(event).to be_valid
      end

      it 'eventnameの値が未設定だと失敗' do
        event = build(:event)
        event.eventname = ''
        expect(event).to_not be_valid
      end

      it 'datetimeの値が未設定だと失敗' do
        event = build(:event)
        event.datetime = ''
        expect(event).to_not be_valid
      end

      it 'citywardの値が未設定だと失敗' do
        event = build(:event)
        event.cityward = ''
        expect(event).to_not be_valid
      end

      it 'streetaddressの値が未設定だと失敗' do
        event = build(:event)
        event.streetaddress = ''
        expect(event).to_not be_valid
      end

      it 'descriptionの値が未設定だと失敗' do
        event = build(:event)
        event.description = ''
        expect(event).to_not be_valid
      end

      it '1000文字以内なら成功' do
        event = build(:event)
        event.description = "1000以下"
        expect(event).to be_valid
      end

      it '1000文字以上なら失敗' do
        event = build(:event)
        description = "1000以下" * 1000
        event.description = description
        expect(event).to_not be_valid
      end
    end
  end

end
