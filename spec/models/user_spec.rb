require 'rails_helper'

describe User do
  describe '#create' do
    it "factory_botのdataは登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "nicknameが空では登録できない" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    it "emailが空では登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "emailが重複すると登録できない" do
      create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
    it "emailが@を含まないと登録できない " do
      user = build(:user, email: "aaaaa")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end
    it "emailの@の前に文字がないと登録できない " do
      user = build(:user, email: "@aaa")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end
    it "emailの@の後に文字がないと登録できない" do
      user = build(:user, email: "aaaa@")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end
    it "emailに英数字と記号以外の文字が含まれると登録不可" do
      user = build(:user, email: "aaあa@aaa")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end
    it "passwordが空だと登録不可" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    it "passwordはあってもpassword_confirmationが空だと登録不可" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    it "passwordが6文字未満だと登録不可" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end
  end
end