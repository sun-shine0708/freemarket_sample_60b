require 'rails_helper'

describe Image do
  describe '#create' do
    # urlが空では登録できないこと
    it "is invalid without a url" do
      image = build(:image, url: nil)
      image.valid?
      expect(image.errors[:url]).to include("を入力してください")
    end
  end
end