require 'rails_helper'

describe MessagesController, type: :controller do

  describe 'GET #index' do
    it "assigns the requested contatct to @message" do
      message = create(:message)
      get :index, id: message
      expect(assigns(:message)).to eq message
    end

    it "renders the :index template" do
    end
  end
end
