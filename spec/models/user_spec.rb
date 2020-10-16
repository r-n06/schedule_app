require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it "nicknameとemail、passwordとpassword_confirmationが正しく入力されていれば登録できる" do
    expect(@user).to be_valid
  end
  it "nicknameが空では登録できない" do
    @user.nickname = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end
  it "emailが空では登録できない" do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end
  it "passwordが空では登録できない" do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end
  it "emailが重複していると登録できない" do
    @user.save
    another_user = FactoryBot.build(:user, email: @user.email)
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
  end
  it "emailに＠が含まれていないと登録できない" do
    @user.email = "aaaa"
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
  end
  it "passwordが6文字以上でないと登録できない" do
    @user.password = "0000a"
    @user.password_confirmation = "0000a"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end
  it 'passwordが英数字混合でないと登録できない' do
    user = User.new(password: 'A' * 5)
    user.valid?
    expect(user.errors.full_messages).to include('Password is invalid')
  end
  it "passwordが英字だけでは登録できない" do
    user = User.new(password: '1' * 5)
    user.valid?
    expect(user.errors.full_messages).to include("Password is invalid")
  end
  it "passwordが数字だけでは登録できない" do
    user = User.new(password: 'a' + 'A' * 3)
    user.valid?
    expect(user.errors.full_messages).to include("Password is invalid")
  end
  it "passwordとpassword_confirmationが一致していなければ登録できない" do
    @user.password = "000001a"
    @user.password_confirmation = "000000a"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

end
