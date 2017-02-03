require 'rails_helper'

describe MessagesController, type: :controller do
  let(:group) {create(:group)}
  let(:groups) {create_list(:group, 3, user_ids: user.id)}
  let(:messages) {create_list(:message, 3, group_id: group.id, user_id: user.id)}
  let(:user) {create(:user)}
  let(:message) {build(:message).attributes}
  let(:invalid_message) {build(:invalid_message).attributes}


  describe 'GET #index' do
    before do
        login_user user
        get :index, params: {group_id: group.id}
      end

      it "assigns the requested contact to @group？" do
        expect(assigns(:group)).to eq group
      end

      it "assigns the requested contact to @groups？" do
        expect(assigns(:groups)).to match(groups)
      end

      it "assigns the requested contact to @messages？" do
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
      subject {
        Proc.new {post :create, params: {group_id: group.id, message: message}}
      }
      it "saves the new @message in the datebase" do
        expect{
          subject.call
        }.to change(Message, :count).by(1)
      end

      it "redirect_to messages#index" do
        subject.call
        expect(response).to redirect_to group_messages_path(group.id)
      end
    end

    context "with invalid attributes" do
      subject {
        Proc.new {post :create, params: {group_id: group.id, message: invalid_message}}
      }
      it "does not save the new @message in the databse" do
        expect{
          subject.call
        }.not_to change(Message, :count)
      end

      it "render the :index template" do
        subject.call
        expect(response).to render_template :index
      end

      it "alert message should be present" do
        subject.call
        expect(flash[:alert]).to be_present
      end
    end
  end
end
