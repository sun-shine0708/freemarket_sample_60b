require 'rails_helper'

describe User do
  describe '#create' do
    # name,name_kana,nickname,email,password,password_confirmation,birthday,comment,が存在すれば登録できること
    it "is valid with a name, name_kana, nickname, email, password, password_confirmation, birthday, comment" do
      user = build(:user)
      expect(user).to be_valid
    end

    # nameが空では登録できないこと
    it "is invalid without a name" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    # name_kanaが空では登録できないこと
    it "is invalid without a name_kana" do
      user = build(:user, name_kana: nil)
      user.valid?
      expect(user.errors[:name_kana]).to include("can't be blank")
    end

    # nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # emailが空では登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # birthdayが空では登録できないこと
    it "is invalid without a birthday" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    # commentが空では登録できないこと
    it "is invalid without a comment" do
      user = build(:user, comment: nil)
      user.valid?
      expect(user.errors[:comment]).to include("can't be blank")
    end

    # nicknameが20文字以上であれば登録できないこと
    it "is invalid with a nickname that has more than 20 characters " do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname][0]).to include("is too long")
    end

    # nicknameが19文字以下では登録できること
    it "is valid with a nickname that has less than 19 characters " do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaa")
      expect(user).to be_valid
    end

    # 重複しnicknameが存在する場合登録できないこと
    it "is invalid with a duplicate nickname address" do
      user = create(:user)
      another_user = build(:user, nickname: user.nickname)
      another_user.valid?
      expect(another_user.errors[:nickname]).to include("has already been taken")
    end

    # 重複したemailが存在すること
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # passwordが7文字以上であれば登録できること
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    # passwordが6文字以下であれば登録できないこと
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end
  end
end