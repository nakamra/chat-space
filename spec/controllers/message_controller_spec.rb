require 'rails_helper'

describe MessagesController, type: :controller do
  let(:group) {create(:group)}
  let(:groups) {create_list(:group, 3, user_ids: user.id)}
  let(:messages) {create_list(:message, 3, group_id: group.id, user_id: user.id)}
  let(:user) { create(:user)}
  before do
  allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'GET #index' do
    before do
        login_user
        get :index, params: {group_id: group.id}
      end

      it "インスタンス変数@groupは期待した値になるか？" do
        expect(assigns(:group)).to eq group
      end

      it "インスタンス変数@groupsは期待した値になるか？" do
        expect(assigns(:groups)).to match(groups)
      end

      it "インスタンス変数@messagesは期待した値になるか？" do
        expect(assigns(:messages)).to match(messages)
      end
      
      it "renders the :index template" do
        expect(response).to render_template :index
      end

  end
end
