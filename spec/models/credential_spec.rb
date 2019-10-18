require 'spec_helper'

describe Credential do
  # uidが空では登録できないこと
  it "uidが空では登録できないこと" do
    credential = build(:credential, uid: nil)
    credential.valid?
    expect(credential.errors[:uid]).to include("can't be blank")
  end

  # providerが空では登録できないこと
  it "providerが空では登録できないこと" do
    credential = build(:credential, provider: nil)
    credential.valid?
    expect(credential.errors[:provider]).to include("can't be blank")
  end
end