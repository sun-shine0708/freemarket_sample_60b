require 'rails_helper'

describe Product do
  describe '#create' do
    # name, comment, price, status, costcharge, delivery_way, delivery_area, delivery_date が存在すれば登録できること
    it "is valid with a name, comment, price, status, costcharge, delivery_way, delivery_area, delivery_date" do
      product = build(:product)
      expect(product).to be_valid
    end

    # imageが空では出品できないこと



    # imageが10枚内であれば出品できること



    # imageが11枚以上であれば出品できないこと



    # nameが空では出品できないこと
    it "is invalid without a name" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    # nameが10文字以内であれば出品できること
    it "is valid with a name that has less than 20 characters " do
      product = build(:product, name: "aaaaaaaaaaaaaaaaaaaa")
      expect(product).to be_valid
    end

    # nameが11文字以上であれば出品できないこと
    it "is invalid with a name that has more than 21 characters " do
      product = build(:product, name: "aaaaaaaaaaaaaaaaaaaaa")
      product.valid?
      expect(product.errors[:name][0]).to include("is too long")
    end

    # commentが空では出品できないことこと
    it "is invalid without a comment" do
      product = build(:product, comment: nil)
      product.valid?
      expect(product.errors[:comment]).to include("can't be blank")
    end

    # commentが10文字以内であれば出品できること
    it "is valid with a comment that has less than 10 characters " do
      product = build(:product, comment: "aaaaaaaaaa")
      expect(product).to be_valid
    end

    # commentが11文字以上であれば出品できないこと
    it "is invalid with a comment that has more than 11 characters " do
      product = build(:product, comment: "aaaaaaaaaaa")
      product.valid?
      expect(product.errors[:comment][0]).to include("is too long")
    end

    # categoryが空では出品できないこと



    # statusが空では出品できないこと
    it "is invalid without a status" do
      product = build(:product, status: nil)
      product.valid?
      expect(product.errors[:status]).to include("can't be blank")
    end

    # costchargeが空では出品できないこと
    it "is invalid without a costcharge" do
      product = build(:product, costcharge: nil)
      product.valid?
      expect(product.errors[:costcharge]).to include("can't be blank")
    end

    # delivery_wayが空では出品できないこと
    it "is invalid without a delivery_way" do
      product = build(:product, delivery_way: nil)
      product.valid?
      expect(product.errors[:delivery_way]).to include("can't be blank")
    end
    
    # delivery_areaが空では出品できないこと
    it "is invalid without a delivery_area" do
      product = build(:product, delivery_area: nil)
      product.valid?
      expect(product.errors[:delivery_area]).to include("can't be blank")
    end

    # delivery_dateが空では出品できないこと
    it "is invalid without a delivery_date" do
      product = build(:product, delivery_date: nil)
      product.valid?
      expect(product.errors[:delivery_date]).to include("can't be blank")
    end

    # priceが空では出品できないこと
    it "is invalid without a price" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    # priceが9,999,999円以内(7桁)であれば出品できること
    it "is valid with a price that has less than 7 characters " do
      product = build(:product, price: "0000000")
      expect(product).to be_valid
    end

    # priceが10,000,000円以上(8桁)であれば出品できないこと
    it "is invalid with a price that has more than 8 characters " do
      product = build(:product, price: "00000000")
      product.valid?
      expect(product.errors[:price][0]).to include("is too long")
    end
  end
end