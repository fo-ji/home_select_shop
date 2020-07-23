require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    it "全て入力されていればOK" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "nicknameが空ならNG" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    it "nicknameが重複していたらNG" do
      user1 = create(:user)
      expect(build(:user, nickname: user1.nickname)).to_not be_valid
    end
    it "emailが空ならNG" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "emailが意図しない形ならNG" do
      user = build(:user, email: "aaagmail.com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end
    it "emailが重複していたらNG" do
      user1 = create(:user)
      expect(build(:user, email: user1.email)).to_not be_valid
    end
    it "passwordが空ならNG" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it "passwordが7文字よりも短ければNG" do
      user = build(:user, password: "aaa111")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end
    it "first_nameが空ならNG" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end
    it "last_nameが空ならNG" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end
    it "first_name_kanaが空ならNG" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end
    it "last_name_kanaが空ならNG" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end
    it "birthdayが空ならNG" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end
    it "heightが空ならNG" do
      user = build(:user, height: nil)
      user.valid?
      expect(user.errors[:height]).to include("を入力してください")
    end
    it "heightが1ケタならNG" do
      user = build(:user, height: "9")
      user.valid?
      expect(user.errors[:height]).to include("は2文字以上で入力してください")
    end
    it "heightが4ケタならNG" do
      user = build(:user, height: "1609")
      user.valid?
      expect(user.errors[:height]).to include("は3文字以内で入力してください")
    end
    it "body_weightが空ならNG" do
      user = build(:user, body_weight: nil)
      user.valid?
      expect(user.errors[:body_weight]).to include("を入力してください")
    end
    it "body_weightが1ケタならNG" do
      user = build(:user, body_weight: "9")
      user.valid?
      expect(user.errors[:body_weight]).to include("は2文字以上で入力してください")
    end
    it "body_weightが4ケタならNG" do
      user = build(:user, body_weight: "1609")
      user.valid?
      expect(user.errors[:body_weight]).to include("は3文字以内で入力してください")
    end
    it "foot_sizeが空ならNG" do
      user = build(:user, foot_size: nil)
      user.valid?
      expect(user.errors[:foot_size]).to include("を入力してください")
    end
  end
end
