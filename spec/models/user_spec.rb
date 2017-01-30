require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a name" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("が入力されていません。")
    end
  end
end
