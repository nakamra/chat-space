require 'rails_helper'

describe MessagesController, type: :controller do
  login_user
  describe 'GET #index' do

    it "インスタンス変数@groupが期待した値になるか？" do
      group = create(:group)
      user = create(:user)
      message = create(:message, group_id: group.id, user_id: user.id)
      get :index, params: {id: message, group_id: group.id, user_id: user.id}
      expect(assigns(:group)).to eq group
    end

    it "renders the :index template" do
      group = create(:group)
      user = create(:user)
      message = create(:message, group_id: group.id, user_id: user.id)
      get :index, params: {id: message, group_id: group.id, user_id: user.id}
      expect(response).to render_template :index
    end
  end
end
