require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'バリデーションテスト' do
    context 'ユーザー作成' do

      it 'name, emailの値が設定済みだと成功' do
        user = build(:user)
        expect(user).to be_valid
      end

      it 'nameの値が未設定だと失敗' do
        user = build(:user)
        user.name = ''
        expect(user).to_not be_valid
      end

      it 'emailの値が未設定だと失敗' do
        user = build(:user)
        user.email = ''
        expect(user).to_not be_valid
      end

      it 'emailの値がユニークだと成功' do
        user_1 = create(:user)
        user_2 = build(:user)
        expect(user_2).to be_valid
      end

      it 'emailの値がユニークでないと失敗' do
        user_1 = create(:user)
        user_2 = build(:user)
        user_2.uid = user_1.uid
        user_2.email = user_1.email
        expect(user_2).to_not be_valid  
      end

    end
  end
end