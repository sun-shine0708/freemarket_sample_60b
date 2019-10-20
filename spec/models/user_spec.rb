require 'rails_helper'

describe User do
  describe '#create' do
    # name,name_kana,nickname,email,password,password_confirmation,birthday,comment,が存在すれば登録できること
    it "is valid with a name, name_kana, nickname, email, password, password_confirmation, birthday, comment" do
      user = build(:user)
      expect(user).to be_valid
    end

    # last_nameが空では登録できないこと
    it "is invalid without a last_name" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end

    # first_nameが空では登録できないこと
    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    # first_name_kanaが空では登録できないこと
    it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    # last_name_kanaが空では登録できないこと
    it "is invalid without a last_name_kana" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end

    # nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    # emailが空では登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    # passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    # passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    # birth_yearが空では登録できないこと
    it "is invalid without a birth_year" do
      user = build(:user, birth_year: nil)
      user.valid?
      expect(user.errors[:birth_year]).to include("を入力してください")
    end

    # birth_monthが空では登録できないこと
    it "is invalid without a birth_month" do
      user = build(:user, birth_month: nil)
      user.valid?
      expect(user.errors[:birth_month]).to include("を入力してください")
    end

    # birth_dayが空では登録できないこと
    it "is invalid without a birth_day" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end

     # phone_numberが空では登録できないこと
     it "is invalid without a phone_number" do
      user = build(:user, phone_number: nil)
      user.valid?
      expect(user.errors[:phone_number]).to include("を入力してください")
    end

    # nicknameが20文字以上であれば登録できないこと
    it "is invalid with a nickname that has more than 20 characters " do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname][0]).to include("は20文字以内で入力してください")
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
      expect(another_user.errors[:nickname]).to include("はすでに存在します")
    end

    # 重複したemailが存在すること
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
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
      expect(user.errors[:password][0]).to include("は7文字以上で入力してください")
    end
  end
end