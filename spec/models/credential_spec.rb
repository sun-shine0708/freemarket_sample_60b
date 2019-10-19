require 'rails_helper'

describe Credential do
  describe '#create' do
    # uidが空では登録できないこと
    it "uidが空では登録できないこと" do
      credential = build(:credential, uid: nil)
      credential.valid?
      expect(credential.errors[:uid]).to include("を入力してください")
    end

    # providerが空では登録できないこと
    it "providerが空では登録できないこと" do
      credential = build(:credential, provider: nil)
      credential.valid?
      expect(credential.errors[:provider]).to include("を入力してください")
    end
  end
end