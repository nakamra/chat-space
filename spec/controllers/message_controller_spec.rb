require 'rails_helper'

describe MessagesController, type: :controller do
  let(:group) {create(:group)}
  let(:user) { create(:user)}

  describe 'GET #index' do

      it "インスタンス変数@groupは期待した値になるか？" do
        expect(assigns(:group)).to eq group
      end

      it "renders the :index template" do
        expect(response).to render_template :index
      end

  end
end
