require 'rails_helper'

describe MessagesController, type: :controller do
  let(:group) {create(:group)}
  let(:groups) {create_list(:group, 3, user_ids: user.id)}
  let(:messages) {create_list(:message, 3, group_id: group.id, user_id: user.id)}
  let(:user) { create(:user)}
  let(:message) {build(:message).attributes}
  let(:invalid_message) {build(:invalid_message).attributes}


  describe 'GET #index' do
    before do
        login_user user
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

  describe 'POST #create' do
    before do
        login_user user
      end

    context "with valid attributes" do

      it "saves the new @message in the datebase" do
        expect{
        post :create, params: {group_id: group.id, message: message}
        }.to change(Message, :count).by(1)
      end

      it "redirect_to messages#index" do
        post :create, params: {group_id: group.id, message: message}
        expect(response).to redirect_to group_messages_path(group.id)
      end
    end

    context "with invalid attributes" do

      it "does not save the new @message in the databse" do
        expect{
          post :create, params: {group_id: group.id, message: invalid_message}
        }.not_to change(Message, :count)
      end

      it "render the :index template" do
        post :create, params: {group_id: group.id, message: invalid_message}
        expect(response).to render_template :index
      end
    end
  end
end
