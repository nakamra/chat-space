require 'rails_helper'
describe Message do
  describe '#create' do
    it "is invalid without a body" do
      message = build(:message, body: "")
      message.valid?
      expect(message.errors[:body]).to include("が入力されていません。")
    end
  end
end
